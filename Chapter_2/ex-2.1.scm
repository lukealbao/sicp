;; EXERCISE 2.1
;;
;; Make a better version of make-rat procedure that will both use gcd, as well
;; as accomodate proper formatting for negative arguments.

(define (make-rat numer denom)
  (let ((g (gcd numer denom)))
    (if (< denom 0)
        (cons (* (/ numer g) (- 1)) (* (/ denom g) (- 1)))
    (cons (/ numer g) (/ denom g)))))
