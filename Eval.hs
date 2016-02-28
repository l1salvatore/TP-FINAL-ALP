module Eval where

import Common
import DepTree
import qualified Data.Set as S
import Control.Monad.State
import Parse
import ModValor


evalCelda :: Celda -> Graph -> IO ()
evalCelda c g =  do i <- infocelda c g
	 	    elimNeightBours g i
		    let newExpr = if (strexpr i == "") then Unit () else parseExpr (lexer (strexpr i)) in do (t,v) <- evalExpr c newExpr g
								                                             updateCell c t (strexpr i) v g

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




evalExpr :: Celda -> Exp -> Graph -> IO (Typ,Valor)
evalExpr ce (Str s) g = return (TString,string s)
evalExpr ce (Fl f) g = return (TNumeric,numeric f)
evalExpr ce (Bo b) g = return (TBoolean,boolean b)
evalExpr ce (Unit ()) g = return (TUnit, nuevoValor)
evalExpr ce (Eval e) g = evalExpr' ce e g





evalExpr' :: Celda -> ExpEval -> Graph -> IO (Typ,Valor)
evalExpr' ce (Var c) g =  do i <- infocelda c g
			     i' <- infocelda ce g 
			     b <- existsRoad ce c g
			     if b then do ginsertEdge i i' g
					  print b
					  raise (Err "CICLO DETECTADO") 
				  else let e = if (strexpr i == "") then Unit () else parseExpr (lexer (strexpr i)) in do r <- evalExpr c e g
								    							  ginsertEdge i i' g 
								    						          return r

			     
			     
evalExpr' ce (EStr s) g = return (TString,string s)


evalExpr' ce (EFl f) g = return (TNumeric,numeric f)

evalExpr' ce (EBo b) g = return (TBoolean,boolean b)


evalExpr' ce (Mas e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
			        (t2,v2) <- evalExpr' ce e2 g
			        if (t1 == TNumeric && t2 == TNumeric) then funcNumeric (\x y -> x + y) v1 v2 else raise (Err "VALOR")
			        
evalExpr' ce (Menos e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
		 	          (t2,v2) <- evalExpr' ce e2 g
			          if (t1 == TNumeric && t2 == TNumeric) then funcNumeric (\x y -> x - y) v1 v2 else raise (Err "VALOR")			          
			          
evalExpr' ce (Por e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
			        (t2,v2) <- evalExpr' ce e2 g
			        if (t1 == TNumeric && t2 == TNumeric) then funcNumeric (\x y -> x*y) v1 v2 else raise (Err "VALOR")
			        
			        
evalExpr' ce (Div e1 e2) g =  do (t1,v1) <- evalExpr' ce e1 g
			         (t2,v2) <- evalExpr' ce e2 g
			         if (t1 == TNumeric && t2 == TNumeric) then 
					if (num v2) /= 0 then funcNumeric (\x y -> x/y) v1 v2 else raise (Err "DIVISION POR CERO")
				 else raise (Err "VALOR")
			         
evalExpr' ce (Ig e1 e2) g =do a <- evalExpr' ce e1 g
			      b <- evalExpr' ce e2 g
			      return (TBoolean, boolean (a == b))

evalExpr' ce (Menor e1 e2) g =do (t1,v1) <- evalExpr' ce  e1 g
			         (t2,v2) <- evalExpr' ce e2 g
			         if (t1 == TNumeric && t2 == TNumeric) then return (TBoolean, boolean (num v1 < num v2)) else raise (Err "VALOR")



evalExpr' ce (Mayor e1 e2 ) g = do (t1,v1) <- evalExpr' ce  e1 g
			           (t2,v2) <- evalExpr' ce e2 g
			           if (t1 == TNumeric && t2 == TNumeric) then return (TBoolean, boolean (num v1 > num v2)) else raise (Err "VALOR")




evalExpr' ce (MenorIg e1 e2) g =do (t1,v1) <- evalExpr' ce  e1 g
			           (t2,v2) <- evalExpr' ce e2 g
			           if (t1 == TNumeric && t2 == TNumeric) then return (TBoolean, boolean (num v1 <= num v2)) else raise (Err "VALOR")




evalExpr' ce (MayorIg e1 e2 ) g = do (t1,v1) <- evalExpr' ce  e1 g
			             (t2,v2) <- evalExpr' ce e2 g
			             if (t1 == TNumeric && t2 == TNumeric) then return (TBoolean, boolean (num v1 >= num v2)) else raise (Err "VALOR")




evalExpr' ce (And e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
				(t2,v2) <- evalExpr' ce e2 g
				if (t1 == TBoolean && t2 == TBoolean) then funcBoolean (\x y -> x && y) v1 v2 else raise (Err "VALOR")




evalExpr' ce (Or e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
			       (t2,v2) <- evalExpr' ce e2 g
			       if (t1 == TBoolean && t2 == TBoolean)  then funcBoolean (\x y -> x || y) v1 v2 else raise (Err "VALOR")
			      
			      



evalExpr' ce (Suma []) g = return (TNumeric,nuevoValor)
evalExpr' ce (Suma (e:xs)) g= do (t1,v1) <- evalExpr' ce  e g
		                 (t,v) <- evalExpr' ce (Suma xs) g
			         if (t1 == TNumeric && t == TNumeric) then funcNumeric (\x y -> x + y) v1 v else raise (Err "VALOR")
			         



			         
evalExpr' ce (Abs e) g = do (t,v) <- evalExpr' ce e g
		            if (t == TNumeric) then funcUnNumeric (\x -> abs(x)) v  else raise (Err "VALOR")
		            


		            
evalExpr' ce  (Concat []) g = return (TString,nuevoValor)
evalExpr' ce  (Concat (e:xs)) g = do (t1,v1) <- evalExpr' ce e g
			             (t,v) <- evalExpr' ce (Concat xs) g
			             if (t1 == TString &&  t == TString) then funcString (\x y -> x ++ y) v1 v else raise (Err "VALOR")
			             


			             
evalExpr' ce (Opuesto e) g = do (t,v) <- evalExpr' ce e g
			        if (t == TNumeric) then funcUnNumeric (\x -> -1*x) v else raise (Err "VALOR")


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



