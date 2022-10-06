(define (p13 a b c)
  (cond ((and (< c a) (< c b)) (+ (* a a) (* b b)))
        ((and (< b a) (< b c)) (+ (* a a) (* c c)))
        (else (+ (* b b) (* c c)))))
