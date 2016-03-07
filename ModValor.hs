module ModValor where

import Common
import Data.Time

data Valor = Val { 
		   num :: Float,
		   str :: String,
		   dat :: Day,
		   boo :: Bool,
		   err :: Error
		 }
	deriving (Show,Eq)

nuevoValor :: Valor
nuevoValor = Val { num = 0,
		   str = "",
		   dat = fromGregorian 0 0 0,
		   boo = True,
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
		    dat = fromGregorian 0 0 0,
		    boo = True,
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
	          dat = fromGregorian 0 0 0,
		  boo = True,
		  err = Ok
		     }

funcBoolean :: (Bool -> Bool -> Bool) -> Valor -> Valor -> IO (Typ,Valor)
funcBoolean f v1 v2 = if (err v1 == Ok && err v2 == Ok) then return (TBoolean,boolean (f (boo v1) (boo v2))) else 
		      if (err v1 /= Ok) then raise (err v1) else raise (err v2)

funcUnBoolean :: (Bool -> Bool) -> Valor -> IO (Typ,Valor)
funcUnBoolean f v = if (err v == Ok) then return (TBoolean,boolean (f (boo v))) else raise (err v)

boolean :: Bool -> Valor
boolean b = Val { num = 0,
		  str = "",
		  dat = fromGregorian 0 0 0,
		  boo = b,
		  err = Ok
		}



funcDate :: (Day -> Day -> Day) -> Valor -> Valor -> IO (Typ,Valor)
funcDate f v1 v2 = if (err v1 == Ok && err v2 == Ok) then return (TDate,date (f (dat v1) (dat v2))) else 
		   if (err v1 /= Ok) then raise (err v1) else raise (err v2)

funcUnDate :: (Day -> Day) -> Valor -> IO (Typ,Valor)
funcUnDate f v = if (err v == Ok) then return (TDate,date (f (dat v))) else raise (err v)

date :: Day -> Valor
date d = Val { num = 0,
	       str = "",
	       dat = d,
	       boo = True,
	       err = Ok
		}

raise :: Error -> IO (Typ,Valor)
raise e = return (TUnit, Val { num = 0, str = "", dat = fromGregorian 0 0 0, boo = True, err = e})


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
