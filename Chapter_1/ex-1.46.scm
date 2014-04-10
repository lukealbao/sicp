;; Exercise 1.46
;;
;; Create an iterative-improve method that takes two procedures as arguments: a method for telling if
;; a guess is good enough, and a method for improving a guess. It should return a procedure that itself
;; takes a guess as an argument and improves it until it is good enough.

(define (iterative-improve check improve)
  (define (get-best x)
    (if (check x) x
        (get-best (improve x))))
  (lambda (x) (get-best x)))

;; Now rewrite sqrt and fixed-point in terms of iterative-improve.

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x) (< (abs (- x (f x))) 0.00001))
                     f)
                       first-guess)) ; Working.

(define (sqrt n)
  ((iterative-improve (lambda (x) (< (abs (- x (/ n x))) 0.0001))
                     (lambda (x) (/ (+ x (/ n x)) 2))
                     ) 1.0))
                     




