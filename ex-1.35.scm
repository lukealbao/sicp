;; Exercise 1.35
;; QUESTION: Show that phi is a fixed point of the transformation x: (1 + 1/x), and use
;; this fact to compute phi using the fixed-point procedure.
;;
;; The fixed-point procedure is given:

(define tolerance 0.00001) 
(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess) ; if (f x) is close enough to x, return (f x)
          next
      (try next)))) ; else test (f (f x))
  (try first-guess))

;; We simply run the fixed-point procedure with 

(lambda (x) (+ 1 (/ 1 x))) as the argument

;; for f. Indeed, doing so returns Phi to the 5th significant decimal, as defined by the
;; tolerance definition.
;;
;; Initially, we ran the fixed-point procedure with 2 as the argument for first-guess, since
;; we know that phi is the limit of the sum (1/x_i). But we get the correct answer for any
;; real number first-guess. This is interesting. We also note that a first guess of 1,000,000
;; does not significantly affect run time.
;;
;; So the fixed-point calculation does not calculate the same way that the summation calculation
;; whose convergence it tests does. That is sum(1/x_i) does not iterate through i, because it
;; does not rely on a specific first-guess.
;;
;; Perhaps for this reason, the lambda must be in the form of (1 + 1/x), rather than the more
;; generalized sum(1/x) -- because the calculation never iterates or recurses in the arithmetic
;; sequence, but rather simply tests whether x = (1 + 1/x)
