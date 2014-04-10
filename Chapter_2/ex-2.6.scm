;; Exercise 2.6
;;
;; Let's implement some Church numerals! The confusing thing here is
;; that these numbers do not stand alone. They are operators that oper-
;; ate on functions.
;; 
;; That is, "four" only exists here to say "do something four times".
;; It follows, that impleentation is in the following form:
;;
;; ((four inc) 5) => 9 << here, inc is (lambda (x) (+ x 1))) >>
;;
;; First step, define one and two. zero and add-1 are given:

(define zero (lambda (f) (lambda (x) x))) ; As "data", it taks 0 arguments.

(define (add-1 n) ; Receives a *Church numeral* as an argument.
  (lambda (f) ; Returns a new Church numeral procedure, enclosing n,
    (lambda (x) ; Which takes any argument
      (f ((n f) x))))) ; And applies the function to it n times.

;; Evaluating (add-1 zero) returns a procedure that looks like this:
;;
;; (lambda (f) (lambda (x) 
;;               (f ((lambda (f) (lambda (x) x) f) x))))
;;
;; This reduces to:
;;
;; (lambda (f) (lambda (x) (f x))
;;
;; We now have a definition of one. It will take a function and return
;; a new function, which will take an argument and return the result of
;; applying the function onece to the argument. 

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;; Step 2 is to implement addition for Church numerals.

(define (plus m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))
      
;; Test
(((plus one two) (lambda (x) (+ x 1))) 10) ; => 11
      
