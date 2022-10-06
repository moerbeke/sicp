(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 1 10) = 1024
; (A 2 4) = 65536
; (A 3 3) = 65536

(define (f n) (A 0 n))
; (f n) = 2n

(define (g n) (A 1 n))
; (g n) = 2^n

(define (h n) (A 2 n))
; (h 0) = 0
; (h 1) = 2 = 2^1 = 2^(2^0) = 2
; (h 2) = 4 = 2^2 = 2^(2^1) = 2^2 = 2^(h 1)
; (h 3) = 16 = 2^4 = 2^(2^2) = 2^(2^2) = 2^(h 2)
; (h 4) = 65536 = 2^16 = 2^(2^4) = 2^(2^(2^2)) = 2^(h 3)
; (h 5) = 2^65536 = 2^(2^16) = 2^(2^(2^(2^2))) = 2^(h 4)
; (h n) = 0, if n = 0
;         2, if n = 1
;         2^(h n-1), if n > 1

(define (k n) (* 5 n n))
; (k n) = 5n^2

(define (r x n)
  (cond ((> n 0)
         (display n) (display " --> ") (display (x n)) (newline)
         (repeat x (- n 1)))))
