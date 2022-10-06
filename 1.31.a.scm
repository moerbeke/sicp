(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (factorial n)
  (define (identity n) n)
  (define (next n) (+ n 1))
  (if (= n 0)
    1
    (product identity 1 next n)))

(define (wallis-pi n)
  (define (term n) (/ (* 4 n n) (- (* 4 n n) 1)))
  (define (next n) (+ n 1))
  (* 2. (product term 1 next n)))
