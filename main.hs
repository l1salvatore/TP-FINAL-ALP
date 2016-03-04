module Main where


import Common
import Eval
import DepTree
import Parse
import ModValor
import System.Console.Readline
import System.IO
import System.IO.Error
import Data.Char

printValor :: Typ -> Valor -> IO ()
printValor TNumeric v = print (num v)
printValor TString v = print (str v)
printValor TBoolean v = print (boo v)
printValor TUnit v = case (err v) of
			Ok -> putStrLn ""
			Err s -> print (Err s)


pp :: Graph -> IO ()
pp g = do putStrLn "-------------------"
	  app g (\a -> if (strexpr a) /= "" then pp' a else return ())

pp' :: InfoCelda -> IO()
pp'  i     = do putStr "celda: "
                putStr (fst (celda i))
		print (snd (celda i))
                putStr "string: "
                print (strexpr i)
		putStr "valor: "
		printValor (typ i) (valor i)
                putStrLn "-------------------"
   
printCell :: Celda -> IO String
printCell (c,n) = return ("Seleccione una celda (con las flechas)>  "++c++show n)

data Directions = U | D | L | R | None
	deriving (Eq)


dir :: IO Directions
dir   = do hSetEcho stdin False
	   x1 <- getChar
	   if x1 == '\ESC' then do x2 <- getChar 
				   if x2 == '[' then do x3 <- getChar
						        if x3 == 'C' then return R
						        else if x3 == 'A' then return U
						        else if x3 == 'D' then return L
						        else if x3 == 'B' then return D
						        else if x3 == '\n' then return None
							else dir--do putStr "PARADO"
							        --return ()
					        else if x2 == '\n' then return None
						else dir--do putStr "PARADO"
				                     --   return ()         
                           else if x1 == '\n' then return None
			   else if x1 == 'q' || x1 == 'Q' then error "Terminado" else dir


cambiar :: Celda -> IO Celda
cambiar c = do putStr "\ESC[2K"
	       putStr "\ESC[1G"
	       s <- printCell c
	       putStr s
	       d <- dir
	       if d /= None then cambiar (cambiar' c d) else return c


cambiar' :: Celda -> Directions -> Celda
cambiar' (c,1) U = (c,1)
cambiar' ("A",n) L = ("A",n)
cambiar' (c,99) D = (c,99)
cambiar' ("Z",n) R = ("Z",n)
cambiar' (c,n) L = ([chr (fromEnum (c!!0) - 1)],n)
cambiar' (c,n) R = ([chr (fromEnum (c!!0) + 1)],n)
cambiar' (c,n) U = (c,n-1)
cambiar' (c,n) D = (c,n+1)
cambiar' (c,n) None = (c,n)




interprete :: Graph -> IO ()
interprete gra     =(do putStrLn "/////////////////////"
			--x <- readline "Celda> "
			--putStrLn "Seleccione una celda (con las flechas)>  "
			c <- cambiar ("A",1)
			hSetEcho stdin True
                        e <- (parseExpr ([TokenEval] ++ [TokenCelda c]))
		        case e of
		                (Eval (Var c)) -> do putStrLn ""
		                                     y <- readline "Expresion> "
		                                     case y of
		                                           Nothing -> return ()
		                                           Just "_exit" -> return ()
		                      			   Just str1 -> do updateCell c TUnit str1 nuevoValor gra --let e = parseExpr (lexer str1) in
		 		      			                   gra <- bfs c gra evalCelda
				      			                   putStrLn "/////////////////////"
				     	 		                   pp gra 
				      		  	                   interprete gra
		                _              -> ioError (error("sintax error")))
		     `catchIOError` (\e -> do {print "Parse Error" ; interprete gra })

main :: IO ()                                                       
main = do putStr "\ESC[2J"
	  g <- newGraph
	  interprete g 
                            

                         
                        
                        


