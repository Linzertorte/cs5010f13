;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname regexp) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "extras.rkt")
(provide
 initial-state
 next-state
 final-state?
 error-state?
)
;The diagram for the regular expression
;
;
;  _a,b_      __d_
; |    /  c |     /  e
;  \(1)v----->(2)v---->(o)
;    \        /       /
;     \      v      /
;      - > (x)<----/
;
;
;(1) initial state
;(2) intermediate state
;(o) accepting state
;(x) error state

;A State is one of
;"initial"  
;"intermediate" 
;"accepting"
;"error"
;Interp:
;The machine is in one of the state depicted in the state-transition diagram
; Template
;state-fn: State -> ??
;(define (state-fn state)
;  (cond
;    ([string=? state "initial"] ...)
;    ([string=? state "intermediate"] ...)
;    ([string=? state "accepting"] ...)
;    ([string=? state "error"] ...)
;   )
;  )

;initial-state : Number -> State
;GIVEN: a number
;RETURNS: a representation of the initial state
;of your machine.  The given number is ignored.

(define (initial-state n)
  "initial"
  )

;
;next-state : State MyKeyEvent -> State
;GIVEN: a state of the machine
;RETURNS: the state that should follow the given key event.  A key
;event that is to be discarded should leave the state unchanged.
; Design strategy: structual decomposition of State
(define (next-state state mykev)
  (cond
    ([string=? state "initial"] (from-initial-state mykev))
    ([string=? state "intermediate"] (from-intermediate-state mykev))
    ([string=? state "accepting"] "error")
    ([string=? state "error"] "error") ; once in error, always in error
   )
)




(define (from-initial-state mykev)
  (cond
    ([or (string=? mykev "a") (string=? mykev "b")] "initial")
    ([string=? mykev "c"] "intermediate")
    (else "error")
  )
)



(define (from-intermediate-state mykev)
  (cond
  ([string=? mykev "d"] "intermediate")
  ([string=? mykev "e"] "accepting")
  (else "error")
  )

)





;accepting-state? : State -> Boolean
;GIVEN: a state of the machine
;RETURNS: true iff the given state is a final (accepting) state
(define (final-state? state)
	(string=? state "accepting"))


;
;error-state? : State -> Boolean
;GIVEN: a state of the machine
;RETURNS: true iff the string seen so far does not match the specified
;regular expression and cannot possibly be extended to do so.

(define (error-state? state)
	(string=? state "error"))
