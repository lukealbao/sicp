;; Exercise 1.41 
;;
;; QUESTION A: Define a procedure (double) that takes a procedure of one argument and returns a
;; procedure that applies the original procedure twice.


(define (double f)
  (lambda (x)
    (f (f x))))



;; QUESTION B: What value is returne by:
;; 
;; (((double (double double)) inc) 5)
;;
;; Guess: 10. Outer double doubles the inner double pair, leaving four doubles altogether, which
;; when applied to inc, will increment 5 by 5.
