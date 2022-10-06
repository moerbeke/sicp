(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

; Iterative or recursive?
(define (+a a b)
  (display a) (display " ") (display b) (newline)
  (if (= a 0)
    b
    (inc (+a (dec a) b))))

; Iterative or recursive?
(define (+b a b)
  (display a) (display " ") (display b) (newline)
  (if (= a 0)
    b
    (+b (dec a) (inc b))))

; Both are recursive procedures.
;
; 1st. procedure, substitution model:
;
; (+ 3 4)
; (inc (+ (dec 3) 4)
; (inc (+ 2 4)
; (inc (inc (+ (dec 2) 4)))
; (inc (inc (+ 1 4)))
; (inc (inc (inc (+ (dec 1) 4))))
; (inc (inc (inc (+ 0 4))))
; (inc (inc (inc 4)))
; (inc (inc 5))
; (inc 6)
; 7
;
; 2nd. procedure, substitution model:
;
; (+ 3 4)
; (+ (dec 3) (inc 4))
; (+ 2 5)
; (+ (dec 2) (inc 5))
; (+ 1 6)
; (+ (dec 1) (inc 6))
; (+ 0 7)
; 7
;
; However, the first one generates a recursive process, whereas the second one
; generates an iterative process.
; Now, which are the state variables of the iterative process?
; Any given "instance" of variables completely represents the state of the
; process, e.g. a=1, b=6.
; However, in the first procedure, they do not, e.g. a=1, b=4, in the third call
; to the procedure, say nothing about the overall state of the process.
