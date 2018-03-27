#lang racket
;This procedure returns the maximum of the absolute value of the two input paramaters
;DaigneaultPearce
(define (bigger-magnitude a b) (if (> (abs a) (abs b))a
                                   b))