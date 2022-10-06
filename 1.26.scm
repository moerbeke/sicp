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

(define (fast-prime? n times)
  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
  (define (expmod base exp n)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (* (expmod base (/ exp 2) n)
                         (expmod base (/ exp 2) n))
                      n))
          (else
           (remainder (* base (expmod base (- exp 1) n))
                      n))))
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

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
  (if (fast-prime? n 1)
    (report-prime n (- (runtime) start-time))
    (start-primes-test (+ n 2) start-time)))

(define (report-prime n elapsed-time)
  (display " *** Prime: ")
  (display n)
  (display " Elapsed time: ")
  (display elapsed-time)
  (newline)
  (+ 2 n))

;(timed-primes-test 10000000000)
;(timed-primes-test 100000000000)
;(timed-primes-test 1000000000000)
;(timed-primes-test 10000000000000)

; This version of expmod exponentially expands in calls to expmod as a result of
; replacing (square (expmod... by (* (expmod... (expmod...
; Hence, the O(log(n)) becomes O(log(2^n)) = O(n).
