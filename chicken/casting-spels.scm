(define *objects* '(whiskey-bottle bucket frog chain))

(define *map* '((living-room (You are in the living-room of a wizards house. There is a wizard snoring loudly on the couch.)
                             (west door garden)
                             (upstairs stairway attic))
                (garden (You are in a beautiful garden. There is a well in front of you.)
                        (east door living-room))
                (attic (You are in the attic of the wizard's house. There is a giant welding torch in the corner.)
                       (downstairs stairway living-room))))

(define *object-locations*
  '(
    (whiskey-bottle living-room)
    (bucket living-room)
    (chain garden)
    (frog garden)))

(define *location* 'living-room)

(define (describe-location location map)
    (second (assoc location map)))

(define (describe-path path)
    `(There is a ,(second path) going ,(car path) from here.))

(define (describe-paths location map)
    (apply append (map describe-path (cddr (assoc location map)))))

(define (is-at obj loc obj-loc)
    (eq? (second (assoc obj obj-loc)) loc))

(define (remove-if-not pred? lst)
  (let remove-if-not ((lst lst)
		      (result '()))
    (cond ((null? lst) (reverse result))
	  ((pred? (car lst)) (remove-if-not (cdr lst) (cons (car lst) result)))
	  (else (remove-if-not (cdr lst) result)))))

(define (describe-floor loc objs obj-loc)
    (append (map (lambda (x)
                      `(You see a ,x on the floor.))
                    (remove-if-not (lambda (x)
                                     (is-at x loc obj-loc))
                                   objs))))

(define (look)
  (print (append (describe-location *location* *map*)
                 (describe-paths *location* *map*)
                 (describe-floor *location* *objects* *object-locations*))))

(define (walk-direction direction)
    (let ((next (assoc direction (cddr (assoc *location* *map*)))))
      (cond (next (set! *location* (third next)) (look))
            (#t '(You cant go that way.)))))

(define-macro defspel
  (lambda (func arg)
    `(func ,arg)))

(defspel walk (walk-direction direction))

(define (pickup-object object)
    (cond
      (
       (is-at object *location* *object-locations*)
       (push (list object 'body) *object-locations*)
       `(You are now carrying the ,object))
      (#t '(you cannot get that.))))
