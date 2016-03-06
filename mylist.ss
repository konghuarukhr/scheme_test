(define (mylist? obj)
  (letrec ((findindeep?
            (lambda (l d x)
              (cond ((eq? l x) #t)
                    ((zero? d) #f)
                    (else (findindeep? (cdr l) (- d 1) x)))))
           (mylistinner?
            (lambda (nobj d)
              (cond ((null? nobj) #t)
                    ((pair? nobj)
                     (if (findindeep? obj d (cdr nobj))
                         #f
                       (mylistinner? (cdr nobj) (+ d 1))))
                    (else #f)))))
          (mylistinner? obj 0)))
