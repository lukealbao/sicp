(define (square n) (* n n))
(define (smallest-divisor n)
  (define (divides? numerator denominator)
    (= (remainder denominator numerator) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
	  ((divides? test-divisor n) test-divisor)
	  (else (find-divisor n (+ 1 test-divisor)))))
  (find-divisor n 2))

;; Find the following:
;;
;; (smallest-divisor 199) >> 199
;;
;; (smallest-divisor 1999) >> 1999
;;
;; (smallest-divisor 19999) >> 7
