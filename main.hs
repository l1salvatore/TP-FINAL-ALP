module Main where


import Common
import Eval
import DepTree
import Parse
import System.Console.Readline
--import Graphics.UI.Gtk
{-

v2str :: V -> String
v2str (F f) = show f
v2str (S s) = s
v2str (B b) = show b
v2str (Cero) = ""
v2str (Error err) = err

list2str :: [Expresiones] -> String
list2str [] = ""
list2str (e:es) = if es == [] then expr2str e else expr2str e ++ "," ++ list2str es

expr2str :: Expresiones -> String
expr2str (Valor c) = v2str c
expr2str (Var ce) = "[" ++ fst ce ++ "," ++ show (snd ce) ++ "]"
expr2str (Eval e) = "=" ++ expr2str e
expr2str (Suma e1 e2) = "(" ++ expr2str e1 ++ " + " ++ expr2str e2 ++ ")"
expr2str (Resta e1 e2) = "(" ++  expr2str e1 ++ " - " ++ expr2str e2  ++ ")"
expr2str (Mult e1 e2) ="(" ++   expr2str e1 ++ " * " ++ expr2str e2 ++ ")"
expr2str (Div e1 e2) = "(" ++  expr2str e1 ++ " / " ++ expr2str e2 ++ ")"
expr2str (Sumatoria es) = "suma(" ++ list2str es ++ ")"
expr2str (Abs e) = "abs(" ++ expr2str e ++ ")"
expr2str (Concat es) = "concat(" ++ list2str es ++ ")"
expr2str (Derecha e1 e2) = "derecha(" ++ expr2str e1 ++ "," ++ expr2str e2 ++ ")"
expr2str (Menor e1 e2) = "(" ++ expr2str e1 ++ " < " ++ expr2str e2 ++ ")"
expr2str (MenorIg e1 e2) = "(" ++ expr2str e1 ++ " <= " ++ expr2str e2 ++ ")"
expr2str (Mayor e1 e2) = "(" ++ expr2str e1 ++ " > " ++ expr2str e2 ++ ")"
expr2str (MayorIg e1 e2) = "(" ++ expr2str e1 ++ " >= " ++ expr2str e2 ++ ")"
expr2str (Igual e1 e2) = "(" ++ expr2str e1 ++ " == " ++ expr2str e2 ++ ")"
expr2str (Y es) = "Y(" ++ list2str es ++ ")"
expr2str (O es) = "O(" ++ list2str es ++ ")"
expr2str (SI eb e1 e2) = "SI(" ++ expr2str eb ++ "," ++ expr2str e1 ++ "," ++ expr2str e2 ++ ")"
expr2str (NO e) = "NO(" ++ expr2str e ++ ")"



printEnt :: Entorno -> IO()
printEnt ([],[]) = putStr ""
printEnt ((c,e):se,(_,v):sv) = (putStr "\nCell ") >>= (\_ -> 
				print c) >>= (\_ -> 
				putStr "Input=") >>= (\_ -> 
				print (expr2str e)) >>= (\_ -> 
				putStr "Val=") >>= (\_ -> 
				print v) >>= (\_ -> 
				printEnt (se,sv))




interprete :: Entorno -> IO()
interprete ent = (readline "> ") >>= (\x -> case x of
			Nothing -> return ()
			Just ">quit" -> return ()
			Just str -> case parse str of
				     Left err -> ((putStr "parse error at ") >>= (\_ -> print err)) >>= (\_ -> interprete ent)		   
				     Right a  -> let e = eval' a ent in
						(putStr ("-------------------\n")) >>= (\_ -> printEnt e) >>= (\_ -> putStr  ("-------------------\n")) >>= (\_ -> interprete e)) -}



pp :: Graph -> IO ()
pp g = do putStrLn "-------------------"
	  app g (\(a,b) -> pp' a)

pp' :: InfoCelda -> IO()
pp'  i     = do putStr "celda: "
                putStr (fst (celda i))
		print (snd (celda i))
                putStr "string: "
                print (strexpr i)
		putStr "valor: "
		print (valor i)
                putStrLn "-------------------"
   



interprete :: Graph -> IO ()
interprete gra     = do x <- readline "Celda> "
                        case x of
		                Nothing -> return ()
		                Just "_exit" -> return ()
		                Just str -> case (parseExpr ([TokenEval] ++ lexCelda str)) of
		                       (Eval (Var c)) -> do putStrLn ""
		                                            y <- readline "Expresion> "
		                                            case y of
		                                                Nothing -> return ()
		                                                Just "_exit" -> return ()
		                                                Just str1 -> let e = parseExpr (lexer str1) in
		                                                                do v <- evalExpr c e gra 
										   updateCell c e str1 v gra
										   gra <- bfs c gra eval
										   pp gra 
		                                                                   interprete gra
		                       _              -> error("sintax error") >>= (\_ -> interprete gra)
main :: IO ()                                           
main = do g <- newGraph
	  interprete g 
                                                     
                        
                        
                        {- 
(readline "Celda> ") >>= (\x -> case x of 
		Nothing  -> return ()
		Just str -> print ( eval (parseExpr ( (lexer str ) ))))
-}
main1 = (readline "> ") >>= (\x -> case x of 
		Nothing  -> return ()
		Just str -> print ( ( (lexer str ) )))
