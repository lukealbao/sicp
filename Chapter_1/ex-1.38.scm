;; Exercise 1.38
;;
;; QUESTION: Use the cont-frac procedure to write a new procedure to approximate e. 
;;
;; We will use Euler's fraction expansion for e - 2. In this fraction, the N_i are all 1, and
;; the D_i are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8....

(define (cont-frac n d k)
  (define (f i result)
    (if (= i 0) result
        (f (- i 1) (/ (n i) (+ (d i) result)))))
  (f k (/ (n 1) (+ (d 1)))))

;; So the procedure will call cont-frac with a special function for the d arguments:

(define (divisible? a b) (= (remainder a b) 0)) ; is a divisible by b? 
(define (eulers-e k)
  (+ 2
     (cont-frac (lambda (x) 1)
                (lambda (i) (if (divisible? (+ i 1) 3) (* (/ (+ i 1) 3) 2) 1))
                k)))

;; It was not clear in ex-1.37, where we calculated phi, that the iterative version of 
;; cont-frac was building upside down. Because n and d values were constant there, it made 
;; no difference.
;;
;; Here, however, we initially set up cont-frac with an incrementing i, and calling f with
;; i = 1. Because of the way the procedure expands the fraction, the largest i-th term for
;; d was at the top level. In order to flip that, we must have the bottom term be called with
;; the highest i-th term in the series, and the way to implement that is to call it with a 
;; decrementing i with i = k at the initial call.
