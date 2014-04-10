;; Exercise 1.37
;;
;; A continued fraction expansion of (N_i / (D_i + N_(i+1))) in which N_i and D_i all evaluate
;; to 1 is equal to 1/phi.
;;
;; QUESTION A: Write a procedure cont-frac such that evaluating (cont-frac n d k) computes the
;; value of the k-term finite continued fraction. n and d are each procedures of one argument
;; (the index term i) which return the N_i and D_i terms of the continued fraction. Check your 
;; procedure by calculating 1/phi using:
;;
;; (cont-frac (lambda (i) 1.0)
;;            (lambda (i) 1.0)
;;            k)

(define (cont-frac n d k)
  (define (f i)
    (if (= i k) (d i)
        (/ (n i) (+ (d i) (f (+ i 1))))))
  (f 1))

;; Version is working. Takes 10 terms (k) to reach 4 decimal places of accuracy.
;; NOTE: it only works when using 1 for the arguments n and d. If you use (lambda (i) 1.0) as
;; the problem seems to suggest, you get type errors. Not sure what that's about.
;;
;;QUESTION B: You wrote a recursive process. Now write an iterative version.

(define (i-cont-frac n d k)
  (define (f i result)
    (if (= i k) result
        (f (+ i 1) (/ (n i) (+ (d i) result)))))
  (f 1 1))
