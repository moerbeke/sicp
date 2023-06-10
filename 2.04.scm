(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;(define p1 (cons 1 2))
;(define p1 (lambda (m) (m 1 2)))
;p1 <- (lambda (m) (m 1 2)))
;
;(car p1)
;(car (lambda (m) (m 1 2)))
;((lambda (m) (m 1 2)) (lambda (p q) p))
;((lambda (p q) p) 1 2)
;1
