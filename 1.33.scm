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

(define (identity n) n)

(define (filtered-accummulate combiner null-value term a next b filter)
  (if (> a b)
    null-value
    (combiner (if (filter a) (term a) null-value)
              (filtered-accummulate combiner null-value term (next a) next b filter))))

(define (prime-square-sum a b)
  (define (combiner-sum a b) (+ a b))
  (define null-sum 0)
  (define (next a) (+ a 1))
  (filtered-accummulate combiner-sum null-sum square a next b prime?))

(define (n-prime-product n)
  (define (combiner-product a b) (* a b))
  (define null-product 1)
  (define (next a) (+ a 1))
  (define (n-prime? i) (= 1 (gcd i n)))
  (filtered-accummulate combiner-product null-product identity 1 next n n-prime?))

(and
  (= 1 (n-prime-product 2))
  (= 2 (n-prime-product 3))
  (= 3 (n-prime-product 4))
  (= (* 2 3 4) (n-prime-product 5))
  (= 5 (n-prime-product 6))
  (= (* 2 3 4 5 6) (n-prime-product 7))
  (= (* 3 5 7) (n-prime-product 8))
  (= (* 2 4 5 7 8) (n-prime-product 9))
  (= (* 3 7 9) (n-prime-product 10))
  )
