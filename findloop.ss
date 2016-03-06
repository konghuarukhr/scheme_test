(define (findloop? p)
  (letrec ((findloopinner?
            (lambda (a b)
              (cond ((eq? a b) #t)
                    ((null? (cdr b)) #f)
                    ((null? (cddr b)) #f)
                    (else (findloopinner? (cdr a) (cddr b)))))))
          (cond ((pair? p)
                 (if (null? (cdr p))
                     #f
                   (findloopinner? p (cdr p))))
                (else #f))))
