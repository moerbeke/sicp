(define (iterative-improve good-enough? improve)
  (define (iter-guess guess)
    (if (good-enough? guess)
      guess
      (iter-guess (improve guess))))
  (lambda (guess) (iter-guess guess)))

(define tolerance 0.00001)

(define (average a b) (/ (+ a b) 2))

(define (sqrt-iter guess x)
  ((iterative-improve
     (lambda (guess) (< (abs (- x (square guess))) tolerance))
     (lambda (guess) (average guess (/ x guess))))
   guess))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (fixed-point f first-guess)
  ((iterative-improve
     (lambda (guess) (< (abs (- guess (f guess))) tolerance))
     (lambda (guess) (average guess (f guess))))
   first-guess))
