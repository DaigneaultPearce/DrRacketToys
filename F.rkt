#lang racket
(define fcompose(lambda(f g)(lambda(x)(g(f x)))))
(define inc(lambda (x) (+ x 1)))
(define (square x)(* x x))