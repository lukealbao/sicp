;; Exercise 1.36
;;
;; QUESTION A: Modify fixed-point so that it prints the sequence of its approximations using the
;; newline and display primitives. 

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess nth-try)
    (display nth-try) (display '-)
    (display guess) ; for each try, print it.
    (newline) 
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next (+ 1 nth-try)))))
  (try first-guess 1))

;; QUESTION B: use this procedure to find a solution to x^x = 1000 by finding a fixed point of
;; x: log(1000)/log(x). Compare the number of steps required with and without average damping.
;; 
;; To implement this, we simply call it with:

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) first-guess)

;; Which indeed has fewer guesses than calling:

(fixed-point (lambda (x) (/ (log 1000) (log x))) first-guess)

;; It also returns values when first-guess is a very large number, which will cause the non-avg
;; damped version to fail.
;;
;; So what's going on here with average damping?
;;
;; The body of lambda is what will be called by (try) for the next try, such that when
;;
;; (close-enough? x (f x))
;; 
;; returns false, the next try is (f (f x)).
;;
;; Average damping means that the next try will call (f (average x (f x))) - which will always
;; be a smaller jump - "damped" - than going from x to (f x). 
;;
;; But this is still a bit of a mystery. It's not helpful on ex-1.35, where we calculate phi by
;; finding fixed-point of (1 + 1/x). The damped lambda takes more tries than the non-damped 
;; version. 
;; 
;; Must do more investigation...

