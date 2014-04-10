;; Exercise 1.39
;;
;; Write a procedure that calculates the tangent of an angle using Lambert's fraction expansion.
;; 
;; x / (1 - (x^2 / 3 - (x^2 / 5 -)))
;;

(define (tan-cf x k)
  (define (n i) (if (= i 1) x (* x x))) 
  (define (d i) (if (= i 1) 1 (- (* i 2) 1)))
  (define (f i)
    (if (= i k) (n i)
        (/ (n i) (- (d i) (f (+ i 1))))))
  (f 1))

;; Note: it takes a significant k amount to achieve a good approximation. 


