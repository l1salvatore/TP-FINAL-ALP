module DepTree where


import Common
import Eval
import Data.Tree




createTree :: Celda {- padre -} -> [Celda] {- Hijos -} -> Tree Celda
createTree x xs = unfoldTree (\c -> (c,xs))  x



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
