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
import System.Environment 
import ParseFiles


-- Preety printer (Auxiliar)
printValor :: Typ -> Valor -> IO ()
printValor TNumeric v = print (num v)
printValor TString v = print (str v)
printValor TBoolean v = print (boo v)
printValor TDate v = print (dat v)
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
   
-- Printer del selector de celdas
printInputCell :: Bool -> Celda -> IO String
printInputCell True (c,n) = return ("Seleccione una celda (con las flechas)>  "++c++show n)
printInputCell False (c,n) = return (c++show n)


-- Direcciones
data Directions = U | D | L | R | None
	deriving (Eq)

-- Obtiene del teclado una dirección dada una flecha
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
			   else if x1 == 'q' || x1 == 'Q' then ioError (userError "---Terminado---") else dir

-- Dada una celda inicial, cambia hacia las celdas vecinas
cambiar :: Celda -> IO Celda
cambiar c = do putStr "\ESC[2K"
	       putStr "\ESC[1G"
	       s <- printInputCell True c
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



-- El interprete con un grafo como estado
interprete :: Graph -> IO ()
interprete gra     =(do putStrLn "/////////////////////"
			c <- cambiar ("A",1)
			hSetEcho stdin True
                        e <- (parseExpr ([TokenEval] ++ [TokenCelda c]))
		        case e of
		                (Eval (Var c)) -> do putStrLn ""
		                                     y <- readline "Expresion> "
		                                     case y of
		                                           Nothing -> return ()
		                                           Just "_exit" -> ioError (userError "---Terminado---") 
		                      			   Just str1 -> do updateCell c TUnit str1 nuevoValor gra --let e = parseExpr (lexer str1) in
		 		      			                   gra <- bfs c gra evalCelda
				      			                   putStrLn "/////////////////////"
				     	 		                   pp gra 
				      		  	                   interprete gra
		                _              -> ioError (error("sintax error")))
		     




readAssign :: Assign -> Graph -> IO ()
readAssign Empty g = return ()
readAssign (Let cell exps) g = (do updateCell cell TUnit exps nuevoValor g --let e = parseExpr (lexer str1) in
		 	           g <- bfs cell g evalCelda
				   return ()) `catchIOError` (\e -> do { strcell <- printInputCell False cell; main' ("ERROR DE PARSEO EN LA CELDA "++strcell++"\n")})
readAssign (Cat a1 a2) g = do readAssign a1 g
			      readAssign a2 g



main :: IO ()
main = main' ""

main' :: String -> IO ()                                                       
main' e =(do putStr "\ESC[2J"
	     hSetEcho stdin False
	     putStr e
	     putStrLn "Ingrese modo de uso:"
	     putStrLn "1- Interprete"
	     putStrLn "2- Interprete a partir de archivo"
	     putStrLn "3- Salir"
	     opc <- getChar
	     case opc of
		  '1'      ->   do g <- newGraph
	  		           interprete g
	          '2'      ->   do hSetEcho stdin True
				   s <- readline "Archivo> "
				   case s of
					     Nothing -> main' "ARCHIVO NO PASADO, INTENTE DE VUELTA\n"
					     Just str -> let n = length str - 5 in
							      case (take n str,drop n str) of
								   (str',".calc") -> (do g <- newGraph
										         s <- readFile str
										         a <- parseFile s
										         readAssign a g
										         pp g
										         interprete g)
						           	   (str',otherstr) -> main' "ARCHIVO NO VALIDO, INTENTE DE VUELTA\n"
		  '3'      ->  ioError (userError "---Terminado---") 
		  n       ->  main' "OPCION NO VALIDA, INTENTE DE VUELTA\n")
		`catchIOError` (\e -> case (ioeGetErrorString e) of
				  	"---Terminado---" -> do putStrLn "\n---Terminado---"
			 					return ()
                            		"does not exist"  -> main' "ARCHIVO NO EXISTENTE\n") 

                         
                        
                        


