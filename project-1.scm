;;; PROBLEM 1: Physics ;;;
;;; Given quadratic formula for position in 1 dimension: p = ((a^2)/2)t^2 + vt + u

(define position
  (lambda (a v u t)
    (+ (* (/ a 2) (square t))
        (* v t)
        u))) ; tested OK

;;; PROBLEM 2: Finding Roots ;;;
;;; Implement quadratic formula with addition in the numerator. Return false if the
;;; radicand is less than zero.

(define root1 
  (lambda (a b c)
    (if (> 0 (- (square b) (* 4 a c))) #f
    (/ (+ (- b)
        (sqrt (- (square b) (* 4 a c))))
        (* 2 a)))))  ;tested OK

;;; Now implement quadratic formula with subtraction in the numerator.
(define root2 
  (lambda (a b c)
    (if (> 0 (- (square b) (* 4 a c))) #f
    (/ (- (- b)
        (sqrt (- (square b) (* 4 a c))))
        (* 2 a)))))  ; tested OK

;;; PROBLEM 3: Flight Time ;;;
;;; Given initial elevation and instantaneous vertical velocity, 
;;; create a procedure to calculate the time until it hits the ground.
;;;
;;; Problem set up as follows:
;;;;;; (define time-to-impact
;;;;;;   (lambda (vertical-velocity elevation)
;;;;;;     YOUR-CODE-HERE))
;;;
;;; The way to do it capitalizes on the 1-D quadratic equation that calculates 
;;; position with respect to time, i.e., the (position) procedure above.
;;; The vector in question at this stage is vertical.
;;; the acceleration coefficient is gravity (-9.8), the velocity coefficient is given
;;; as a parameter when calling the procedure, and the initial position coefficient (u)
;;; is given when calling it as well. Just plug these into the (root) procedures to
;;; find the times (t) when elevation is at zero. The conditional checks to see if
;;; the time is negative - which is, of course, not the answer we're after.

(define time-to-impact
  (lambda (vertical-velocity elevation)
    (if (> 0 (root1 (/ (- 9.8) 2) vertical-velocity elevation)) 
        (root2 (/ (- 9.8) 2) vertical-velocity elevation)
        (root1 (/ (- 9.8) 2) vertical-velocity elevation))))  ;tested OK
        
;;; PROBLEM 3A: Now can you implement a version that uses an arbitrary impact elevation?
;;; Answer: of course. Just alter the (u) parameter when calling root so that the initial
;;; "elevation" is the difference between the real initial elevation and the target

(define time-to-height
  (lambda (vertical-velocity elevation target-elevation)
    (if (> 0 (root1 (/ (- 9.8) 2) vertical-velocity (- elevation target-elevation))) 
        (root2 (/ (- 9.8) 2) vertical-velocity (- elevation target-elevation))
        (root1 (/ (- 9.8) 2) vertical-velocity (- elevation target-elevation)))))  ;tested OK
