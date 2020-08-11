; Lab 13: Final Review - Optional Questions

(define (has-cycle? s)
  (define (pair-tracker seen-so-far curr)
    (cond ((null? curr) #f)
    	  ((contains? seen-so-far curr) #t)
          (else (pair-tracker (cons seen-so-far (car curr)) (cdr-stream curr)))
    ))
  (pair-tracker nil s)
  )

(define (contains? lst s)
  (cond ((null? lst) #f)
  		((eq? s (car lst)) #t)
  		(else (contains? (cdr lst) s))
  	)
)

(define-macro (switch expr cases)
    (begin `(if (=(car (car ,cases)) ,expr) (cdr (car ,cases)) (switch ,expr (cdr ,cases))))
) 