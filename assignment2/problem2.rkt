Welcome to DrRacket, version 6.1.1 [3m].
Language: R5RS; memory limit: 128 MB.
> (define (calc L)
    (cond
      ((number? L) L)
      ((list? L)
       (cond
         ((null? (cdr L)) (calc (car L)))
         ((eq? (car(cdr L)) '+) (+ (calc (car L)) (calc (cddr L))))
         ((eq? (car(cdr L)) '-) (- (calc (car L)) (calc (cddr L))))
         ((eq? (car(cdr L)) '*) (* (calc (car L)) (calc (cddr L))))
         ((eq? (car(cdr L)) '/) (/ (calc (car L)) (calc (cddr L))))))))
> (calc '(2 * 4 + 2 - (2 + 5)))
-2
> 