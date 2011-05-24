;; From Jeff Ober's Json module.
;; http://static.artfulcode.net/newlisp/json.lsp.html

;; Andrew Pennebaker
;;
;; 2 Apr 2009
;; Fixed colon errors. Json:json->lisp used to mishandle "x":1 with no braces.

(context 'Json)

(define (simple-escape str)
	(replace {[\n\r]+} str {\n} 4)
	(replace {'} str {\'} 4)
	str)

(define (lisp->json lisp)
	(case (type-of lisp)
		("boolean" (if lisp "true" "false"))
		("quote" (lisp->json (eval lisp)))
		("symbol" (format "'%s'" (name lisp)))
		("string" (format "'%s'" (simple-escape lisp)))
		("integer" (string lisp))
		("float" (string lisp))
		("list" (if (assoc? lisp)
			(format "{ %s }"
				(join (map (fn (pair)
					(format "'%s': %s"
						(if (symbol? (pair 0))
							(name (pair 0))
							(string (pair 0)))
						(lisp->json (pair 1))))
					lisp)
					", "))
			(string "[" (join (map lisp->json lisp) ", ") "]")))
		("array" (string "[" (join (map lisp->json lisp) ", ") "]"))
		("context" (let ((values '()))
			(dotree (s lisp)
				(push (format "'%s': %s"
					(name s)
					(lisp->json (eval s)))
				values -1))
			(format "{ %s }" (join values ", "))))
		(true (throw-error (format "invalid lisp->json type: %s" lisp)))))

;;; Decoding

(setq tokens '("{" "}" "[" "]" "," ":"))

(define (extract-string str)
	(replace (format "\\\\%s" (first str)) str 4)
	(trim str (first str)))

(define (parse-string target)
	(if (or (starts-with text "\"") (starts-with text "'"))
		(let ((found (find (format "(?<!\\\\)%s" (first target)) (rest target) 4)))
			(if found
				(list (slice target 0 (+ 2 found)) (slice target (+ 2 found)))
				(throw-error (format "unbalanced quotes: %s" (slice target 0 50)))))
		(throw-error "target does not begin with string quote")))

(define (token ch)
	(case ch
		("{" 'OPEN-BRACE)
		("}" 'CLOSE-BRACE)
		("[" 'OPEN-BRACKET)
		("]" 'CLOSE-BRACKET)
		("," 'COMMA)
		(":" 'COLON)
		("true" true)
		("false" nil)
		(true (cond
			((regex "^-?[\\d\\.]+(?:[eE][+-]?\\d+)?$" ch)
				(eval-string ch))
			((or (starts-with ch "\"") (starts-with ch "'"))
				(extract-string ch))
			(true ch)))))

(define (tokenize json, text (parts '()))
	(setq text json)
	(while text
		(cond
			;; zero length text
			((null? text) (setq text nil))
			;; ignore whitespace
			((starts-with text "\\s" 4)
				(setq text (rest text)))
			;; keywords
			((starts-with text "true")
				(push (token "true") parts -1)
				(setq text (slice text 4)))
			((starts-with text "false")
				(push (token "false") parts -1)
				(setq text (slice text 5)))
			;; tokenize special chars
			((find (text 0) tokens)
				(push (token (text 0)) parts -1)
				(setq text (rest text)))
			;; tokenize entires strings as single entities
			((or (starts-with text "\"") (starts-with text "'"))
				(let ((str (parse-string text)))
					(push (token (str 0)) parts -1)
					(setq text (str 1))))
			;; get other tokens
			(true
				(let ((next (find "[{}\\[\\],:'\"\\s]" text 4)))
					(if next
						(begin
							(push (token (slice text 0 next)) parts -1)
							(setq text (slice text next)))
						(begin
							(push text parts -1)
							(setq text nil)))))))
	parts)

(define (lex tokens, (loc '(-1)) (tree '())) ; A truly imperative solution :)
	;; Correct for "x":1 without braces.
	(setf temp '())
	(let ((len (length tokens)) (i 0))
	(while (< i (- len 1))
		(let ((t (tokens i)) (u nil) (v nil))
		(if (< (+ i 1) len) (setf u (tokens (+ i 1))))
		(if (< (+ i 2) len) (setf v (tokens (+ i 2))))

		(if (and (!= u nil) (!= v nil) (= u 'COLON) (!= v 'OPEN-BRACE))
			(begin
				(push 'OPEN-BRACE temp -1)
				(push t temp -1)
				(push v temp -1)
				(push 'CLOSE-BRACE temp -1)
				(setf i (+ i 2)))
			(push t temp -1))

		(setf i (+ i 1)))))
	(setf tokens temp)

	;; Generate tree
	(dolist (tok tokens)
		(case tok
			(OPEN-BRACKET
				(push '(ARRAY) tree loc)
				(push -1 loc))
			(CLOSE-BRACKET (pop loc))
			(OPEN-BRACE
				(push '(OBJECT) tree loc)
				(push -1 loc))
			(CLOSE-BRACE (pop loc))
			(COMMA)
			(COLON)
			(true
				(push tok tree loc))))

	;; Associate pairs
	(set-ref-all '(OBJECT *) tree
		(cons 'OBJECT (map (fn (p) (list (first p) (last p)))
			(explode (rest $0) 3)))
		'match)

	;; Pop off array markers
	(while (setq loc (ref 'ARRAY tree))
		(pop tree loc))

	;; Pop off object markers
	(while (setq loc (ref 'OBJECT tree))
		(pop tree loc))

	tree)

(define (json->lisp json)
	(first (lex (tokenize json))))

(context MAIN)