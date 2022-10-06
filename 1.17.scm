(define (double a)
  (* a 2))

(define (half a)
  (/ a 2))

(define (even? a)
  (= (remainder a 2) 0))

(define (fast-mult a b)
  (display (* a b)) (newline)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1) a)
        ((even? b) (double (fast-mult a (half b))))
        (else (+ a (fast-mult a (- b 1))))))

