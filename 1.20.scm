(define (if1 a b)
  (display "if1(") (display a) (display ",") (display b) (display ")") (newline)
  a)

(define (if2 a b)
  (display "if2(") (display a) (display ",") (display b) (display ")") (newline)
  (gcd b (remainder a b)))

(define (gcd a b)
  (display "gcd(") (display a) (display ",") (display b) (display ")") (newline)
  (if (= b 0)
    (if1 a b)
    (if2 a b)))

;(gcd 206 40)
;
; if: Assume that the predicate is evaluated first, then the consequentor the alternative expression.
;
; Evaluating combinations:
;   1. Evaluate the subexpressions of the combination, i.e. the elements of the combination.
;   2. Apply the procedure, i.e. the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).
;
; Applicative-order evaluation of a combination:
;   1. Evaluate the operator and operands. (Here I understand that evaluate the operator means to replace it by the procedure)
;   2. Apply the resulting procedure to the resulting arguments.
;
; Normal order evaluation: (fully expand and then reduce)
;   1. Substitute operand expressions for parameters until the interpreter obtains an expression involving only primitive operators.
;   2. Perform the evaluation.
;
; In other words (Wikipedia):
;
; Applicative order:
;   1. Evaluate arguments.
;   2. Apply function.

; Normal order:
;   1. Apply function.
;   2. Evaluate arguments.
; 
; 
; Normal-order evaluation of (gcd 206 40):
;
; Apply gcd
;(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;
; Evaluate if
;(gcd (40 (remainder 206 40)))
;
; Apply gcd
;(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;
; Evaluate if
; -> Perform (remainder 206 40)
;(if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;
; Apply gcd
;(if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; Evaluate if
; -> Perform (remainder 206 40)
;(if (= (remainder 40 6) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; -> Perform (remainder 40 6)
;(if (= 4 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;(gcd (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))))
;
; Apply gcd
;(if (= (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) (remainder 40 (remainder 206 40)) (gcd (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;
; Evaluate if
; -> Perform (remainder 206 40)
;(if (= (reminder (remainder 206 40) (remainder 40 6)) 0) (remainder 40 (remainder 206 40)) (gcd (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; -> Perform (remainder 206 40)
;(if (= (reminder 6 (remainder 40 6)) 0) (remainder 40 (remainder 206 40)) (gcd (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; -> Perform (remainder 40 6)
;(if (= (reminder 6 4) 0) (remainder 40 (remainder 206 40)) (gcd (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; -> Perform (remainder 6 4)
;(if (= 2 0) (remainder 40 (remainder 206 40)) (gcd (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;(gcd (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; Apply gcd
;(if (= (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;
; Evaluate if
; -> Perform (remainder 206 40)
;(if (= (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 6))) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; -> Perform (remainder 206 40)
;(if (= (remainder (remainder 40 6) (reminder (remainder 206 40) (remainder 40 6))) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; -> Perform (remainder 206 40)
;(if (= (remainder (remainder 40 6) (reminder (remainder 206 40) (remainder 40 6))) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; -> Perform (remainder 206 40)
;(if (= (remainder (remainder 40 6) (reminder 6 (remainder 40 6))) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; -> Perform (remainder 40 6)
;(if (= (remainder 4 (reminder 6 (remainder 40 6))) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; -> Perform (remainder 40 6)
;(if (= (remainder 4 (reminder 6 4)) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; -> Perform (remainder 6 4)
;(if (= (remainder 4 2) 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; -> Perform (remainder 4 2)
;(if (= 0 0) (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (reminder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (reminder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;(reminder (remainder 206 40) (remainder 40 (remainder 206 40)))
; -> Perform (remainder 206 40)
;(reminder (remainder 206 40) (remainder 40 6))
; -> Perform (remainder 206 40)
;(reminder 6 (remainder 40 6))
; -> Perform (remainder 40 6)
;(reminder 6 4)
; -> Perform (remainder 6 4)
; 2
;
; Number of remainder operations performed: 19
; 
; 
; Applicative-order evaluation of (gcd 206 40):
;
; Expand gcd
;(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;
; Evaluate if
;(gcd 40 (remainder 206 40))
;
; Evaluate arguments
; -> Perform (remainder 206 40)
;(gcd 40 6)
;
; Expand gcd
;(if (= 6 0) 40 (gcd 6 (remainder 40 6)))
;
; Evaluate if
;(gcd 6 (remainder 40 6))
;
; Evaluate arguments
; -> Perform (remainder 40 6)
;(gcd 6 4)
;
; Expand gcd
;(if (= 4 0) 40 (gcd 4 (remainder 6 4)))
;
; Evaluate if
;(gcd 4 (remainder 6 4))
;
; Evaluate arguments
; -> Perform (remainder 6 4)
;(gcd 4 2)
;
; Expand gcd
;(if (= 2 0) 4 (gcd 2 (remainder 4 2)))
;
; Evaluate if
;(gcd 2 (remainder 4 2))
;
; Evaluate arguments
; -> Perform (remainder 4 2)
;(gcd 2 0)
;
; Expand gcd
;(if (= 0 0) 2 (gcd 0 (remainder 2 0)))
;
; Evaluate if
;2
;
; Number of remainder operation performed: 4
