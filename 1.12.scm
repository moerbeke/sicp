; Pascal's triangle
;
;     1
;    1 1
;   1 2 1
;  1 3 3 1
; 1 4 6 4 1

; cell (row,col)
(define (cell r c)
  (if (= r 1)
    1
    (if (or (= c 1) (= c r))
      1
      (+ (cell (- r 1) (- c 1)) (cell (- r 1) c)))))

; col
(define (col r c)
  (display " ")
  (display (cell r c))
  (if (< c r)
    (col r (+ c 1))))

; rows
(define (row r)
  (col r 1)
  (newline))

(define (display-sp n)
  (display " ")
  (if (> n 1)
    (display-sp (- n 1))))

(define (row-iter r n)
  (display-sp (- n r -1))
  (row r)
  (if (< r n)
    (row-iter (+ r 1) n)))

; iterative triangle
; nice spacing
(define (pti n)
  (row-iter 1 n))

; semi-recursive triangle
; ugly spacing
(define (ptr1 n)
  (if (> n 1)
    (ptr1 (- n 1)))
  (row n))

(define (cells r c1 cn)
  (if (and (= c1 1) (= r cn))
    (newline))
  (if (< c1 cn)
    (cells r c1 (- cn 1)))
  (display " ")
  (display (cell r cn)))

; semi-recursive triangle
; ugly spacing
(define (ptr2 n)
  (if (> n 1)
    (ptr2 (- n 1)))
  (cells n 1 n))

; recursive process
; compute element at r-th ow and c-th column, both starting on 1
(define (ptelem r c)
  (if (or (= r 1) (= c 1) (= c r))
    1
    (+ (ptelem (- r 1) (- c 1)) (ptelem (- r 1) c)))
  )
