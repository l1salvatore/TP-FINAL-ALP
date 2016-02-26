module Eval where

import Common
import DepTree


eval :: Celda -> Exp -> String -> Graph -> IO ()
eval c e s g =  do i <- infocelda c g
		   elimNeightBours g i
		   v <- evalExpr c e g
		   updateCell c e s v g

and' :: Maybe Bool -> Maybe Bool -> Maybe Bool
and' Nothing Nothing = Nothing
and' Nothing b2 = and' (Just True) b2
and' b1 Nothing = and' b1 (Just True)
and' (Just b1) (Just b2) = Just (b1 && b2)

or' :: Maybe Bool -> Maybe Bool -> Maybe Bool
or' Nothing Nothing = Nothing
or' Nothing b2 = or' (Just True) b2
or' b1 Nothing = or' b1 (Just True)
or' (Just b1) (Just b2) = Just (b1 || b2)

ret :: Typ -> Float -> String -> Maybe Bool -> Error -> Error -> IO Valor
ret Numeric f s b Ok Ok = if s /= "" || b /= Nothing then return (0,"",Nothing,Err "VALOR") else return (f,s,b,Ok)
ret Stringg f s b Ok Ok = if f /= 0 || b /= Nothing then return (0,"",Nothing,Err "VALOR") else return (f,s,b,Ok)
ret Boolean f s b Ok Ok = if f /= 0 || s /= "" then return (0,"",Nothing,Err "VALOR") else return (f,s,b,Ok)
ret t f s b e1 (Err str) = return (0,"",Nothing,Err str)
ret t f s b (Err str) e2 = return (0,"",Nothing,Err str)





evalExpr :: Celda -> Exp -> Graph -> IO Valor
evalExpr ce (Str s) g = ret Stringg 0 s Nothing Ok Ok
evalExpr ce (Fl f) g = ret Numeric f "" Nothing Ok Ok
evalExpr ce (Bo b) g = ret Boolean 0 "" (Just b) Ok Ok
evalExpr ce (Unit ()) g = return (0,"",Nothing,Ok)
evalExpr ce (Eval e) g = evalExpr' ce e g





evalExpr' :: Celda -> ExpEval -> Graph -> IO Valor
evalExpr' ce (Var c) g =  do e <- findExp c g
			     i <- infocelda c g
			     i' <- infocelda ce g 
			     b <- existsRoad ce c g
			     if b then do ginsertEdge i i' g
					  print b
					  return (0,"",Nothing,Err "CICLO DETECTADO") 
				  else do r <- evalExpr c e g
					  ginsertEdge i i' g 
					  return r

			     
			     
evalExpr' ce (EStr s) g = ret Stringg 0 s Nothing Ok Ok 


evalExpr' ce (EFl f) g = ret Numeric f "" Nothing Ok Ok

evalExpr' ce (EBo b) g = ret Boolean 0 "" (Just b) Ok Ok


