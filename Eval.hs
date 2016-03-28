module Eval where

import Common
import DepTree
import qualified Data.Set as S
import Parse
import ModValor
import Data.Char
import Data.Time
import System.IO.Error

 {-

armarLista :: Celda -> Celda -> Graph -> IO [ExpEval]
armarLista (c1,n1) (c2,n2) g = if c1 == c2 then if n1 == n2 then do return [Var (c2,n2)] 
					                    else if n1 > n2 then return [] 
									    else do explist <- armarLista (c1,n1+1) (c2,n2) g
										    return (Var (c2,n1) : explist)
					   else if (fromEnum (c1!!0)) > (fromEnum (c2!!0)) then return []
						else do explist1 <- armarLista (c1,n1) (c1,n2) g
							explist2 <- armarLista ([chr (fromEnum (c1!!0)+1)],n1) (c2,n2) g
							return (explist1 ++ explist2)



-}

{-


contarSi :: Celda -> ExpEval -> [ExpEval] -> Graph -> IO (Typ,Valor)
contarSi ce e1 [] g = return (TNumeric,numeric 0)
contarSi ce e1 ((Var c):xs) g = do (t1,v1) <- evalExpr' ce (sustituirStar c e1) g
                                   (t,n) <- contarSi ce e1 xs g
                                   if eqTypes t1 TBoolean then 
                                      if err v1 == Ok then 
                                          if boo v1 then funcUnNumeric (\x -> 1 + x) n 
                                          else funcUnNumeric (\x -> x) n
                                      else raise (err v1)                            
                                   else raise (Err "VALOR")


-}




	









expr :: String -> IO Exp
expr "" = return (Unit ())
expr s =  parseExpr (lexer s)



evalCelda :: Celda -> Graph -> IO ()
evalCelda c g =  do i <- infocelda c g
	 	    elimNeightBours g i
		    (do newExpr <- expr (strexpr i)
		        (t,v) <- evalExpr c newExpr g
		        updateCell c t (strexpr i) v g)
		      `catchIOError` (\e -> do {(t,v) <- raise (Err "PARSE ERROR"); updateCell c t (strexpr i) v g})





evalExpr :: Celda -> Exp -> Graph -> IO (Typ,Valor)
evalExpr ce (Str s) g = returnStr s
evalExpr ce (Fl f) g = returnNum f
evalExpr ce (Bo b) g = returnBool b
evalExpr ce (Date d) g = returnDay d
evalExpr ce (Unit ()) g = newVal
evalExpr ce (Eval e) g = evalExpr' ce e g





evalExpr' :: Celda -> ExpEval -> Graph -> IO (Typ,Valor)
evalExpr' ce (Var c) g =  do i <- infocelda c g
			     i' <- infocelda ce g 
			     b <- existsRoad ce c g
			     if b then do ginsertEdge i i' g
					  raise (Err "CICLO DETECTADO") 
				  else do ginsertEdge i i' g 
					  e <- expr (strexpr i) 
					  r <- evalExpr c e g
					  return r
-----------------------------------------------
evalExpr' ce (Ran c1 c2) g = raise (Err "VALOR")
-----------------------------------------------			     
evalExpr' ce (EStr s) g = returnStr s

-----------------------------------------------
evalExpr' ce (EFl f) g = returnNum f
-----------------------------------------------
evalExpr' ce (EBo b) g = returnBool b
-----------------------------------------------
evalExpr' ce (EDate d) g = returnDay d
-----------------------------------------------
evalExpr' ce (Mas e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
			        (t2,v2) <- evalExpr' ce e2 g
			        if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			                then funcNumeric (\x y -> x + y) v1 v2 
			                else raise (Err "VALOR")
-----------------------------------------------			        
evalExpr' ce (Menos e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
		 	          (t2,v2) <- evalExpr' ce e2 g
			          if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			                then funcNumeric (\x y -> x - y) v1 v2 
			                else raise (Err "VALOR")			          
-----------------------------------------------			          
evalExpr' ce (Por e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
			        (t2,v2) <- evalExpr' ce e2 g
			        if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			                  then funcNumeric (\x y -> x*y) v1 v2 
			                  else raise (Err "VALOR")
			        
