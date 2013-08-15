; Recursive process for computing nth fibonacci. Space is O(fib(n)). 
; As the fibs on the third line are deferred with each iteration, the 
; memory required to hold them grows exponentially.

(define (fib n)
  (if (< n 3) 1
  (+ (fib (- n 1)) (fib (- n 2)))))
  
;;;;;;;;;

; Iterative process for computing nth fibonacci. With the state variables
; of fib-iter-helper holding the state, the memory required is constant, and 
; thus it grows linearly with respect to n in the time domain, but runs in 
; constant space.

; Note: first version was getting syntax errors. The error we got was because 
; the definition of fib-iter called fib-iter-helper before defining it. I
; thought definitions were parsed competely first, so it wouldn't matter. 
; It looks like it did.

(define (fib-iter n)
  (define (fib-iter-helper goal iter a b sum)
    (if (= goal iter) sum
         (fib-iter-helper goal (+ iter 1) sum a (+ sum a))))
  (fib-iter-helper n 1 0 0 1))
