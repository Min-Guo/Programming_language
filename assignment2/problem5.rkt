Welcome to DrRacket, version 6.1.1 [3m].
Language: R5RS; memory limit: 128 MB.
> (define (resort M)
    (cond
      ((null? M) M)
      ((number? M) M)
      ((letrec
           ((sum (lambda(L)
             (cond
               ((number? L) L)
               ((list? L)
                (cond
                 ((null? (cdr L)) (car L))
                 ((sum (cons (+ (sum (car L)) (sum (cadr L))) (cddr L)))))))))
            (minium (lambda(L)
              (cond
                ((null? (cdr L)) (car L))
                ((<= (sum (car L)) (sum (cadr L))) (minium (cons (car L) (cddr L))))
                ((> (sum (car L)) (sum (cadr L))) (minium (cdr L))))))
            (delete (lambda (x L)
              (cond
               ((null? L) L)
               ((eq? x (car L)) (cdr L))
               ((cons (car L) (delete x (cdr L))))))))
            (cons (resort (minium M)) (resort (delete (minium M) M)))))))
> (resort '((5 (3 1)) 10 4 (2 0)))
((0 2) 4 ((1 3) 5) 10)
> (resort '(((5 4) (3 1)) 10 4 (2 0)))
((0 2) 4 10 ((1 3) (4 5)))
> (resort '(10 (5 (3 (4 2)))))
(10 (5 (3 (2 4))))
> (resort '(3 1 2))
(1 2 3)
> (resort '((3 1) (5 1)))
((1 3) (1 5))
> 