evalExpr' ce (Mas e1 e2) g = do (f1,s1,b1,e1) <- evalExpr' ce e1 g
			        (f2,s2,b2,e2) <- evalExpr' ce  e2 g
			        ret Numeric (f1+f2) (s1++s2) (and' b1 b2) e1 e2
			        
			        
evalExpr' ce (Menos e1 e2) g = do (f1,s1,b1,e1) <- evalExpr' ce e1 g
		 	          (f2,s2,b2,e2) <- evalExpr' ce e2 g
			          ret Numeric (f1-f2) (s1++s2) (and' b1 b2) e1 e2
			          
			          
evalExpr' ce (Por e1 e2) g = do (f1,s1,b1,e1) <- evalExpr' ce e1 g
			        (f2,s2,b2,e2) <- evalExpr' ce e2 g
			        ret Numeric (f1*f2) (s1++s2) (and' b1 b2) e1 e2
			        
			        
evalExpr' ce (Div e1 e2) g =  do (f1,s1,b1,e1) <- evalExpr' ce e1 g
			         (f2,s2,b2,e2) <- evalExpr' ce e2 g
			         if f2 == 0 then return (0,"",Nothing,Err "DIVISION POR CERO") else ret Numeric (f1/f2) (s1++s2) (and' b1 b2) e1 e2
			         
			         
evalExpr' ce (Ig e1 e2) g =do a <- evalExpr' ce e1 g
			      b <- evalExpr' ce e2 g
			      ret Boolean 0 "" (Just (a == b)) Ok Ok

evalExpr' ce (Menor e1 e2) g =do (f1,s1,b1,e1) <- evalExpr' ce  e1 g
			         (f2,s2,b2,e2) <- evalExpr' ce e2 g
			         ret Boolean 0 (s1++s2) (Just (f1 < f2)) e1 e2

evalExpr' ce (Mayor e1 e2 ) g = do (f1,s1,b1,e1) <- evalExpr' ce e1 g
				   (f2,s2,b2,e2) <- evalExpr' ce e2 g
				   ret Boolean 0 (s1++s2) (Just (f1 > f2)) e1 e2

evalExpr' ce (MenorIg e1 e2) g =do (f1,s1,b1,e1) <- evalExpr' ce  e1 g
			           (f2,s2,b2,e2) <- evalExpr' ce e2 g
			           ret Boolean 0 (s1++s2) (Just (f1 <= f2)) e1 e2

evalExpr' ce (MayorIg e1 e2 ) g = do (f1,s1,b1,e1) <- evalExpr' ce e1 g
			   	     (f2,s2,b2,e2) <- evalExpr' ce e2 g
				     ret Boolean 0 (s1++s2) (Just (f1 >= f2)) e1 e2

evalExpr' ce (And e1 e2) g = do (f1,s1,b1,e1) <- evalExpr' ce e1 g
				(f2,s2,b2,e2) <- evalExpr' ce e2 g
				ret Boolean (f1+f2) (s1++s2) (and' b1 b2) e1 e2

evalExpr' ce (Or e1 e2) g = do (f1,s1,b1,e1) <- evalExpr' ce e1 g
			       (f2,s2,b2,e2) <- evalExpr' ce e2 g
			       ret Boolean (f1+f2) (s1++s2) (or' b1 b2) e1 e2
			      
			      
evalExpr' ce (Suma []) g = return (0,"",Nothing,Ok)
evalExpr' ce (Suma (e:xs)) g= do (f1,s1,b1,e1) <- evalExpr' ce  e g
		                 (f,s,b,e) <- evalExpr' ce (Suma xs) g
			         ret Numeric (f1+f) (s1++s) (and' b1 b) e1 e
			         
			         
evalExpr' ce (Abs e) g = do (f,s,b,e) <- evalExpr' ce e g
		            ret Numeric (abs(f)) s b Ok e
		            
		            
evalExpr' ce  (Concat []) g = return (0,"",Nothing,Ok)
evalExpr' ce  (Concat (e:xs)) g = do (f1,s1,b1,e1) <- evalExpr' ce e g
			             (f,s,b,e) <- evalExpr' ce (Concat xs) g
			             ret Stringg (f1+f) (s1++s) (and' b1 b) e1 e
			             
			             
evalExpr' ce (Opuesto e) g = do (f,s,b,e) <- evalExpr' ce e g
			        ret Numeric (-1*f) s b e Ok


{-			
eval :: Celda -> Exp -> String -> Graph -> IO ()
eval c e s g =  do (v,g) <- evalExpr c e g
		   updateCell c e s v g


evalExpr :: Celda -> Exp -> Graph -> IO ((Float,String),Graph)
evalExpr ce (Str s) g = return ((0,s),g)
evalExpr ce (Fl f) g = return ((f,""),g)
evalExpr ce (Unit ()) g = return ((0,""),g)
evalExpr ce (Eval e) g = evalExpr' ce e g



evalExpr' :: Celda -> ExpEval -> Graph -> IO ((Float,String),Graph)
evalExpr' ce (Var c) g =  do e <- findExp c g
			     (r,g) <- evalExpr c e g
			     i <- infocelda c g
			     i' <- infocelda ce g 
			     ginsertEdge i i' g
			     return (r,g)
evalExpr' ce (EStr s) g = return ((0,s),g)
evalExpr' ce (EFl f) g = return ((f,""),g)
evalExpr' ce (Mas e1 e2) g = do ((f1,s1),g) <- evalExpr' ce e1 g
			        ((f2,s2),g) <- evalExpr' ce  e2 g
			        return ((f1+f2,""),g)
evalExpr' ce (Menos e1 e2) g = do ((f1,s1),g) <- evalExpr' ce e1 g
		 	          ((f2,s2),g) <- evalExpr' ce e2 g
			          return ((f1-f2,""),g)
evalExpr' ce (Por e1 e2) g = do ((f1,s1),g) <- evalExpr' ce  e1 g
			        ((f2,s2),g) <- evalExpr' ce e2 g
			        return ((f1*f2,""),g)
evalExpr' ce (Div e1 e2) g =  do ((f1,s1),g) <- evalExpr' ce e1 g
			         ((f2,s2),g) <- evalExpr' ce e2 g
			         if f2 == 0 then error ("div cero!") else return ((f1 / f2,""),g)
evalExpr' ce (Ig e1 e2) g =do (a,g) <- evalExpr' ce  e1 g
			      (b,g) <- evalExpr' ce e2 g
			      if a == b then return ((1,""),g) else return ((0,""),g)
evalExpr' ce (Suma []) g = return ((0,""),g)
evalExpr' ce (Suma (e:xs)) g= do ((f1,s1),g) <- evalExpr' ce  e g
		                 ((f,s),g) <- evalExpr' ce (Suma xs) g
			         return ((f1+f,""),g)
evalExpr' ce (Abs e) g = do ((f,s),g) <- evalExpr' ce e g
		            return ((abs(f),""),g)
evalExpr' ce  (Concat []) g = return ((0,""),g)
evalExpr' ce  (Concat (e:xs)) g = do ((f1,s1),g) <- evalExpr' ce e g
			             ((f,s),g) <- evalExpr' ce (Concat xs) g
			             return ((0,s1 ++ s),g)
evalExpr' ce (Opuesto e) g = do ((f,s),g) <- evalExpr' ce e g
			        return ((-1*f,""),g)
-}


 




						
			     -- Hay que tratar de no hacer calculos innecesarios
			     -- Arbol de dependencias
			     -- backend



