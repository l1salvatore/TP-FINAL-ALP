module Eval where

import Common
import DepTree


eval :: Celda -> Exp -> String -> Graph -> IO ()
eval c e s g =  do v <- evalExpr c e g
		   updateCell c e s v g



ret :: Typ -> Float -> String -> Error -> Error -> IO Valor
ret Numeric f s Ok Ok = if s /= "" then return (0,"",Err "VALOR") else return (f,s,Ok)
ret Stringg f s Ok Ok = if f /= 0 then return (0,"",Err "VALOR") else return (f,s,Ok)
ret t f s e1 (Err str) = return (0,"",Err str)
ret t f s (Err str) e2 = return (0,"",Err str)





evalExpr :: Celda -> Exp -> Graph -> IO Valor
evalExpr ce (Str s) g = return (0,s,Ok)
evalExpr ce (Fl f) g = return (f,"",Ok)
evalExpr ce (Unit ()) g = return (0,"",Ok)
evalExpr ce (Eval e) g = evalExpr' ce e g





evalExpr' :: Celda -> ExpEval -> Graph -> IO Valor
evalExpr' ce (Var c) g =  do e <- findExp c g
			     r <- evalExpr c e g
			     i <- infocelda c g
			     i' <- infocelda ce g 
			     ginsertEdge i i' g
			     return r
			     
			     
evalExpr' ce (EStr s) g = return (0,s,Ok)


evalExpr' ce (EFl f) g = return (f,"",Ok)


evalExpr' ce (Mas e1 e2) g = do (f1,s1,e1) <- evalExpr' ce e1 g
			        (f2,s2,e2) <- evalExpr' ce  e2 g
			        ret Numeric (f1+f2) (s1++s2) e1 e2
			        
			        
evalExpr' ce (Menos e1 e2) g = do (f1,s1,e1) <- evalExpr' ce e1 g
		 	          (f2,s2,e2) <- evalExpr' ce e2 g
			          ret Numeric (f1-f2) (s1++s2) e1 e2
			          
			          
evalExpr' ce (Por e1 e2) g = do (f1,s1,e1) <- evalExpr' ce e1 g
			        (f2,s2,e2) <- evalExpr' ce e2 g
			        ret Numeric (f1*f2) (s1++s2) e1 e2
			        
			        
evalExpr' ce (Div e1 e2) g =  do (f1,s1,e1) <- evalExpr' ce e1 g
			         (f2,s2,e2) <- evalExpr' ce e2 g
			         if f2 == 0 then return (0,"",Err "DIVISION POR CERO") else ret Numeric (f1/f2) (s1++s2) e1 e2
			         
			         
evalExpr' ce (Ig e1 e2) g =do a <- evalExpr' ce  e1 g
			      b <- evalExpr' ce e2 g
			      if a == b then return (1,"",Ok) else return (0,"",Ok)
			      
			      
evalExpr' ce (Suma []) g = return (0,"",Ok)
evalExpr' ce (Suma (e:xs)) g= do (f1,s1,e1) <- evalExpr' ce  e g
		                 (f,s,e) <- evalExpr' ce (Suma xs) g
			         ret Numeric (f1+f) (s1++s) e1 e
			         
			         
evalExpr' ce (Abs e) g = do (f,s,e) <- evalExpr' ce e g
		            ret Numeric (abs(f)) s Ok e
		            
		            
evalExpr' ce  (Concat []) g = return (0,"",Ok)
evalExpr' ce  (Concat (e:xs)) g = do (f1,s1,e1) <- evalExpr' ce e g
			             (f,s,e) <- evalExpr' ce (Concat xs) g
			             ret Stringg (f1+f) (s1++s) e1 e
			             
			             
evalExpr' ce (Opuesto e) g = do (f,s,e) <- evalExpr' ce e g
			        ret Numeric (-1*f) s e Ok


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



