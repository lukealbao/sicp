#! /usr/bin/env scm

(define (cube x) (* x x x))
(define (abs x) (if (> x 0) x (- x)))
(define (avg x y z) (/ (+ x y z) 3))


(define (cube_root_iter guess x)    
    
    (if (close_enough? guess x)
        guess
        (cube_root_iter (improve guess x) x)))

    (define (close_enough? guess a)
        (< (abs (- (improve guess a) guess)) 0.001))
    (define (improve guess x)
        (/ (+ (/ x (* guess guess)) 
              (* 2 guess)) 3))
    
        
(define (cube_root x) (cube_root_iter 1.0 x))
