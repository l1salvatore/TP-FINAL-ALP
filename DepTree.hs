module DepTree where

import Data.Char
import qualified Data.Set as S

import qualified Data.List as L

import qualified HashTables as HT

import Common

import ModValor

data InfoCelda = IC {
		     celda :: Celda,
		     --expr :: Exp,
		     strexpr :: String,
		     valor :: Valor , 
		     typ :: Typ}
		deriving (Show,Eq)

instance Ord InfoCelda where
	compare x y = compare (celda x) (celda y)

type Graph = HT.HashTable InfoCelda (S.Set Celda)


{- INFOCELL -}

findTy :: Celda -> Graph -> IO Typ
findTy c g = do xs <- HT.toList g
		if xs == [] then return TUnit else let listUnit = filter (\i -> celda (fst i) == c) xs in
							    if listUnit == [] then return TUnit
									      else let elem     = listUnit!!0
		 								       result   = typ (fst elem)
						        		           in return result
findValor:: Celda -> Graph -> IO Valor
findValor c g = do xs <- HT.toList g
	 	   if xs == [] then return nuevoValor else let listUnit = filter (\i -> celda (fst i) == c) xs in
							      if listUnit == [] then return nuevoValor 
									        else let elem     = listUnit!!0
		 								         result   = valor (fst elem)
						        		             in return result

findStr:: Celda -> Graph -> IO String
findStr c g = do xs <- HT.toList g
	 	 if xs == [] then return "" else let listUnit = filter (\i -> celda (fst i) == c) xs in
							     if listUnit == [] then return "" 
									       else let elem     = listUnit!!0
		 								        result   = strexpr (fst elem)
						        		            in return result

-- dado una celda y un grafo busca su información en el grafo
infocelda :: Celda -> Graph -> IO InfoCelda
infocelda c g = do ty <- findTy c g
		   val <- findValor c g
		   str <- findStr c g
	           let info = IC {celda = c, typ = ty, strexpr = str, valor = val} in return info


-- crea una estructura información
makeinfocelda :: Celda -> Typ -> String ->  Valor -> IO InfoCelda
makeinfocelda c t s v = let info = IC {celda = c, typ = t , strexpr = s , valor = v} in return info




-- dado una celda, una expresión , una string, y un valor actualiza la info de una celda en el grafo
updateCell :: Celda -> Typ -> String -> Valor -> Graph -> IO ()
updateCell c t s v g = do infoOld <- infocelda c g 
			  maybeset <- HT.lookup g infoOld
			  case maybeset of
				Nothing -> do infoNew <- makeinfocelda c t s v
					      ginsert infoNew g 
				Just set -> do HT.delete g infoOld
					       infoNew <- makeinfocelda c t s v
					       HT.insert g infoNew set
{- QUEUES -}
type Queue = [Celda]



enqueue :: Celda -> Queue -> IO Queue
enqueue x s = return (s++[x])

pop :: Queue -> IO (Celda,Queue)
pop (x:xs) = return (x,xs)

putQueue :: S.Set Celda -> Queue -> IO Queue
putQueue set q = return (L.nub (q ++ S.elems set))



{- GRAPHS -}
newGraph :: IO Graph
newGraph = HT.new (\x y -> celda x == celda y) (\x -> HT.hashString (fst (celda x)) + HT.hashInt (snd (celda x)))

ginsert :: InfoCelda -> Graph -> IO ()
ginsert v g = do maybeset <- HT.lookup g v
		 case maybeset of
		    Nothing -> HT.insert g v (S.empty) 
		    Just set -> return ()


