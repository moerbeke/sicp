(define (for-each proc items)
  (define (iter proc items)
    (if (not (null? items))
      (proc (car items)))
    (let ((next-items (cdr items)))
      (if (not (null? next-items))
        (iter proc next-items))))
  (iter proc items))

; test
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
