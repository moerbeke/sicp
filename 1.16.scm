(define (expo b n)
  (expo-iter 1 b n))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (expo-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (* a (square (expo-iter 1 b (/ n 2)))))
        (else (expo-iter (* a b) b (- n 1)))))

(define (expo-iter-linear a b n)
  (if (= n 0)
    a
    (expo-iter-linear (* a b) b (- n 1))))
