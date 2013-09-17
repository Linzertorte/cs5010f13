;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require  "extras.rkt")
(require 2htdp/image)
(provide
  initial-robot
  robot-left 
  robot-right
  robot-forward
  robot-north? 
  robot-south? 
  robot-east? 
  robot-west?) 

(define ROBOT-RADIUS 15)
(define CANVAS-HEIGHT 200)
(define CANVAS-WIDTH 400)
(define MIN-X ROBOT-RADIUS)
(define MIN-Y ROBOT-RADIUS)
(define MAX-X (- CANVAS-WIDTH ROBOT-RADIUS))
(define MAX-Y (- CANVAS-HEIGHT ROBOT-RADIUS))

; An Orient is one of
; -- "north", the robot is facing north
; -- "east", the robot is facing east
; -- "south", the robot is facing south
; -- "west", the robot is facing west
; Template
; orient-fn: Orient -> ??
; (define (orient-fn ort)
;   (cond
;     [(string=? ort "north") ...]
;     [(string=? ort "east") ...]
;     [(string=? ort "south") ...]
;     [(string=? ort "west") ...]
;     ))

(define-struct robot (x y ort))
; A Robot is a
; (make-robot Number Number Orient)
; Interp
; x is the x-coordinate of robot in the scene
; y is the y-coordinate of robot in the scene
; ort is the RobotOrientation of the robot
; robot-fn: Robot -> ??
;(define (robot-fn r)
;  (...
;   (robot-x r)
;   (robot-y r)
;   (robot-ort r)
;   )
;  )

(define scene (empty-scene CANVAS-WIDTH CANVAS-HEIGHT))

;initial-robot : PosInt PosInt -> Robot
;GIVEN: a set of (x,y) coordinates
;RETURNS: a robot with its center at those coordinates, facing north
;(up).
; Design strategy: domain knowledge
(define (initial-robot x y)
	(make-robot  (legal-x x) (legal-y y) "north"))



;robot-left : Robot -> Robot
;robot-right : Robot -> Robot
;GIVEN: a robot
;RETURNS: a robot like the original, but turned 90 degrees either left
;or right.
(define (robot-left rbt)
  (make-robot (robot-x rbt)
              (robot-y rbt)
              (get-left-orient (robot-ort rbt))
  ))

(define (robot-right rbt)
  (make-robot (robot-x rbt)
              (robot-y rbt)
              (get-right-orient (robot-ort rbt))
  ))
;get-left-orient: Orient -> Orient
;get-right-orient: Orient -> Orient
;GIVEN: An orient of the robot
;RETURNS: New orient after turn left or right 90 degree
;Design strategy: structural decomposition of Orient of the robot
(define (get-left-orient ort)
 (cond
  [(string=? ort "north") "west"]
  [(string=? ort "east") "north"]
  [(string=? ort "south") "east"]
  [(string=? ort "west") "south"]
 ))

(define (get-right-orient ort)
 (cond
  [(string=? ort "north") "east"]
  [(string=? ort "east") "south"]
  [(string=? ort "south") "west"]
  [(string=? ort "west") "north"]
 ))

;robot-north? : Robot -> Boolean
;robot-south? : Robot -> Boolean
;robot-east? : Robot -> Boolean
;robot-west? : Robot -> Boolean
;GIVEN: a robot
;ANSWERS: whether the robot is facing in the specified direction.

(define (robot-north? rbt)
	(string=? (robot-ort rbt) "north"))

(define (robot-south? rbt)
	(string=? (robot-ort rbt) "south"))

(define (robot-east? rbt)
	(string=? (robot-ort rbt) "east"))

(define (robot-west? rbt)
	(string=? (robot-ort rbt) "west"))

;robot-forward : Robot PosInt -> Robot
;GIVEN: a robot and a distance
;RETURNS: a robot like the given one, but moved forward by the
;specified number of pixels.  If moving forward the specified number of
;pixels would cause the robot to run into a wall, the robot should stop
;at the wall.
(define (robot-forward rbt dist)
   (make-robot (forward-x rbt dist) (forward-y rbt dist) (robot-ort rbt))
)

;forward-x: Robot PosInt -> PosInt
;forward-y: Robot PosInt -> PosInt
;GIVEN: A robot and a distance
;the x,y coordinate after foward a distance
;Design strategy: structural decomposition of the Orient of the robot
(define (forward-x rbt dist)
  (cond
  [(string=? (robot-ort rbt) "north") (robot-x rbt)]
  ; x stays unchanged when facing north or south
  [(string=? (robot-ort rbt) "east") (legal-x (+ (robot-x rbt) dist))]
  [(string=? (robot-ort rbt) "south") (robot-x rbt)]
  [(string=? (robot-ort rbt) "west") (legal-x (- (robot-x rbt) dist))]
))

(define (forward-y rbt dist)
  (cond
  [(string=? (robot-ort rbt) "north") (legal-y (- (robot-y rbt) dist))]
  ; y stays unchanged when facing east or west
  [(string=? (robot-ort rbt) "east") (robot-y rbt)]
  [(string=? (robot-ort rbt) "south") (legal-y (+ (robot-y rbt) dist))]
  [(string=? (robot-ort rbt) "west") (robot-y rbt)]
))


;legal-x: PosInt->PosIn
;legal-y: PosInt->PosIn
;GIVEN, a x,y coordinate of the center of the robot
;RETURNS, the acutal x,y coodrinate that ensures the robot does not go into the wall.
;Example
; (legal-x 0) => 15
(define (legal-x x)
  (cond
  [(< x MIN-X) MIN-X]
  [(and (<= x MAX-X) (>= x MIN-X)) x]
  [(> x MAX-X) MAX-X]
 ))

(define (legal-y y)
  (cond
  [(< y MIN-Y) MIN-Y]
  [(and (<= y MAX-X) (>= y MIN-Y)) y]
  [(> y MAX-Y) MAX-Y]
 ))

(define head (triangle 5 "solid" "red"))
(define body (circle 15 "solid" "black"))

(define (robot-image rbt)  
  (cond
   [(robot-north? rbt) (above head body )]
  [(robot-south? rbt) (above body head)]
  [(robot-east? rbt) (beside body head)]
  [(robot-west? rbt) (beside head body)]
   )
  )



(define (render rbt)
  (place-image (robot-image rbt) (robot-x rbt) (robot-y rbt) scene)
  )
