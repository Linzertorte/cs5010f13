
successors: Listof<Configurations>-> Listof<Configurations>
next-configurations conf1 0 0 n 
conf2 


next-configuration conf i j 

after-move, cons move



next-configurations: Configuration i j n 

(define (next-configurations i j n)
  if i==n
  



set-diff: Listof<Configurations> Listof<Pithers> -> Listof<Configurations>

Configuration is (pitchers moves)
Listof<Pithers> Listof<Configurations> Graph -> MaybeListof<Move>
(define (solver searched newest)
  (
   (filter reach-goal? newest) not empty return moves
    searched+=newest.getPicteher. 
   (candidates set-diff (successors newest) searched)
  
   (solver searched candidates graph)
   ))



