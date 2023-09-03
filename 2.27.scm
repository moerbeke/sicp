(define (deep-reverse l)
  (define (reverse-2 x)
    (if (list? x)
      (deep-reverse x)
      x))
  (define (reverse-iter n l r)
    (if (< n 0)
      r
      (reverse-iter (- n 1) l (append r (list (reverse-2 (list-ref l n))))))
    )
  (reverse-iter (- (length l) 1) l (list)))

(deep-reverse (list (list 1 2) (list 3 4)))

(deep-reverse (list (list 1 2) (list 3 4)))
(deep-reverse (list (list 1 2) (list 3 (list 4 5))))
