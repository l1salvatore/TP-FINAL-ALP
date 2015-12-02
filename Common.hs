
module Common where


type Celda = (String, Int)

natural :: Int -> Bool
natural x = x >= 0


data Type = TString
	 |  TFloat
	 |  TUnit
	deriving(Show,Eq)


data Exp = Str String
	 | Fl Float
	 | Eval ExpEval
       deriving(Show,Eq)

data ExpEval  = Var Celda
	      | EStr String
	      | EFl Float
	      | Mas ExpEval ExpEval
	      | Menos ExpEval ExpEval
	      | Por ExpEval ExpEval
	      | Div ExpEval ExpEval 
	      | Ig ExpEval ExpEval
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

