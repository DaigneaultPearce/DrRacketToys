#lang racket
(define x-y-z-dfa
  '(x;startState
    (((x "a") x) ((x "b") y) ((y "a") x) ((y "b") z) ((z "a") z) ((z "b") z));transitions
    (x)(y)));finalStates
;
;;;final state is "x or y"
(define (is-final-state? state)
  (cond
    ((equal? state "x") #t);Bool returns true if the given state is the final state
    ((equal? state "y") #t);Bool returns true if the given state is the final state
    (else #f)));Bool returns false, not final state
;
;;;transitions
(define (x-state substring)
  (cond
    ((equal? substring "a") "x");if input is a return "x"
    ((equal? substring "b") "y");if input is b return "y"
    (else (write substring))))
;
(define (y-state substring)
  (cond
    ((equal? substring "a") "x");if input is a return "x"
    ((equal? substring "b") "z");if input is b return "z"
    (else (write substring))))
;
(define (z-state substring)
  (cond
    ((equal? substring "a") "z");if input is a return "z"
    ((equal? substring "b") "z");if input is b return "z"
    (else (write substring))))
;
;;;next state
(define (next-state state str)
  (cond
    ((equal? "x" state)(x-state str));takes in state x, retrieves transition state, returns next state
    ((equal? "y" state)(y-state str));takes in state y, retrieves transition state, returns next state
    ((equal? "z" state)(z-state str));takes in state z, retrieves transition state, returns next state
    (else "error")))
;
;;;parse the string
(define (parse str)(if(equal? str "") "In the language."(is-in-the-language? "x" str)));Accepts empty string and evaluates starting state and input string
;
;;;main function
(define (is-in-the-language? state str);recieves a state and string/substring
  (cond
    ((and(=(string-length str)1)(is-final-state?(next-state state str))) "It is in the language.");if last input and final state, accept
    ((and(=(string-length str)1)(not (is-final-state?(next-state state str)))) "Not in the language.");if last input and !final state, reject
    (else (is-in-the-language? (next-state state(substring str 0 1)) (substring str 1)))));traverse state and next input