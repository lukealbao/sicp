;; Given the procedure:

(define (f g)
  (g 2))

;; We see that:

(f square)

;; returns 4. And:

(f (lambda (x) (* x (+ x 1))))

;; returns 6.

;; QUESTION: What would happen if we call (f f)? Explain.
;;
;; Answer: we would get the result of the Scheme interpreter evaluating (2 2), which 
;; probably returns an error about 2 not being a procedure.
;;
;; Explanation: Evaluating (f 2) first uses 2 as the argument for g. Then when it eval-
;; uates the body of f, it substitutes 2 for g, which gives us (2 2).y
