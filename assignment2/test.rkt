Welcome to DrRacket, version 6.1.1 [3m].
Language: R5RS; memory limit: 128 MB.
> (define (sum L)
    (cond
      ((number? L) L)
      ((cond
       ((null? (cdr L)) (car L))
       ((sum (cons (+ (car L) (cadr L)) (cddr L))))))))  
> (map (lambda (L) (sum L)) '(1 2 3 (1 2 3)))
(1 2 3 6)
> (map (lambda (L) (sum L)) '(1 2 3))
(1 2 3)
> (map (lambda (L) (sum L)) '((1 2 3) (2 3) (2)))
(6 5 2)
> (define (sort M)
    (cond
      ((null? M) M)
      ((letrec
        ((minium (lambda (L)
          (cond
            ((null? (cdr L)) (car L))
            ((<= (car L) (cadr L)) (minium (cons (car L) (cddr L))))
            ((> (car L) (cadr L)) (minium (cdr L)))))) 
         (sum (lambda (L)
           (cond
             ((number? L) L)
             ((cond
               ((null? (cdr L)) (car L))
               ((sum (cons (+ (car L) (cadr L)) (cddr L))))))))) 
         (delete (lambda (x L)
          (cond
            ((null? L) L)
            ((eq? x (car L)) (cdr L))
            ((cons (car L) (delete x (cdr L))))))))
          (cond 
            ((eq? (minium M) 1) '())
          ((cons (minium M) (sort (delete (minium M) M)))))))))