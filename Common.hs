
module Common where


-- TIPOS DE DATOS
data Error = Ok | Err String
	deriving (Show,Eq)
	
data Typ = TNumeric | TString | TBoolean | TUnit
	deriving (Eq,Show)

eqTypes :: Typ -> Typ -> Bool
eqTypes t1 t2 = t1 == t2 || t1 == TUnit

type Celda = (String, Int)

-- AST
data Exp = Str String
	 | Fl Float
	 | Bo Bool
	 | Eval ExpEval
	 | Unit ()
       deriving(Show,Eq)

data ExpEval  = Var Celda
	      | Ran Celda Celda
	      | EStr String
	      | EFl Float
	      | EBo Bool
	      | Mas ExpEval ExpEval
	      | Menos ExpEval ExpEval
	      | Por ExpEval ExpEval
	      | Div ExpEval ExpEval 
	      | Ig ExpEval ExpEval
	      | Menor ExpEval ExpEval
	      | Mayor ExpEval ExpEval
	      | MenorIg ExpEval ExpEval
	      | MayorIg ExpEval ExpEval
	      | And ExpEval ExpEval
	      | Or ExpEval ExpEval
	      | Si ExpEval ExpEval ExpEval
	      | Potencia ExpEval ExpEval
	      | Opuesto ExpEval
	      | Suma [ExpEval]
	      | Abs ExpEval
	      | Concat [ExpEval]
	deriving(Show,Eq)
{-


FloatExp 2.3
StringExp "hola mundo"
Var ("A",2)
Suma (FloatExp 2.0) (FloatExp 3.5)


Gramatica
Exp -> Float
       String
       Celda
       Exp + Exp
       Exp - Exp
       Exp * Exp
       Exp / Exp
       SUM (Exp;Exp;Exp;Exp...)
       ABS (EXP)
       CONCAT(Exp;Exp;Exp;Exp...)


















-}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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


