#!/usr/bin/env newlisp

;; Andrew Pennebaker

;; file: module.lsp

;; Calls main only if this script is being run by itself,
;; not if the script is being loaded by another.

(context 'MODULE)

(define (main)
	;; KOPIMI

	(exit))

(if (find "module" (main-args 1)) (main))

(context MAIN)