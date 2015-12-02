module Eval where

import Common
import Data.Tree


type Entorno = [(Celda,Exp)]


celdas :: Exp -> [Celda]
celdas (Str s) = []
celdas (Fl f) =  []
celdas (Eval e) = celdasE e

celdasE :: ExpEval -> [Celda]
celdasE (Var c) = [c]
celdasE (EStr s) = []
celdasE (EFl f) = []
celdasE (Mas e1 e2) = celdasE e1 ++ celdasE e2
celdasE (Menos e1 e2) = celdasE e1 ++ celdasE e2
celdasE (Por e1 e2) = celdasE e1 ++ celdasE e2
celdasE (Div e1 e2) = celdasE e1 ++ celdasE e2
celdasE (Ig e1 e2) = celdasE e1 ++ celdasE e2
celdasE (Suma []) = []
celdasE (Suma (x:xs)) = celdasE x ++ celdasE (Suma xs)
celdasE (Abs e) = celdasE e
celdasE (Concat []) = []
celdasE (Concat (x:xs)) = celdasE x ++ celdasE (Concat xs)

newtype State a = State {runState :: Entorno {- Forest Celda -} -> Maybe ((a,Entorno){-,Forest Celda-})}

instance Monad State where
	return x =  State (\e{- fo -}-> Just ((x,e){-,fo-}))
	m >>= f = State (\e {- fo -} -> case runState m e {-fo -}of
					Nothing ->  Nothing
					Just ((v,e'){-,fo'-}) -> runState (f v) e' {- fo' -})



class Monad m => MonadState m where
	lookfor :: Celda -> m Exp
--	update :: Celda -> Exp -> m ()

instance MonadState State where
	lookfor c = State (\e {- fo -}-> case e of
				[] -> Nothing
				xs -> Just (((lookfor' c xs),xs){-,fo -}))
			    where lookfor' c ((c',exp):xs) = if c == c' then exp else lookfor' c xs
{-
	update c ex = State (\e {-fo-} -> Just (((),update' c ex e){-,fo -}))
			    where
				  update' ce exp [] = [(ce,exp)]
				  update' ce exp ((ce',exp'):xs) = if ce == ce' then ((ce',exp):xs) else (ce',exp'):(update' ce exp xs)
-}

update' :: Celda -> Exp -> Entorno -> Entorno
update' ce exp [] = [(ce,exp)]
update' ce exp ((ce',exp'):xs) = if ce == ce' then ((ce',exp):xs) else (ce',exp'):(update' ce exp xs)


initEnt :: Entorno
initEnt = []



eval :: Exp -> Entorno -> (Float,String)
eval e env = case runState (evalExpr e) env of
	  	  Nothing -> (0,"")
		  Just (x,xs) -> x



evalExpr :: (MonadState m) => Exp -> m (Float,String)
evalExpr (Str s) = return (0,s)
evalExpr (Fl f) = return (f,"")
evalExpr (Eval e) = evalExpr' e

evalExpr' :: (MonadState m) => ExpEval -> m (Float,String)
evalExpr' (Var c) =  do e <- lookfor c
			r <- evalExpr e
			return r
evalExpr' (EStr s) = return (0,s)
evalExpr' (EFl f) = return (f,"")
evalExpr' (Mas e1 e2) = do (f1,s1) <- evalExpr' e1
			   (f2,s2) <- evalExpr' e2
			   return (f1+f2,"")
evalExpr' (Menos e1 e2) = do (f1,s1) <- evalExpr' e1
			     (f2,s2) <- evalExpr' e2
			     return (f1-f2,"")
evalExpr' (Por e1 e2) = do (f1,s1) <- evalExpr' e1
			   (f2,s2) <- evalExpr' e2
			   return (f1*f2,"")
evalExpr' (Div e1 e2) =  do (f1,s1) <- evalExpr' e1
			    (f2,s2) <- evalExpr' e2
			    if f2 == 0 then error ("div cero!") else return (f1 / f2,"")
evalExpr' (Ig e1 e2) =do a <- evalExpr' e1
			 b <- evalExpr' e2
			 if a == b then return (1,"") else return (0,"")
evalExpr' (Suma []) = return (0,"")
evalExpr' (Suma (e:xs)) = do (f1,s1) <- evalExpr' e
		             (f,s) <- evalExpr' (Suma xs)
			     return (f1+f,"")
evalExpr' (Abs e) = do (f,s) <- evalExpr' e
		       return (abs(f),"")
evalExpr' (Concat []) = return (0,"")
evalExpr' (Concat (e:xs)) = do (f1,s1) <- evalExpr' e
			       (f,s) <- evalExpr' (Concat xs)
			       return (0,s1 ++ s)
evalExpr' (Opuesto e) = do (f,s) <- evalExpr' e
			   return (-1*f,"")


					


 




						
			     -- Hay que tratar de no hacer calculos innecesarios
			     -- Arbol de dependencias
			     -- backend



