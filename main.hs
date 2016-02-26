module Main where


import Common
import Eval
import DepTree
import Parse
import System.Console.Readline


printValor :: Valor -> IO ()
printValor (0,s,Nothing,Ok) = if s /= ""  then print s else putStrLn ""
printValor (f,"",Nothing,Ok) = if f /= 0 then print f else putStrLn ""
printValor (0,"",Just b,Ok) = print b
printValor (f,s,b,Err s') = print (Err s')

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
		printValor (valor i)
                putStrLn "-------------------"
   



interprete :: Graph -> IO ()
interprete gra     = do putStrLn "/////////////////////"
			x <- readline "Celda> "
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
		                                                                do --v <- evalExpr c e gra 
										   updateCell c e str1 (0,"",Nothing,Ok) gra
										   gra <- bfs c gra eval
										   putStrLn "/////////////////////"
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

