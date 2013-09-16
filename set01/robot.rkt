;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(define ROBOT-RADIUS 15)
(define CANVAS-HEIGHT 200)
(define CANVAS-WIDTH 400)


; A RobotOrientation is one of
; -- "north", the robot is facing north
; -- "east", the robot is facing east
; -- "south", the robot is facing south
; -- "west", the robot is facing west
; Template
; rbtort-fn: RobotOrientation -> ??
; (define (rbtort-fn rbtort)
;   (cond
;     [(string=? rbtort "north") ...]
;     [(string=? rbtort "east") ...]
;     [(string=? rbtort "south") ...]
;     [(string=? rbtort "west") ...]
;     ))

(define-struct robot (x y rbtort image))
; A Robot is a
; (make-robot Number Number RobotOrientation)
; Interp
; x is the x-coordinate of robot in the scene
; y is the y-coordinate of robot in the scene
; rbtort is the RobotOrientation of the robot
; robot-fn: Robot -> ??
(define (robot-fn r)
  (...
   (robot-x r)
   (robot-y r)
   (robot-rbtort r)
   (robot-image r)
   )
  )
(define ROBOT-IMAGE  (circle 15 "solid" "black"))
(define scene (empty-scene CANVAS-WIDTH CANVAS-HEIGHT))
(define myrobot (make-robot 0 0 "north" ROBOT-IMAGE))
;robot-at : PosInt PosInt -> Robot
;GIVEN: a set of (x,y) coordinates
;RETURNS: a robot with its center at those coordinates, facing north
;(up).

