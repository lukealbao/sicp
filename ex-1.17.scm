(define (*2 x) (+ x x))
(define (half x) (/ x 2))

(define (mult a b)
    (cond ((= b 1) a)
          ((= 1 (remainder b 2))
                (+ a (mult a (- b 1))))
          (else (mult (*2 a) (half b)))))


; This procedure is meant to show the efficiency of chaining the double and half
; procedure to calculate multiplication.
;
;
; But I'm not sure that this is actually the most efficient, timewise. For large
; odd values of b, the number of steps is more than linear (eyeballing here).
; This is because the need to evaluate (+ a (mult a (- b 1))), which has three
; individual terms in it, every time an iteration calls a b that is odd. For example,
; evaluating a procedure where b is 30 will require you to evaluate these three
; extra terms three times (15, 7, 3).
;
; Adding a helper function that keeps track of a simple state variable will allow 
; this to run in linear time:

(define (mult a b)
  (define (mult-linear a b sum)
    (if (= b 0) a
	(mult-linear a (- 1 b) (+ sum a))))
  (multi-linear a b 0))

; But that wasn't what the exercise required, was it...
