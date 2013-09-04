;; HELPER FUNCTIONS
(define (square x) (* x x))
(define (even? x) (= 0 (modulo x 2)))


;; Create a function that uses successive squaring to calculate
;; b^n with a logarithmic order of growth in time, and in constant
;; space.
;;
;; The authors suggest keeping a separate state variable, a, such that
;; the product a*b^n is a constant. Further, a should begin at 1 and
;; when the procedure finishes, a is the final answer. This was indeed
;; an essential hint to writing the procedure in constant space, but
;; it looks as though there's no actual need to keep a as a state variable!
;; State is maintained in the parameter b.
;; 
;; However, this does not satisfy the test that a properly iterative procedure
;; could have its state stopped and started at any given time, since b and n
;; are constantly changing with each state -- in which case, there's no way to 
;; reference the original problem at any stage. Perhaps the book's solution would
;; account for this, but I can't see that it would be a terribly big improvement.

(define (fast-iter-exp b n)
    (cond ((= n 0) 1)
          ((= n 2) (square b))
          ((even? n) (fast-iter-exp (square b) (/ n 2)))
          (else (* b (fast-iter-exp b (- n 1))))))
