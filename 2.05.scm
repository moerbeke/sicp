(define (log-n x n)
  (/ (log x) (log n)))

(define (log-2 x)
  (log-n x 2))

(define (log-3 x)
  (log-n x 3))

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (car-iter z)
    (if (= 0 (remainder z 3))
      (car-iter (/ z 3))
      (log-2 z)))
  (car-iter z))

(define (cdr z)
  (define (car-iter z)
    (if (= 0 (remainder z 2))
      (car-iter (/ z 2))
      (log-3 z)))
  (car-iter z))
