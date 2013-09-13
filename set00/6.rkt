;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; quadratic-root: Number Number Number -> Number
; GIVEN: the coefficients a,b,c of a quadratic equation ax^2+bx+c=0
; RETURNS: the larger root of the equation
; Example
; (quadratic-root 1 2 1) => -1
; (quadratic-root 1 0 -1) => 1
(define (quadratic-root a b c)
  (/ (+ (- 0 b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))