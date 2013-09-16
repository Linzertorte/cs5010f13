;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname snacks) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

(define PRICE-OF-CHOCOLATE 175)
(define PRICE-OF-CARROT 70)


;A CustomerInput is one of
;-- a positive Number interp: insert the specified number of cents
;-- "chocolate"       interp: request a chocolate bar
;-- "carrots"         interp: request a package of carrot sticks
;-- "release"         interp: return all the coins that the customer has put in
; Template
; customerinput-fn: CustomerInput -> ??
;(define (customerinput-fn customerinput)
;  (cond 
;   ([number? cusomerinput]...)
;   ([string=? customerinput "chocolates"] ...)
;   ([string=? customerinput "carrots"] ...)
;   ([string=? customerinput "release"] ...)
;   ))




(define-struct machine (chocolates carrots bank deposit))


(define (load-machine chocolates carrots)
  (make-machine chocolates carrots 0 0)
  )



; strutural decomposition of CustomerInput
(define (machine-next-state machine customerinput)
  (cond 
   ([number? customerinput] (machine-add-deposit machine customerinput))
   ([string=? customerinput "chocolates"] (machine-get-chocolate machine))
   ([string=? customerinput "carrots"] (machine-get-carrot machine))
   ([string=? customerinput "release"] (machine-release machine)
   )))


;machine-deposit: Machine Number- >Machine
;Given: A machine and some cents of money
;RETURNS: a machine with money added to the deposit
(define (machine-add-deposit machine cents)
	(make-machine (machine-chocolates machine)
                      (machine-carrots machine) 
                      (machine-bank machine) 
                      (+ (machine-deposit machine) cents))
	)


;machine-get-chocolate: Machine -> Machine
;machine-get-carrot: Machine -> Machine
;GIVEN: a machine state
;RETURNS: if money is enough and request item is available, get the item, otherwise, stay unchanged

(define (machine-get-chocolate machine)
	(if (and (>= (machine-deposit machine) PRICE-OF-CHOCOLATE) 
                 (> (machine-chocolates machine) 0)) 
            (make-machine 
             (- (machine-chocolates machine) 1)
             (machine-carrots machine) 
             (+ (machine-bank machine) PRICE-OF-CHOCOLATE) 
             0 ; machine-deposit will be 0 because changes are returned to customer
             )
            machine))

(define (machine-get-carrot machine)
	(if (and (>= (machine-deposit machine) PRICE-OF-CARROT) 
                 (> (machine-carrots machine) 0)) 
            (make-machine 
             (machine-chocolates machine)
             (- (machine-carrots machine) 1)
             (+ (machine-bank machine) PRICE-OF-CARROT) 
              0 ; machine-deposit will be 0 because changes are returned to customer
             )
            machine))

; machine-release: Machine -> Machine
; GIVEN: a machine state
; RETURNS: a new machine state with the deposit set to 0
(define (machine-release machine)
  (make-machine
   (machine-chocolates machine)
   (machine-carrots machine) 
   (machine-bank machine)
   0)
)



