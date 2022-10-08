(load "1.37.a.scm")

; Euler's continued fraction for e-2:
; N_i = 1
; D_i = (i+1)*2/3  i+1 multiple of 3
; D_i = 1          i+1 not multiple of 3
(define e
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i) (if (= (remainder (+ i 1) 3) 0)
                              (* (/ 2 3) (+ i 1))
                              1))
                100)))
