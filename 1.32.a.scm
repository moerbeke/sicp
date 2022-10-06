(define (accummulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accummulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (define (combiner-sum a b)
    (+ a b))
  (define null-sum 0)
  (accummulate combiner-sum null-sum term a next b))

(define (product term a next b)
  (define (combiner-prod a b)
    (* a b))
  (define null-prod 1)
  (accummulate combiner-prod null-prod term a next b))
