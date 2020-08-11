; Lab 13: Final Review
; (h (g (f (x))))
(define (compose-all funcs)
  (lambda (x) (if (null? funcs) 
  					x
  					((compose-all (cdr funcs)) ((car funcs) x)))
))