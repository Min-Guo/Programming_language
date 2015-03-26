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
> (calculate (/ (+ 2 8) (+ 1 1)))
5
> (calculate (* 2 (+ 2 2)))
8
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
> (define (lcalc L)
    (cond
      ((null? (cdr L)) (car L))
      ((eq? (cadr L) '+) (lcalc (cons (+ (car L) (car(cddr L))) (cdr(cddr L)))))
      ((eq? (cadr L) '-) (lcalc (cons (- (car L) (car(cddr L))) (cdr(cddr L)))))
      ((eq? (cadr L) '*) (lcalc (cons (* (car L) (car(cddr L))) (cdr(cddr L)))))
      ((eq? (cadr L) '/) (lcalc (cons (/ (car L) (car(cddr L))) (cdr(cddr L)))))))
> (lcalc '(2 + 3 * 4 / 5))
4
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
>  (resort '(((5 4) (3 1)) 10 4 (2 0)))
((0 2) 4 10 ((1 3) (4 5)))
> (define (map2 f L1 L2)
    (cond
      ((and (null? L1) (null? L2)) '())
      ((cons (f (car L1) (car L2)) (map2 f (cdr L1) (cdr L2))))))
> (define (f x y)
    (* x y))
> (map2 f '(1 2 3) '(1 2 3))
(1 4 9)
> 