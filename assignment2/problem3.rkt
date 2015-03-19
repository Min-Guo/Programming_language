Welcome to DrRacket, version 6.1.1 [3m].
Language: R5RS; memory limit: 128 MB.
> (define (lcalc L)
    (cond
      ((null? (cdr L)) (car L))
      ((eq? (cadr L) '+) (lcalc (cons (+ (car L) (car(cddr L))) (cdr(cddr L)))))
      ((eq? (cadr L) '-) (lcalc (cons (- (car L) (car(cddr L))) (cdr(cddr L)))))
      ((eq? (cadr L) '*) (lcalc (cons (* (car L) (car(cddr L))) (cdr(cddr L)))))
      ((eq? (cadr L) '/) (lcalc (cons (/ (car L) (car(cddr L))) (cdr(cddr L)))))))
> (lcalc '(2 + 3 * 4 / 5))
4
> (lcalc '(2 + 3 * 4))
20
> 