module DepTree where

import Data.Char
import qualified Data.Set as S

import qualified Data.List as L

import qualified HashTables as HT

import Common


data InfoCelda = IC {celda :: Celda,
		     expr :: Exp,
		     strexpr :: String,
		     valor :: Valor}
		deriving (Show,Eq)

instance Ord InfoCelda where
	compare x y = compare (celda x) (celda y)

type Graph = HT.HashTable InfoCelda (S.Set Celda)


{- INFOCELL -}

infocelda :: Celda -> Graph -> IO InfoCelda
infocelda c g = do expresion <- findExp c g
		   val <- findValor c g
		   str <- findStr c g
	           let info = IC {celda = c, expr = expresion, strexpr = str, valor = val} in return info

makeinfocelda :: Celda -> Exp -> String ->  Valor -> IO InfoCelda
makeinfocelda c e s v = let info = IC {celda = c, expr = e, strexpr = s , valor = v} in return info

findExp :: Celda -> Graph -> IO Exp
findExp c g = do xs <- HT.toList g
		 if xs == [] then return (Unit ()) else let listUnit = filter (\i -> celda (fst i) == c) xs in
							    if listUnit == [] then return (Unit ()) 
									      else let elem     = listUnit!!0
		 								       result   = expr (fst elem)
						        		           in return result
findValor:: Celda -> Graph -> IO Valor
findValor c g = do xs <- HT.toList g
	 	   if xs == [] then return (0,"",Nothing,Ok) else let listUnit = filter (\i -> celda (fst i) == c) xs in
							      if listUnit == [] then return (0,"",Nothing,Ok) 
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


updateCell :: Celda -> Exp -> String -> Valor -> Graph -> IO ()
updateCell c e s v     g = do oldExpr <- findExp c g
		              oldValor <- findValor c g
			      oldStr <- findStr c g
	                      let infoOld = IC {celda = c,expr = oldExpr,strexpr = oldStr ,valor = oldValor} in do maybeset <- HT.lookup g infoOld
						                                                                   case maybeset of
							                                                               Nothing -> do infoNew <- makeinfocelda c e s v
																     ginsert infoNew g 
							                                                               Just set -> do HT.delete g infoOld
									                                                              infoNew <- makeinfocelda c e s v
													                              HT.insert g infoNew set
{- QUEUES -}
type Queue = [Celda]


enqueue' :: Celda -> Queue -> IO Queue
enqueue' x s = return (s++[x])

enqueue :: Celda -> Queue -> IO Queue
enqueue x s = do s <- enqueue' x s
	         return s

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
app :: Graph -> ((InfoCelda,S.Set Celda) -> IO ()) -> IO ()
app g f = do xs <- HT.toList g
	     app' xs f


app' :: [(InfoCelda,S.Set Celda)] -> ((InfoCelda,S.Set Celda) -> IO ()) -> IO ()
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
bfs'' :: Graph -> Queue ->  S.Set Celda -> (Celda -> Exp -> String -> Graph -> IO ()) -> IO Graph
bfs'' g [] visited func = return g
bfs'' g q visited  func = do (i',q') <- pop q
		             if S.notMember i' visited then(do inf <- infocelda i' g
							       maybeset <- HT.lookup g inf
					                       case maybeset of
						                  Nothing -> return g
						                  Just set ->(do q <- putQueue set q
										 expre <- findExp i' g
										 str <- findStr i' g
										 func i' expre str g 
									         g <- bfs'' g q (S.insert i' visited) func
										 return g
									     ))
						       else do g <- bfs'' g q' visited func
							       return g

bfs' :: Celda -> Graph -> Queue -> (Celda -> Exp -> String -> Graph -> IO ())-> IO Graph
bfs' i g q func = do q <- putQueue (S.singleton i) q
		     g <- bfs'' g q S.empty func
		     return g
			  
bfs :: Celda -> Graph -> (Celda -> Exp -> String -> Graph -> IO ()) -> IO Graph
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
										 expre <- findExp i' g
										 str <- findStr i' g
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

