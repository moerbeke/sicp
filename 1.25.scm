(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (expmod base exp n)
  (display "expmod ") (display base) (display " ") (display exp) (display " ") (display n) (newline)
  (remainder (fast-expt base exp) n))

(define (fast-expt b n)
  (display "fast-expt ") (display b) (display " ") (display n) (newline)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (display "even? ") (display n) (newline)
  (= (remainder n 2) 0))

(define (expmod-slow base exp n)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) n))
                    n))
        (else
         (remainder (* base (expmod base (- exp 1) n))
                    n))))

(define (fast-prime? n times)
  (define (fermat-test n)
    (define (try-it a)
      (display "try-it ") (display a) (newline)
      (= (expmod a n n) a))
    (display "fermat-test? ") (display n) (newline)
    (try-it (+ 1 (random (- n 1)))))
  (display "fast-prime? ") (display n) (display " ") (display times) (newline)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

; I think she is correct: the procedure is correct.
;
; I think that this procedure would not serve for our fast prime tester.
; It rakes it too long to complete the last operation, but I don't know why.
; A very long operation at the end??
