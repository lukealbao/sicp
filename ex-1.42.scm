;; Exercise 1.42
;;
;; Question: Write a composition procedure

(define (compose f g)
  (lambda (x) (f (g x))))
