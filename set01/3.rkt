;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "extras.rkt")
(require 2htdp/image)
(provide 
 make-diff-exp 
 diff-exp-rand1 
 diff-exp-rand2
 make-mult-exp
 mult-exp-rand1
 mult-exp-rand2
 expr-to-image
)

(define-struct diff-exp (rand1 rand2))
(define-struct mult-exp (rand1 rand2))

;; An Expr is one of
;; -- (make-diff-exp Number Number)
;; -- (make-mult-exp Number Number)
;; Interpretation: a diff-exp represents a difference,
;; and a mult-exp represents a multiplication

; expr-to-image: Expr Boolean -> Image
; GIVEN: an Expr and a boolean flag
; RETURN: infix expression image if the flag is true, 
; otherwise a prefix expression image
; Design strategy: domain knowledge
(define (expr-to-image expr infix?)
  (if infix? (text-image "(" (number->string (expr-rand1 expr))
                         " " (operator expr) " "
                         (number->string (expr-rand2 expr)) ")")
      (text-image "(" (operator expr) " " (number->string (expr-rand1 expr))
                         " "
                         (number->string (expr-rand2 expr)) ")")
   )
  )

;expr-rand1: Expr->Number
;expr-rand2: Expr-> Number
;GIVEN,an Expr
;RETURNS: The first, second operand
;Design strategy: partition

(define (expr-rand1 expr)
  (cond
    [(diff-exp? expr) (diff-exp-rand1 expr)]
    [(mult-exp? expr) (mult-exp-rand1 expr)]
   )
  )
(define (expr-rand2 expr)
  (cond
    [(diff-exp? expr) (diff-exp-rand2 expr)]
    [(mult-exp? expr) (mult-exp-rand2 expr)]
   ))




(define (operator expr)
  (cond
    [(diff-exp? expr) "-"]
    [(mult-exp? expr) "*"]
   ))

(define (text-image t1 t2 t3 t4 t5 t6 t7)
  (beside (text-11-b t1)
          (text-11-b t2)
          (text-11-b t3)
          (text-11-b t4)
          (text-11-b t5)
          (text-11-b t6)
          (text-11-b t7)
  )
  )


(define (text-11-b txt)
  (text txt 11 "black")
  )


