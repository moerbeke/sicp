(define (accummulate combiner null-value term a next b)
  (define (iter combiner a result)
    (if (> a b)
      result
      (iter combiner (next a) (combiner result (term a)))))
  (iter combiner a null-value))

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
