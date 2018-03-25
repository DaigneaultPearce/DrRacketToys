#lang racket
(define first-dfa
  '(a;startState
    (((a 0) a) ((a 1) b) ((b 0) c) ((b 1) a) ((c 0) b) ((c 1) c));transitions
    (c)));finalState
;
;;;final state is "c"
(define (is-final-state? state) (if(equal? state "c") #t #f));Bool returns true if the given state is the final state
;
;;;transitions
(define (a-state substring)
  (cond
    ((equal? substring "1") "b");if input is 1 return "b"
    ((equal? substring "0") "a");if input is 0 return "a"
    (else (write substring))))
;
(define (b-state substring)
  (cond
    ((equal? substring "1") "a");if input is 1 return "a"
    ((equal? substring "0") "c");if input is 0 return "c"
    (else (write substring))))
;
(define (c-state substring)
  (cond
    ((equal? substring "1") "c");if input is 1 return "c"
    ((equal? substring "0") "b");if input is 0 return "b"
    (else (write substring))))
;
;;;next state
(define (next-state state str)
  (cond
    ((equal? "a" state)(a-state str));takes in state a, retrieves transition state, returns next state
    ((equal? "b" state)(b-state str));takes in state b, retrieves transition state, returns next state
    ((equal? "c" state)(c-state str));takes in state c, retrieves transition state, returns next state
    (else "error")))
;
;;;parse the string
(define (parse str)(if(equal? str "") "Not in the language :("(is-in-the-language? "a" str)));rejects empty string and evaluates starting state and input string
;
;;;main function
(define (is-in-the-language? state str);recieves a state and string/substring
  (cond
    ((and(=(string-length str)1)(is-final-state?(next-state state str))) "It is in the language :)");if last input and final state, accept
    ((and(=(string-length str)1)(not (is-final-state?(next-state state str)))) "Not in the language :(");if last input and !final state, reject
    (else (is-in-the-language? (next-state state(substring str 0 1)) (substring str 1)))));traverse state and next input