ginsertEdge :: InfoCelda-> InfoCelda -> Graph -> IO ()
ginsertEdge v v' g = do maybeset1 <- HT.lookup g v
			maybeset2 <- HT.lookup g v'
		        case maybeset1 of
			    Nothing -> do ginsert v g
					  ginsertEdge v v' g
			    Just set1 -> case maybeset2 of
				 Nothing -> do ginsert v' g
					       ginsertEdge v v' g
				 Just set2 -> do b1 <- HT.update g v (S.insert (celda v') set1)
						 return ()

gremoveEdge :: InfoCelda -> InfoCelda -> Graph -> IO ()
gremoveEdge v v' g = do maybeset1 <- HT.lookup g v
			maybeset2 <- HT.lookup g v'
			case maybeset1 of
			    Nothing -> return ()
			    Just set1 -> case maybeset2 of
			         Nothing -> return ()
				 Just set2 -> do b1 <- HT.update g v (S.delete (celda v') set1)
						 return ()


-- APP
app :: Graph -> (InfoCelda-> IO ()) -> IO ()
app g f = do xs <- HT.toList g
	     app' (map (\(a,b) -> a) xs) f


app' :: [InfoCelda] -> (InfoCelda -> IO ()) -> IO ()
app' [] f = return ()
app' (x:xs) f = do f x
		   app' xs f



appList :: [a] -> (a -> IO ()) -> IO ()
appList [] f = return ()
appList (x:xs) f = do f x
		      appList xs f
		    

-- GET NEIGHTBOURS

getNeightBours :: Graph -> InfoCelda -> IO [InfoCelda]
getNeightBours g ic = do t <- HT.toList g
		 	 let t' = map (\(k,v) -> k) (filter (\(k,v) -> S.member (celda ic) v) t) in return t' 

elimNeightBours :: Graph -> InfoCelda -> IO ()
elimNeightBours g ic = do t <- getNeightBours g ic
			  appList t (\x -> gremoveEdge x ic g)

-- BFS
bfs'' :: Graph -> Queue ->  S.Set Celda -> (Celda -> Graph -> IO ()) -> IO Graph
bfs'' g [] visited func = return g
bfs'' g q visited  func = do (i',q') <- pop q
		             if S.notMember i' visited then(do inf <- infocelda i' g
							       maybeset <- HT.lookup g inf
					                       case maybeset of
						                  Nothing -> return g
						                  Just set ->(do q <- putQueue set q
										 func i' g 
									         g <- bfs'' g q (S.insert i' visited) func
										 return g
									     ))
						       else do g <- bfs'' g q' visited func
							       return g

bfs' :: Celda -> Graph -> Queue -> (Celda -> Graph -> IO ())-> IO Graph
bfs' i g q func = do q <- putQueue (S.singleton i) q
		     g <- bfs'' g q S.empty func
		     return g
			  
bfs :: Celda -> Graph -> (Celda -> Graph -> IO ()) -> IO Graph
bfs i g func = do g <- bfs' i g [] func
		  return g


-- OTHER BFS 
otherbfs'' :: Graph -> Queue ->  S.Set Celda -> IO [Celda]
otherbfs'' g [] visited = return []
otherbfs'' g q visited = do (i',q') <- pop q
		            if S.notMember i' visited then(do inf <- infocelda i' g
							      maybeset <- HT.lookup g inf
					                      case maybeset of
						                  Nothing -> return []
						                  Just set ->(do q <- putQueue set q
									         xs <- otherbfs'' g q (S.insert i' visited)
										 return (i':xs)
									     ))
						      else (do xs <- otherbfs'' g q' visited
							       return xs)

otherbfs'  :: Celda -> Graph -> Queue -> IO [Celda]
otherbfs'  i g q = do q <- putQueue (S.singleton i) q
		      xs <- otherbfs'' g q S.empty
		      return xs
			  
otherbfs :: Celda -> Graph -> IO [Celda]
otherbfs i g = do xs <- otherbfs' i g []
		  return xs


-- EXISTS ROAD
existsRoad :: Celda -> Celda -> Graph -> IO Bool
existsRoad x y g = do xs <- otherbfs x g
		      if elem y xs then return True else return False

