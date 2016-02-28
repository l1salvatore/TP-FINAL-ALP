module ModValor where

import Common

data Valor = Val { 
		   num :: Float,
		   str :: String,
		   boo :: Maybe Bool,
		   err :: Error
		 }
	deriving (Show,Eq)

nuevoValor :: Valor
nuevoValor = Val { num = 0,
		   str = "",
		   boo = Nothing,
		   err = Ok
		 }


funcString :: (String -> String -> String) -> Valor -> Valor -> IO (Typ,Valor)
funcString f v1 v2 = if ((err v1) == Ok && (err v2) == Ok) then return (TString,string (f (str v1) (str v2))) else
		     if (err v1 /= Ok) then raise (err v1) else raise (err v2)

funcUnString :: (String -> String) -> Valor -> IO (Typ,Valor)
funcUnString f v = if (err v == Ok) then return (TString,string (f (str v))) else raise (err v)

string :: String -> Valor
string s = Val {    num = 0,
		    str = s,
		    boo = Nothing,
		    err = Ok
		     }

funcNumeric :: (Float -> Float -> Float) -> Valor -> Valor -> IO (Typ,Valor)
funcNumeric f v1 v2 = if (err v1 == Ok && err v2 == Ok) then return (TNumeric,numeric (f (num v1) (num v2))) else
		      if (err v1 /= Ok) then raise (err v1) else raise (err v2)

funcUnNumeric :: (Float -> Float) -> Valor -> IO (Typ,Valor)
funcUnNumeric f v = if (err v == Ok) then return (TNumeric,numeric (f (num v))) else raise (err v)

numeric :: Float -> Valor
numeric n = Val { num = n,
		  str = "",
		  boo = Nothing,
		  err = Ok
		     }

funcBoolean :: (Bool -> Bool -> Bool) -> Valor -> Valor -> IO (Typ,Valor)
funcBoolean f v1 v2 = if (err v1 == Ok && err v2 == Ok) then case (boo v1) of 
							Nothing -> case (boo v2) of
								Nothing -> return (TBoolean,boolean True)
							        Just b2 -> return (TBoolean,boolean b2)
							Just b1 -> case (boo v2) of
								Nothing -> return (TBoolean,boolean b1)
								Just b2 -> return (TBoolean,boolean (f b1 b2)) 
		      else if (err v1 /= Ok) then raise (err v1) else raise (err v2)

boolean :: Bool -> Valor
boolean b = Val { num = 0,
		  str = "",
		  boo = Just b,
		  err = Ok
		}

raise :: Error -> IO (Typ,Valor)
raise e = return (TUnit, Val { num = 0, str = "", boo = Nothing, err = e})


{-
oper :: (Valor -> Valor -> Valor) -> Typ -> Valor -> Valor -> Valor
oper f t v1 v2 = if err v1 == err v2 == Ok then oper' f t v1 v2 else if err v1 /= Ok then v1 else if err v2 /= then v2

oper' :: (a -> a -> a) -> Typ -> a -> a -> Valor
oper' f Numeric x y =  Val { num = f (num v1) (num v2)
-}
{-
modifStrVal :: Valor -> String -> Valor
modifStrVal v s = Val { num = num v,
			str = s,
			boo = boo v
		      }

modifNumVal :: Valor -> Float -> Valor
modifNumVal v n = Val { num = n,
			str = str v,
			boo = boo v
		      }

modifBooVal :: Valor -> Maybe Bool -> Valor
modifBooVal v b = Val { num = num v,
			str = str v,
			boo = b
		      }
-}
