(define (cont-frac n d k)
  (define (f n d i j)
    (if (= i j)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (f n d (+ i 1) j)))))
  (f n d 1 k))

(define phi (/ (+ 1 (sqrt 5)) 2))

(define (smallest-k precision)
  (define (iter k)
    (if (< (abs (- (/ 1. phi) (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))) precision)
      k
      (iter (+ k 1))))
  (iter 1))

(smallest-k .0001)
