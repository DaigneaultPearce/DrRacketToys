#lang racket
(define (list-get-element p n)
  (if (= n 1)
      (car p)
      (list-get-element (cdr p)(- n 1))))