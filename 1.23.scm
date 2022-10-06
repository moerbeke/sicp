(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (next test-divisor)
    (if (= test-divisor 2) 3 (+ test-divisor 2)))
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (even? n)
  (= (remainder n 2) 0))

(define (timed-primes-test from)
  (define n1 (if (even? from) (+ from 1) from))
  (define n2 (start-primes-test n1 (runtime)))
  (define n3 (start-primes-test n2 (runtime)))
  (define n4 (start-primes-test n3 (runtime))))

(define (start-primes-test n start-time)
  ;(newline)
  ;(display n)
  (if (prime? n)
    (report-prime n (- (runtime) start-time))
    (start-primes-test (+ n 2) start-time)))

(define (report-prime n elapsed-time)
  (display " *** Prime: ")
  (display n)
  (display " Elapsed time: ")
  (display elapsed-time)
  (newline)
  (+ 2 n))

(timed-primes-test 10000000000)
(timed-primes-test 100000000000)
(timed-primes-test 1000000000000)
(timed-primes-test 10000000000000)

; It is not accurately confirmed. It runs 40-50% faster, not twice faster.
; The time spent testing non-prime numbers explains the difference.
