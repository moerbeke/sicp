(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))

(define (sqrt-custom x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (pow x n)
  (if (= n 1)
    x
    (* x (pow x (- n 1)))))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (pow y 2))))
               1.0))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

(define (4th-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (pow y 3))))
               1.0))

(define (log-2 x)
  (/ (log x) (log 2)))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (truncate (log-2 n))) (lambda (y) (/ x (pow y (- n 1)))))
               1.0))
