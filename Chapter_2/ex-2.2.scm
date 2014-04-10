;; EXERCISE 2.2
;;
;; Make a constructor make-segment and selectors start-segment and end-segment.
;; To do this, make a constructor make-point and its selectors x-point and
;; y-point. Finally, create a midpoint-segment procedure.

(define (make-segment start end) (cons start end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (midpoint-segment segment)
  (make-point (/ (+ (x-point (start-segment segment))
                    (x-point (end-segment segment)))
                  2)
              (/ (+ (y-point (start-segment segment))
                    (y-point (end-segment segment)))
                  2)))

;; Test them with:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))
