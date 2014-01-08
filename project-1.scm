;;; You're going to need:

(define square (lambda (x) (* x x)))

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

;;; PROBLEM 4: Flight Distance ;;;
;;; Solve in two dimensions. Ball is hit at angle 'alpha' from the horizontal (in degrees)
;;; and from an initial elevation (in meters). We wish to calculate the horizontal 
;;; distance travelled for a given velocity.
;;;
;;; Note that the vector of the path travelled can be viewed as the hypotenuse of a right
;;; triangle, where velocity vectors 'v_x' and 'v_y' are the legs on the right angle. Thus
;;; we will be solving for 'v_x', while the velocity given is along 'v_hypot', and gravity
;;; pulls down on 'v_y'. 
;;; 
;;; So we will make use of procedures (sin) and (cos) to calculate 'v_x' and 'v_y'. To do
;;; so, let's make use of:

(define degrees-to-radians 
  (lambda (deg) (/ (* deg pi) 180.)))

;;; We suspect that the form of the procedure will be the same as the 1-D version, making
;;; the necessary substitutions:
;;; 
;;; Given bat velocity v, we define v_x = cos(angle)*v and v_y = sin(angle)*v.
;;; Acceleration in y is via gravity, which gives us a_y = -9.8
;;; Therefore, we must first run the (time-to-impact) procedure using v_y as the initial 
;;; velocity to arrive at time t that the ball will be in flight. The next step is to
;;; solve the total horizontal distance by multiplying v_x by the t returned.
;;;
;;; The problem is set up with:
;;;
;;; (define travel-distance-simple
;;;   (lambda (elevation velocity angle)
;;;     YOUR-CODE-HERE))

(define travel-distance-simple
  (lambda (elevation velocity angle)
    (define t (time-to-impact (* (sin (degrees-to-radians angle)) velocity) elevation))
    (* (* (cos (degrees-to-radians angle)) velocity) t)))

;;; We are asked what the values are for a hit from a height of 1 meter, an initial
;;; velocity of 45 kph, and angles at 0, 45, and 90 degrees:
;;;
;;; 0 degrees: 20.329 meters | 45 degrees: 207.628 meters | 90 degrees: 2.53e-14 meters
;;;
;;; Note, 207 meters seems high for even a great hit. We'll see this soon.
