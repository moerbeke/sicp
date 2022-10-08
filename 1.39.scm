(load "1.37.a.scm")

; Lambert continued fraction for tan(x):
; N_i = x, i = 1
; N_i = -x^2, i > 1
; D_i = 2*i-1
(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- 0 (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))
