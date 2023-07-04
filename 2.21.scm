(define (square-list items)
  (if (null? items)
    (list)
    (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))

; test
(equal? (square-list (list 1 2 3 4)) (list 1 4 9 16))
