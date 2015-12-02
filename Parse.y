{

module Parse where
import Data.Char
import Common
import Eval
import System.Console.Readline
}

%name parseExpr
%tokentype { Token }
%error { parseError }

%token
	int	 { TokenInt $$ }
	string	 { TokenString $$ }
	float	 { TokenFloat $$ }
	celda    { TokenCelda $$ }
	'.'	 { TokenPunto }
	','	 { TokenComa }
	'='	 { TokenEval }
	'"'	 { TokenComilla }
	'=='     { TokenIg  }
	'+'	 { TokenMas }
	'-'	 { TokenMenos }
	'*'	 { TokenPor }
	'/'	 { TokenDiv }
	'(' 	 { TokenParIzq }
	')'	 { TokenParDer }
	'['	 { TokenCorIzq }
	']'	 { TokenCorDer }
	suma	 { TokenSUMATORIA }
	concat   { TokenCONCATENACION }
	absoluto { TokenABSOLUTO }
%%

Exp : string				 { Str $1}
    | float				     { Fl $1 }
    | '-' float				 { Fl (-1*$2) }
    | '=' ExpEval		 	 { Eval $2 }

ExpEval : ExpEval '==' ExpEvalT	 	 { Ig $1 $3}
	| ExpEval '+' ExpEvalT 		 { Mas $1 $3 }
	| ExpEval '-' ExpEvalT		 { Menos $1 $3 } 
	| ExpEvalT			 { $1 }

ExpEvalT : ExpEvalT '*' ExpEvalF	 { Por $1 $3 }
	 | ExpEvalT '/' ExpEvalF	 { Div $1 $3 }
	 | ExpEvalF			 { $1 }

ExpEvalF : float			 { EFl $1 }
	 | celda   	 		 { Var $1 }
	 | '"' string '"'	 	 { EStr $2 }
	 | '(' ExpEval ')'		 { $2 }
	 | suma '(' ExpList		 { Suma $3 }
	 | concat '(' ExpList		 { Concat $3 }
	 | absoluto '(' ExpEval ')'	 { Abs $3 }
	 | '-' ExpEvalF			 { Opuesto $2 }
	 
ExpList : ExpEval ')'			 { [$1] }
	| ExpEval ',' ExpList		 { $1:$3 } 
{



parseError :: [Token] -> a
parseError _ = error "Parse error"


data Token = TokenInt Int
	   | TokenString String
	   | TokenFloat Float
	   | TokenCelda (String,Int)
	   | TokenPunto
	   | TokenComa
	   | TokenEval 
	   | TokenComilla 
	   | TokenIg  
	   | TokenMas 
	   | TokenMenos 
	   | TokenPor 
	   | TokenDiv 
	   | TokenParIzq 
	   | TokenParDer 
	   | TokenCorIzq
	   | TokenCorDer 
	   | TokenSUMATORIA 
	   | TokenCONCATENACION 
	   | TokenABSOLUTO 
	deriving(Show)


lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) 
	| isDigit c = lexer_ (c:cs)
	| c == '-'  = TokenMenos : (lexer1 cs)
	| c == '='  = TokenEval : (lexer1 cs)
	| isSpace c = lexer cs 
    	| otherwise = [TokenString (c:cs)]

lexer_ :: String -> [Token]
lexer_ [] = []
lexer_ cs = if rest == [] then [TokenFloat (read (num))] else
		if rest!!0 == '.' then 
			if rest' == [] then [TokenFloat (read (num ++ num1) / 10^(length num1))] else [TokenString cs] 
		else [TokenString cs]
		where (num,rest) = span isDigit cs
		      (num1,rest') = span isDigit (tail rest)


lexer1 :: String -> [Token]
lexer1 [] = []
lexer1 (c:cs) 
      | isSpace c = lexer1 cs
      | isAlpha c && (fromEnum c <= fromEnum 'Z' && fromEnum c >= fromEnum 'A') = lexCelda (c:cs)
      | isAlpha c = lexFunc (c:cs)
      | isDigit c = lexNum (c:cs)
      | c == '-' = TokenMenos : lexer1 cs
      | c == '.' = TokenPunto : lexer1 cs
      | c == ',' = TokenComa : lexer1 cs
      | c == '"' = TokenComilla : lexer__ cs []
      | c == '=' = if cs!!0 == '=' then TokenIg : lexer1 (tail cs) else [TokenString (c:cs)]
      | c == '+' = TokenMas : lexer1 cs
      | c == '-' = TokenMenos : lexer1 cs
      | c == '*' = TokenPor : lexer1 cs
      | c == '/' = TokenDiv : lexer1 cs
      | c == '(' = TokenParIzq : lexer1 cs
      | c == ')' = TokenParDer : lexer1 cs
      | c == '[' = TokenCorIzq : lexer1 cs
      | c == ']' = TokenCorDer : lexer1 cs
      | otherwise = [TokenString (c:cs)]


lexer__ :: String -> String -> [Token]
lexer__ [] _ = []
lexer__ ('"':cs) str = (TokenString str) : TokenComilla : lexer1 cs
lexer__ (c:cs) str = lexer__ cs (str++[c])

lexNum cs = if rest /= [] && rest!!0 == '.' then TokenFloat (read (num ++ num1) / 10^(length num1)) : lexer1 rest'  else TokenFloat (read num) : lexer1 rest
      where (num,rest) = span isDigit cs
	    (num1,rest') = span isDigit (tail rest)

-- 23.42

lexFunc cs =
   case span isAlpha cs of
      ("suma",rest) -> TokenSUMATORIA : lexer1 rest
      ("concat",rest)  -> TokenCONCATENACION : lexer1 rest
      ("abs",rest) -> TokenABSOLUTO : lexer1 rest
      (otherstr,rest) -> (TokenString otherstr) : lexer1 rest

lexCelda :: String -> [Token]
lexCelda [] = []
lexCelda cs = (TokenCelda (columna,read (fila))) : lexer1 rest'
		where (columna,rest) = span (\x -> isAlpha x && (fromEnum x <= fromEnum 'Z' && fromEnum x >= fromEnum 'A')) cs
		      (fila,rest') = span isDigit rest 


}


















