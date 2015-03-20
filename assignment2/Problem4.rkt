Welcome to DrRacket, version 6.1.1 [3m].
Language: R5RS; memory limit: 128 MB.
> (define (sort M)
    (cond
      ((null? M) M)
      ((letrec
        ((minium (lambda (L)
          (cond
            ((null? (cdr L)) (car L))
            ((<= (car L) (cadr L)) (minium (cons (car L) (cddr L))))
            ((> (car L) (cadr L)) (minium (cdr L)))))) 
         (delete (lambda (x L)
          (cond
            ((null? L) L)
            ((eq? x (car L)) (cdr L))
            ((cons (car L) (delete x (cdr L))))))))
          (cons (minium M) (sort (delete (minium M) M)))))))
> (sort '(10 3 4 1 8))
(1 3 4 8 10)
> 