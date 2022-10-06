; Cube root of x if y is an proximation, this is a better aproximation:
; (x/y2 + 2y)/3

(define (improve guess x)
  (define y guess)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good-enough? guess new-guess)
  (define r (abs (/ (- guess new-guess) guess)))
  (and (< r 0.00000001)))

(define (cubet-iter guess x)
  (define new-guess (improve guess x))
  (if (good-enough? guess new-guess)
      guess
      (cubet-iter (improve guess x)
                 x)))
(define (cubet x)
   (cubet-iter 1.0 x))
