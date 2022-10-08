(define (cont-frac n d k)
  (define (f-iter n d i j result)
    (if (= i 0)
      result
      (f-iter n d (- i 1) j (/ (n i) (+ (d i) result)))))
  (f-iter n d k k 0))

(define phi (/ (+ 1 (sqrt 5)) 2))

(define (smallest-k precision)
  (define (iter k)
    (if (< (abs (- (/ 1. phi) (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))) precision)
      k
      (iter (+ k 1))))
  (iter 1))

(smallest-k .0001)
