Welcome to DrRacket, version 6.1.1 [3m].
Language: R5RS; memory limit: 128 MB.
> (define (map2 f L1 L2)
    (cond
      ((and (null? L1) (null? L2)) '())
      ((cons (f (car L1) (car L2)) (map2 f (cdr L1) (cdr L2))))))
> (define (f x y)
    (* x y))
> (map2 f '(1 2 3) '(1 2 3))
(1 4 9)
> (define (f x y)
    (/ x y))
> (map2 f '(9 10 15) '(1 2 3))
(9 5 5)
> 