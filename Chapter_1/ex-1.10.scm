(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
                 
#| QUESTION

What are the following values:

(A 1 10) => 1024
(A 2 4) => 65536
(A 3 3) => 65536

|#

#| QUESTION                 

Give a precise mathematical definition of the following:

 (define (f n) (A 0 n)) => (f n) = 2n
 (define (g n) (A 1 n)) => (g n) = 2^n
 (define (h n) (A 2 n)) => (h n) = ???
 (define (k n) (* 5 n n)) => 5n^2
 

|# 

 
#| TRYING TO FIGURE OUT (h)

 (h 3)
 (A 2 3)
 (A 1 (A 2 2))
 (A 1 (A 1 (A 2 1)))
 (A 1 (A 1 2))
 (A 1 (A 0 (A 1 1)))
 (A 1 (A 0 2))
 (A 1 4)
 (A 0 (A 1 3))
 (A 0 (A 0 (A 1 2)))
 (A 0 (A 0 (A 0 (A 1 1))))
 (A 0 (A 0 (A 0 2)))
 (A 0 (A 0 4))
 (A 0 8)
 16
 |#
