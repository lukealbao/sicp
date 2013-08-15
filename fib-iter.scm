// a working version of fibonacci -- am I off by one, though?

(define (fib n)
  (if (< n 3) 1
  (+ (fib (- n 1)) (fib (- n 2)))))
  

// Attempt at constant-space iterable version. Something wrong right now. Syntax? 

(define (fib-iter n)
  (fib-iter-helper n 1 0 0 1)
  (define (fib-iter-helper goal iter a b sum)
    (if (= goal iter) sum
         (fib-iter-helper goal (+ iter 1) sum a (+ sum a)))))
