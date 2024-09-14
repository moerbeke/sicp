(define nil ())

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(map abs (list -10 2.5 -11.6 17))
(map square (list -10 2.5 -11.6 17))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2) (list 3 4))
(append (list 1 2) (list 3 4 5))
(append nil (list 3 4 5))
(append (list 1 2) nil)
(append nil nil)
(append (list 1 2) (list 3 4 (list 5 6 7)))

(define (length sequence)
  (accumulate (lambda (n (cdr sequence)) (+ n 1)) 0 sequence))

(length nil)
(length (list 1 2))
(length (list 1 2 3))
(length (list 1 2 3 5 7))
