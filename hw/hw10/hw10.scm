(define (accumulate combiner start n term)
   (if (= n 0) start
  	(accumulate combiner (combiner (term n) start) (- n 1) term))
)

(define (accumulate-tail combiner start n term)
    (if (= n 0) start
  	(accumulate-tail combiner (combiner (term n) start) (- n 1) term))
)

(define (rle s)
	(define (cnt s term)
		(if (= (cdr-stream s) term) (+ 1 (cnt (cdr-stream s) term)) 1)
		)
	(define (cut s term)
		(if (= (cdr-stream s) term) (cut (cdr-stream s)) (cdr-stream s))
		)

	(cond ((null? s) s)
		  ((= (car s) (cdr-stream s)) (cons-stream (list (cnt s (car s))) (rle (cut s (car s)))))
		  (else (cons-stream (list (car s) 1) (rle (cdr-stream s))))
		)
)