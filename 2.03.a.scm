(load "2.02.scm")

(define (make-rect p q)
  (cons (make-segment p (make-point (x-point q) (y-point p)))
        (make-segment p (make-point (x-point p) (y-point q)))))

(define (base-rect r)
  (car r))

(define (height-rect r)
  (cdr r))

(define (length-segment s)
  (define (sqr x) (* x x))
  (sqrt (+ (sqr (- (x-point (start-segment s)) (x-point (end-segment s))))
           (sqr (- (y-point (start-segment s)) (y-point (end-segment s)))))))

(define (perimeter-rect r)
  (* 2 (+ (length-segment (base-rect r))
          (length-segment (height-rect r)))))

(define (area-rect r)
  (* (length-segment (base-rect r)) (length-segment (height-rect r))))

(define A (make-point 1 -2))
(define B (make-point 6 -2))
(define C (make-point 1 3))
(define D (make-point 6 3))
(define r1 (make-rect A D))
(newline) (display (perimeter-rect r1)) (display " ") (display (area-rect r1))
