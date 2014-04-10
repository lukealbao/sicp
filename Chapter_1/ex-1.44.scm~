;; EXercise 1.43
;;
;; Question: Create a procedure repeated that takes as its argument a procedure of one parameter
;; and composes the procedure n times.

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeat i) ; i-th iteration
    (if (= i n) (lambda (x) (f x))
        (compose (repeat (+ i 1)) f)))
  (repeat 1)) ; Working

;; See that this is just a way to compose repeatedly. The inner function (g  parameter) of 
;; compose will be the original f, while the outer function will be the n repeats of f.

