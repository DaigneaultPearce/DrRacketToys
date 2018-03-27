#lang racket
(define fcompose(lambda(f g)(lambda(x)(g(f x)))))
(define (self-compose f)(fcompose f f))
(define inc(lambda (x) (+ x 1)))

