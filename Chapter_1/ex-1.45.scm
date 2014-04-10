;; EXercise 1.45
;;
;; QUESTION: Average damping y -> x/y^2 will give the cube root, just as average damping
;; y -> x/y converges on the square root. But finding the fixed point of the quartic root requires
;; average damping twice (i.e., (avg-damp (avg-damp f))). 
;;
;; Do some experiments using fixed-point, average-damp, and repeated to derive a generalized procedure
;; to compute n-th roots with the map of y -> x/y^(n-1). 

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1) f
      (compose f (repeated f (- n 1)))))


(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) 
    (/ (+ (f x)
          x)
       2)))

(define (nth-power x n) ;; Later learned that there is an (expt b n) procedure. :)
  (define (mult i) ; i-th iteration
    (if (= i n) x
        (* x (mult (+ i 1)))))
  (if (= n 0) 1 
      (mult 1)))

(define (nth-root n)
 (let ((x-damps 3)) ; 1:3, 2:7, 3:15, 4:31; actually (log_2 n) - 1)
  (lambda (x)
   (define (xy-rational y)
     (/ x (nth-power y (- n 1))))
   (fixed-point ((repeated average-damp x-damps) xy-rational)
                1.0)))) ; Working.

;; Okay. The confusing part was how to call the nested functions in nth-root. As n grew, the accuracy of
;; the answer drifted. 
;;
;; We had erroneously called (fixed-point (repeated (average-damp xy-rational) x-damps) 1.0).
;;
;; This repeated the average-damped function. So we were searching for a fixed point of the x-damps 
;; repeats of the average-damped xy-rational function - rather than looking for the fixed point of the
;; x-damps average-damped xy-rational function. Whew!
;;
;; So we were looking for the fixed point of:
;;
;; ((average damp xy-rational) ((average-damp xy-rational) y))
