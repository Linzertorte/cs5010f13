;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;sum-of-larger-two: Number Number Number - > Number
; GIVEN, three numbers a,b,c
; RETURNS: the sum of the two larger numbers
; example
; (sum-of-larger-two 1 2 3) => 5
; (sum-of-larger-two 3 1 7) => 10

(define (sum-of-larger-two a b c)
  (- (+ a b c ) (min-of-three-numbers a b c)))

; min-of-three-numbers: Number Number Number - > Number
; GIVEN, three numbers a,b,c
; RETURNS: the smallest number
; example
; (min-of-three-numbers 1 2 3) => 1
; (min-of-three-numbers 3 1 7) => 1

(define (min-of-three-numbers a b c)
  (if (and (< a b) (< a c)) a (if (< b c) b c)))