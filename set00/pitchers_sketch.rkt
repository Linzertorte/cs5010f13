

(define (pitchers=? ps1 ps2)
  )


(define-struct configuration (pitchers moves))

;;member?: Picthers Listof<Pitchers> -> Boolean
(define (member? pitchers pitchers-set)
  (ormap 
   (lambda (p) (pitchers=? pitchers p))
   pitchers-set))

;;successors: Listof<Configuration>-> Listof<Configuration>
(define (successor confs)
  (foldr append empty
	 (map next-configurations confs)))


(define (next-configuration config i j)
  (local
    (define move (make-move i j))
    (make-configuration (pitchers-after-move (configuration-pitchers config)
					     move)
			(cons move (configuration-moves config)))))

(define (next-configurations config i j n)
  (if (= i (+ n 1)) empty
      (if (= j (+ n 1))
	  (next-configurations config (+ i 1) 1)
	  (cons (next-configuration config i j)
		(next-configurations config i (+ j 1) n)))))



  
(define (configuration-diff confs pitchers-set)
  (filter 
   (lambda (conf)
     (not (member? (configuration-pitchers conf) pitchers-set)))
   confs))

;;set-diff: Listof<Configuration> Listof<Pithers> -> Listof<Configurations>
;;
;;Configuration is (pitchers moves)
;;Listof<Pithers> Listof<Configurations> Graph -> MaybeListof<Move>
  (define (solver searched newest)
    (local
      (define answer (filter configuration-reach-goal? newest))
      (define searchednew (append searched (map configuration-pitchers newest)))
      (define candidates (configuration-diff (successors newest) searchednew))
      (if (cons? answer) (configuration-moves (first answer))
	  (solver searchednew candidates)
	  )))




