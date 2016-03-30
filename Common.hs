
module Common where

import Data.Time
-- TIPOS DE DATOS
data Error = Ok | Err String
	deriving (Show,Eq)
	
data Typ = TNumeric | TString | TDate | TBoolean | TUnit
	deriving (Eq,Show)



type Celda = (String, Int)

-- AST
data Exp = Str String
	 | Fl Float
	 | Bo Bool
	 | Date Day
	 | Eval ExpEval
	 | Unit ()
       deriving(Show,Eq)

data ExpEval  = Star --Estrella, usado para expresiones "cuantificadas" 
              | Var Celda
	      | Ran Celda Celda
	      | EStr String
	      | EFl Float
	      | EBo Bool
	      | EDate Day
	      -- Funciones de Fechas
	      | Hoy
	      | DiasEntre ExpEval ExpEval 
	      | DiaPascua ExpEval
	      -- Operaciones Matematicas
	      | Mas ExpEval ExpEval
	      | Menos ExpEval ExpEval
	      | Por ExpEval ExpEval
	      | Div ExpEval ExpEval
	      -- Comparaciones Matematicas 
	      | Ig ExpEval ExpEval
	      | Menor ExpEval ExpEval
	      | Mayor ExpEval ExpEval
	      | MenorIg ExpEval ExpEval
	      | MayorIg ExpEval ExpEval
	      -- Operaciones Logicas
	      | And ExpEval ExpEval
	      | Or ExpEval ExpEval
	      -- Sentencias
	      | Si ExpEval ExpEval ExpEval
	      | ContarSi ExpEval ExpEval
	      -- Funciones Matematicas
	      | Potencia ExpEval ExpEval
	      | Opuesto ExpEval
	      | Suma [ExpEval]
	      | Abs ExpEval
	      -- Funciones Strings
	      | Concat [ExpEval]
	deriving(Show,Eq)



eqTypes :: Typ -> Typ -> Bool
eqTypes t1 t2 = t1 == t2 || t1 == TUnit



sustituirStar :: Celda -> ExpEval -> ExpEval
sustituirStar c Star = Var c
sustituirStar c (Mas e1 e2) = Mas (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Menos e1 e2) = Menos (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Por e1 e2) = Por (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Div e1 e2) = Div (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Ig e1 e2) = Ig (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Menor e1 e2) = Menor (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Mayor e1 e2) = Mayor (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (MenorIg e1 e2) = MenorIg (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (MayorIg e1 e2) = MayorIg (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (And e1 e2) = And (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Or e1 e2) = Or (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Si e1 e2 e3) = Si (sustituirStar c e1) (sustituirStar c e2) (sustituirStar c e3)
sustituirStar c (Potencia e1 e2) = Potencia (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (ContarSi e1 e2) = ContarSi (sustituirStar c e1) (sustituirStar c e2)
sustituirStar c (Opuesto e) = Opuesto (sustituirStar c e)
sustituirStar c (Suma xs) = Suma (map (\i -> sustituirStar c i) xs)
sustituirStar c (Abs e) = Abs (sustituirStar c e)
sustituirStar c (Concat xs) = Concat (map (\i -> sustituirStar c i) xs)
sustituirStar c exp = exp


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
{- 	

Gramatica para expresiones de un lenguaje de hoja de calculo

C ::= [String,Int]

A ::= C := E

V ::= F Float
    | S String
    | B Bool
    | Cero

E ::= Valor V
    | = E1
    
E1 ::= E1 + T
     | E1 - T
     | E1 < E1
     | E1 <= E1
     | E1 > E1
     | E1 >= E1
     | E1 == E1
     | T

T ::= T * F
    | T / F
    | F

F ::= suma(E2
    | abs(E1)
    | concat(E2
    | Y(E2
    | O(E2
    | SI(E1,E1,E1)
    | NO(E1)
    | derecha(E1,E1)
    | V
    | C

E2 ::= E1,E2
     | E1)



Gramatica para expresiones de un lenguaje de hoja de calculo

C ::= [String,Int]

A ::= C := E

V ::= F Float
    | S String
    | B Bool
    
E ::= Valor V
    | = E1
    

E1 ::= T E1'
E1' ::= € 
       | + T E1'
       | - T E1'
       | < E1 E1'
       | <= E1 E1'
       | > E1 E1'
       | >= E1 E1'
       | == E1 E1'

T ::= F T'
T' ::= €
     | * F T'
     | / F T'


F ::= suma(E2
    | (E1)
    | abs(E1)
    | concat(E2
    | Y(E2
    | O(E2
    | SI(E1,E1,E1)
    | NO(E1)
    | derecha(E1,E1)
    | V 
    | C

E2 ::= E1,E2
     | E1)

-}


