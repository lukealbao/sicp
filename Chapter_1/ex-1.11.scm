(define (f n)
    (define (g a b c count top)
      (if (or (= top count) (< a 3)) a
        (g (+ a (* 2 b) (* 3 c))
            (* 2 a)
            (* 3 b)
            (+ count 1)
            top)))
    (if (< n 3) n        
      (g 3 2 1 1 n)))


#| 

Lots of help to be found at
http://stackoverflow.com/questions/2365993/no-idea-how-to-solve-sicp-exercise-1-11

The idea is to start with your base case and work up. Since that is a known state,you
work from there -- what you know -- and then figure out how those elements of state
change with each iteration.

|#
