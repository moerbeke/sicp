(define (congruent? a b n)
  (= (remainder a n) (remainder b n)))

(define (fermat-test n)
  (define (test-congruent-iter a n)
    (or
      (= a n)
      (and (congruent? (expt a n) a n)
           (test-congruent-iter (+ a 1) n))))
  (test-congruent-iter 1 n))

;(fermat-test 561)
;(fermat-test 1105)
;(fermat-test 1729)
;(fermat-test 2465)
;(fermat-test 2821)
;(fermat-test 6601)