-----------------------------------------------			        
evalExpr' ce (Div e1 e2) g =  do (t1,v1) <- evalExpr' ce e1 g
			         (t2,v2) <- evalExpr' ce e2 g
			         if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			            then if (num v2) /= 0 
			                        then funcNumeric (\x y -> x/y) v1 v2 
			                        else raise (Err "DIVISION POR CERO")
				    else raise (Err "VALOR")
			         
-----------------------------------------------

evalExpr' ce (Ig e1 e2) g =do a <- evalExpr' ce e1 g
			      b <- evalExpr' ce e2 g
			      return (TBoolean, boolean (a == b))
-----------------------------------------------
evalExpr' ce (Menor e1 e2) g =do (t1,v1) <- evalExpr' ce  e1 g
			         (t2,v2) <- evalExpr' ce e2 g
			         if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			                   then return (TBoolean, boolean (num v1 < num v2)) 
			                   else raise (Err "VALOR")
-----------------------------------------------


evalExpr' ce (Mayor e1 e2 ) g = do (t1,v1) <- evalExpr' ce  e1 g
			           (t2,v2) <- evalExpr' ce e2 g
			           if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			                  then return (TBoolean, boolean (num v1 > num v2)) 
			                  else raise (Err "VALOR")

-----------------------------------------------


evalExpr' ce (MenorIg e1 e2) g =do (t1,v1) <- evalExpr' ce  e1 g
			           (t2,v2) <- evalExpr' ce e2 g
			           if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			                     then return (TBoolean, boolean (num v1 <= num v2)) 
			                     else raise (Err "VALOR")


-----------------------------------------------

evalExpr' ce (MayorIg e1 e2 ) g = do (t1,v1) <- evalExpr' ce  e1 g
			             (t2,v2) <- evalExpr' ce e2 g
			             if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
			                    then return (TBoolean, boolean (num v1 >= num v2)) 
			                    else raise (Err "VALOR")

-----------------------------------------------


evalExpr' ce (And e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
				(t2,v2) <- evalExpr' ce e2 g
				if (eqTypes t1 TBoolean && eqTypes t2 TBoolean) 
				     then funcBoolean (\x y -> x && y) v1 v2 
				     else raise (Err "VALOR")


-----------------------------------------------

evalExpr' ce (Or e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
			       (t2,v2) <- evalExpr' ce e2 g
			       if (eqTypes t1 TBoolean && eqTypes t2 TBoolean)  
			               then funcBoolean (\x y -> x || y) v1 v2 
			               else raise (Err "VALOR")
			      
			      
-----------------------------------------------


evalExpr' ce (Suma []) g = return (TNumeric,nuevoValor)
evalExpr' ce (Suma [Ran c1 c2]) g = do cellList <- armarLista c1 c2 g
				       evalExpr' ce (Suma cellList) g
evalExpr' ce (Suma (e:xs)) g= do (t1,v1) <- evalExpr' ce  e g
		                 (t,v) <- evalExpr' ce (Suma xs) g
			         if (eqTypes t1 TNumeric && eqTypes t TNumeric) 
			                then funcNumeric (\x y -> x + y) v1 v 
			                else raise (Err "VALOR")
			         

-----------------------------------------------

			         
evalExpr' ce (Abs e) g = do (t,v) <- evalExpr' ce e g
		            if (eqTypes t TNumeric) 
		                  then funcUnNumeric (\x -> abs(x)) v  
		                  else raise (Err "VALOR")
		            

-----------------------------------------------
		            
evalExpr' ce  (Concat []) g = return (TString,nuevoValor)
evalExpr' ce  (Concat [Ran c1 c2]) g = do cellList <- armarLista c1 c2 g
					  evalExpr' ce (Concat cellList) g
evalExpr' ce  (Concat (e:xs)) g = do (t1,v1) <- evalExpr' ce e g
			             (t,v) <- evalExpr' ce (Concat xs) g
			             if (eqTypes t1 TString && eqTypes t TString) 
			                   then funcString (\x y -> x ++ y) v1 v 
			                   else raise (Err "VALOR")
			             
-----------------------------------------------

			             
evalExpr' ce (Opuesto e) g = do (t,v) <- evalExpr' ce e g
			        if (eqTypes t TNumeric) 
			           then funcUnNumeric (\x -> -1*x) v 
			           else raise (Err "VALOR")
-----------------------------------------------

