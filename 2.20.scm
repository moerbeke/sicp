; SICP append
(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (same-parity . l)
  (define (parity n) (remainder n 2))
  (define (same-parity-iter n l s)
    (if (null? l)
      s
      (let ((next (car l)))
        (if (= (parity n) (parity next))
          (same-parity-iter n (cdr l) (append s (list next)))
          (same-parity-iter n (cdr l) s)))))
  (let ((first (car l)))
    (same-parity-iter first (cdr l) (list first))))
