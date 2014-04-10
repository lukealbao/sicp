;; Exercise 1.40
;;
;; QUESTION: Define a procedure cubic that can be used with the newtons-method procedure to 
;; approximate the zeros of x^3 + ax^2 + bx + c. It should take the form of:
;;
;; (newtons-method (cubic a b c) 1)

(define (cubic a b c)
  (lambda (x)
    (let ((cube (lambda (x) (* x x x)))
          (square (lambda (x) (* x x))))
     (+ (cube x)
        (* a (square x))
        (* b x)
        c)))) ; Working
