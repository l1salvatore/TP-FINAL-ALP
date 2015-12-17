module DepTree where

import Common
import Data.List 
data Tree = Nil | Node Celda [Tree]
				deriving(Show,Eq)

insertar :: Celda -> Celda -> Tree -> Tree
insertar c _ Nil = Nil
insertar c p (Node r t) = if r == p then Node p ((Node c []):t) else Node p (map (\tr -> insertar c p tr) t)


obtenerNodos :: Tree -> [Celda]
obtenerNodos Nil = []
obtenerNodos (Node r t) = r : nub (concat (map (\tr -> obtenerNodos tr) t))

{-
obtenerHijos :: Celda -> Tree -> [Celda]
obtenerHijos c Nil = []
obtenerHijos c (Node r t) = if c == r 
-}

{-
insert :: Celda {- a insertar -} -> Maybe Celda {- el padre -} -> Bool -> DTree -> DTree
insert c _ True Nil = Branches [(c,Nil)]
insert c _ False Nil = Nil
insert c Nothing _ (Branches xs) = Branches ((c,Nil):xs)
insert c (Just p) _ (Branches ((q,dt):xs)) 
						| p == q = Branches ((p,insert c Nothing True dt):xs)
					    | p /= q = Branches ((q, insert c (Just p) False dt):(map (\(celda,dtr) -> (celda,insert c (Just p) False dtr)) xs))  -}

-- B [(C4,Nil)]			

{-
	C4

-}

-- B [(C4,Nil),(A1,Nil)]

{-
	C4	A1

-}

-- B [(C4,B [(B3,Nil)]),(A1, Nil)]

{-
	C4	A1
	|
       B3	
-}

-- B [(C4,B [(B3,Nil),(B4,Nil)]),(A1,Nil)]

{-
	C4	  A1
       /  \ 
      B3  B4

-}
