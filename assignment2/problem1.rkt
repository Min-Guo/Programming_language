Welcome to DrRacket, version 6.1.1 [3m].
Language: R5RS; memory limit: 128 MB.
> (define (calculate L)
    (cond 
      ((list? L)
       (cond
         ((eq? (car L) '+) (+ (calculate (car(cdr L))) (calculate (car(cddr L)))))
         ((eq? (car L) '-) (- (calculate (car(cdr L))) (calculate (car(cddr L)))))
         ((eq? (car L) '*) (* (calculate (car(cdr L))) (calculate (car(cddr L)))))
         ((eq? (car L) '/) (/ (calculate (car(cdr L))) (calculate (car(cddr L)))))))
      ((number? L) L)))
         
> (calculate (+ 1 2))
3
> (calculate (* 2 (+ 2 2)))
8
> (calculate (/ (+ 2 8) (+ 1 1)))
5
> 