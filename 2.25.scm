(define l1 (list 1 3 (list 5 7) 9))
(define l2 (list (list 7)))
(define l3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdr (car (cdr (cdr l1)))))
(cadr (car (cdr (cdr l1))))
(car (cdr (cadr (cdr l1))))
(cadr (cadr (cdr l1)))

(car (car l2))
(cadr (cadr (cadr (cadr (cadr (cadr l3))))))

