(define (fringe tree)
  (define (fringe-iter tree-remainder leaves)
    (if (null? tree-remainder)
      leaves
      (if (list? (car tree-remainder))
        (append (append leaves (fringe (car tree-remainder))) (fringe (cadr tree-remainder)))
        (fringe-iter (cdr tree-remainder) (append leaves (list (car tree-remainder)))))))
  (fringe-iter tree (list)))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
