(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  'replace-this-line)

(define (zip pairs)
  'replace-this-line)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (cond ((null? s) nil)
    (else
    (define (helper n s)
      (cond ((null? (cdr s)) (list (list n (car s))))
            ((= n 0) (append (list (list n (car s))) (helper (+ n 1) (cdr s))))
            (else (append (list (list n (car s))) (helper (+ n 1) (cdr s))))
      )
    )
    (helper 0 s)
  ))
)
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
  ; BEGIN PROBLEM 18
(define (list-change total denoms)
  (define (cons-all i s) 
    (define l1 (lambda (f n) (lambda (z) (f n z))))
    (define l2 (l1 append (list i)))
    (map l2 s)
  )  
  
  (cond ((null? denoms) nil)
        ((= total (car denoms))
          (append (list (list (car denoms))) (list-change total (cdr denoms))))
        ((< total (car denoms))
          (list-change total (cdr denoms)))
        ((> total (car denoms))
          (append (cons-all (car denoms) (list-change (- total (car denoms))  denoms)) (list-change total (cdr denoms))))
  )
)
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (zip s1 s2) 
  (cond ((or (null? s1) (null? s2)) nil)
        (else
          (cons (list (car s1) (car s2)) (zip (cdr s1) (cdr s2)))
          
        )
  )
)

(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (list form params (car (map let-to-lambda body)))
           
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (define z (zip (car values) (cadr values)))
           (list (list 'lambda (car z) (car (map let-to-lambda body))) (car (cadr z)) (cadr (cadr z)))
           ;(list (list 'lambda (car z) (let-to-lambda body)) (car (cadr z)) (cdr (cadr z)))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )))