evalExpr' ce (Si e1 e2 e3) g = do (t1,v) <- evalExpr' ce e1 g
				  tv1 <- evalExpr' ce e2 g
				  tv2 <- evalExpr' ce e3 g
				  if (eqTypes t1 TBoolean) then 
					   if err v == Ok then 
						if boo v then
						    return tv1
						else 
						    return tv2 
					   else raise (err v)
				  else raise (Err "VALOR") 

-----------------------------------------------
evalExpr' ce (Potencia e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
				     (t2,v2) <- evalExpr' ce e2 g
				     if (eqTypes t1 TNumeric && eqTypes t2 TNumeric) 
				         then funcNumeric (\x y -> x**y) v1 v2 
				         else raise (Err "VALOR")

-----------------------------------------------

evalExpr' ce (ContarSi e1 (Ran c1 c2)) g = do cellList <- armarLista c1 c2 g
                                              contarSi ce e1 cellList g
evalExpr' ce (ContarSi e1 (Var c)) g = evalExpr' ce (Si (sustituirStar c e1) (EFl 1) (EFl 0)) g
evalExpr' ce (ContarSi e1 e2) g = raise (Err "VALOR")

-----------------------------------------------

evalExpr' ce Hoy g = do t <- getCurrentTime
			return (TDate, date (utctDay t))


evalExpr' ce (DiasEntre e1 e2) g = do (t1,v1) <- evalExpr' ce e1 g
				      (t2,v2) <- evalExpr' ce e2 g
				      if (eqTypes t1 TDate && eqTypes t2 TDate)
					 then if (err v1 == Ok ) then if (err v2 == Ok) then diasEntre (dat v1) (dat v2)
										        else raise (err v2)
							         else raise (err v1)
					 else raise (Err "VALOR")
					 
evalExpr' ce (DiaPascua e1) g = do (t,v) <- evalExpr' ce e1 g
				   if (eqTypes t TNumeric) then
				   		
				  	funcUnDate (\_ -> let year = floor (num v)
				   			      a = mod year 19
				   			      b = div year 100
				   			      c = mod year 100
				   			      d = div b 4
				   			      e = mod b 4
				   			      f = div (b+8) 25
				   			      g' = div (b-f+1) 3
				   			      h = mod (19*a+b-d-g'+15) 30
				   			      i = div c 4
				   			      k = mod c 4
				   			      l = mod (32+2*e+2*i-h-k) 7
				   			      m = div (a + 11*h + 22*l) 451
				   			      n = h + l - 7*m+114
				   			      month = div n 31
				   			      day = 1 + (n - (month*31))
				   		          in fromGregorian (fromIntegral year) month day) nuevoValor
				   		    
				   else raise (Err "Valor")


lengthYear :: Integer -> Int
lengthYear y = if isLeapYear y then 366 else 365 

diasEntre :: Day -> Day -> IO (Typ,Valor)
diasEntre x y = let (y1,m1,d1) = toGregorian x
		    (y2,m2,d2) = toGregorian y in
		               if y1 == y2 then if m1 == m2 then funcUnNumeric (\_ -> fromIntegral (d2 - d1)) nuevoValor
							    else funcUnNumeric (\_ -> fromIntegral(
										      d2 + -- dias anteriores del dia en el mes m2
										      foldl (\a b -> gregorianMonthLength y2 b + a) 0 [m1+1..m2-1] + -- dias de los meses posteriores a m1 y anteriores a m2
										      (gregorianMonthLength y1 m1 - d1) -- dias posteriores del dia en el mes m1
										      )) nuevoValor
					   else funcUnNumeric (\_ -> fromIntegral (
                                                                     d2 + -- dias anteriores del dia en el mes m2
								     foldl (\a b -> gregorianMonthLength y2 b + a) 0 [1..m2-1] + -- dias de Enero hasta dias del mes anterior
								     foldl (\a b -> lengthYear b + a) 0 [y1+1..y2-1] + -- todos los dias de los años entre y1 e y2
								     foldl (\a b -> gregorianMonthLength y1 b + a) 0 [m1+1..12] + -- dias desde el mes actual hasta Diciembre
								     (gregorianMonthLength y1 m1 - d1) -- dias posteriores del dia en el mes m1
								     )) nuevoValor

                                              
 
 
-}



						
			     -- Hay que tratar de no hacer calculos innecesarios
			     -- Arbol de dependencias
			     -- backend



