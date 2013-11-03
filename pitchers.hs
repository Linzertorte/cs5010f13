data Pitcher = Pitcher { contents:: Int
                       , capacity:: Int
                       } deriving (Show)

data Move = Move { src::Int
                 , tgt::Int} deriving(Show)

pitchersAfterMove :: [Pitcher] -> Move -> [Pitcher]
pitchersAfterMove pitchers move =
    take (src move -1) pitchers ++ [Pitcher (src_contents - delta) src_capacity]
    ++ (drop (src move) $ take (tgt move - 1) $ pitchers)
    ++ [Pitcher (tgt_contents + delta) tgt_capacity] ++ (drop (tgt move) pitchers)
    where src_pitcher = pitchers !! (src move - 1)
          tgt_pitcher = pitchers !! (tgt move - 1)
          src_contents = contents src_pitcher
          tgt_contents = contents tgt_pitcher
          src_capacity = capacity src_pitcher
          tgt_capacity = capacity tgt_pitcher
          delta = min src_contents (tgt_capacity - tgt_contents)
