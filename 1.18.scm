(define (* a b)
  (mult-iter 0 a b))

(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (+ a a))

(define (half a)
  (/ a 2))

(define (mult-iter p a b)
  (display p) (newline)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1) a)
        ((even? b) (+ p (double (mult-iter 0 a (half b)))))
        (else (mult-iter (+ p a) a (- b 1)))))

(define (mult-iter-linear p a b)
  (display p) (newline)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1) a)
        (else (mult-iter-linear (+ p a) a (- b 1)))))
