; SICP length
(define (length items)
  (if (null? items)
    0
    (+ 1 (length (cdr items)))))

; SICP list-ref
(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))))

; SICP append
(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (last l)
  (list-ref l (- (length l) 1)))

(define (reverse l)
  (define (reverse-iter n l r)
    (if (< n 0)
      r
      (reverse-iter (- n 1) l (append r (list (list-ref l n)))))
    )
  (reverse-iter (- (length l) 1) l (list)))
