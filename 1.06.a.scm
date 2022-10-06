(define (average x y)
  (display "average " ) (display x) (display " ") (display y) (newline)
  (/ (+ x y) 2))

(define (improve guess x)
  (display "improve " ) (display guess) (display " ") (display x) (newline)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (display "good-enough? " ) (display guess) (display " ") (display x) (newline)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (display "new-if") (newline)
  (if predicate
      then-clause
      else-clause))

(define (sqrt-iter guess x)
  (display "sqrt-iter " ) (display guess) (display " ") (display x) (newline)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
(define (sqrt x)
  (display "sqrt") (newline)
  (sqrt-iter 1.0 x))
