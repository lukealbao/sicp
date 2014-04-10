;; EXercise 1.44
;;
;; QUESTION A: Create a smoothing function that takes as input a procedure f and returns a
;; procedure that computes f and returns the smoothed f. The smoothed version of f is the
;; function whose value at x is the average of f(x - dx), f(x), and f(x + dx).

(define (smooth f)
 (let ((dx 0.00001))
  (lambda (x)
   (/ (+ (f (- x dx))
         (f x)
         (f (+ x dx)))
       3))))

;; QUESTION B: Show how to generate the n-fold smoothed version of f. Use compose and repeated
;; from ex-1.43.   

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeat i) ; i-th iteration
    (if (= i n) (lambda (x) (f x))
        (compose (repeat (+ i 1)) f)))
  (repeat 1)) 

(define (n-fold-smooth f n)
  (repeated (smooth f) n))
