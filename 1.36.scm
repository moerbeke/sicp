(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess) (display " ---> ") (display next) (newline)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (fixed-point-ad f first-guess)
  (define (average a b) (/ (+ a b) 2))
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess) (display " ---> ") (display next) (newline)
      (if (close-enough? guess next)
        next
        (try (average next guess)))))
  (try first-guess))

(define (log10 x)
  (/ (log x) (log 10)))

(define xx
  (fixed-point (lambda(x) (/ (log10 1000) (log10 x)))
               5.0))

(define xx-ad
  (fixed-point-ad (lambda(x) (/ (log10 1000) (log10 x)))
               2.0))
