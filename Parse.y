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
	| isDigit c = lexer1 (c:cs)
	| c == '-'  = lexer1 (c:cs)
	| c == '='  = TokenEval : (lexer2 cs)
	| isSpace c = lexer cs 
    	| otherwise = [TokenString (c:cs)]

lexer1 :: String -> [Token]
lexer1 [] = []
lexer1 cs = if cs!!0 /= '-' then
	    if rest == [] then [TokenFloat (read (num))] else
		if rest!!0 == '.' then 
			if rest' == [] then [TokenFloat (read (num ++ num1) / 10^(length num1))] else [TokenString cs] 
		else [TokenString cs]
	    else
	    if rest''' == [] then [TokenMenos,TokenFloat (read (num2))] else
		if rest'''!!0 == '.' then 
			if rest'''' == [] then [TokenMenos,TokenFloat (read (num2 ++ num3) / 10^(length num3))] else [TokenString cs] 
		else [TokenString cs]
		where (num,rest) = span isDigit cs
		      (num1,rest') = span isDigit (tail rest)
		      cs' = tail cs
		      (spaces,rest'') = span (\i -> i == ' ') cs'
		      (num2,rest''') = span isDigit rest''
		      (num3,rest'''') = span isDigit (tail rest''')


lexer2 :: String -> [Token]
lexer2 [] = []
lexer2 (c:cs) 
      | isSpace c = lexer2 cs
      | isAlpha c && (fromEnum c <= fromEnum 'Z' && fromEnum c >= fromEnum 'A') = lexCelda (c:cs)
      | isAlpha c = lexFunc (c:cs)
      | isDigit c = lexNum (c:cs)
      | c == '-' = TokenMenos : lexer2 cs
      | c == '.' = TokenPunto : lexer2 cs
      | c == ',' = TokenComa : lexer2 cs
      | c == '"' = TokenComilla : lexer3 cs []
      | c == '=' = if cs!!0 == '=' then TokenIg : lexer2 (tail cs) else [TokenString (c:cs)]
      | c == '+' = TokenMas : lexer2 cs
      | c == '-' = TokenMenos : lexer2 cs
      | c == '*' = TokenPor : lexer2 cs
      | c == '/' = TokenDiv : lexer2 cs
      | c == '(' = TokenParIzq : lexer2 cs
      | c == ')' = TokenParDer : lexer2 cs
      | c == '[' = TokenCorIzq : lexer2 cs
      | c == ']' = TokenCorDer : lexer2 cs
      | otherwise = [TokenString (c:cs)]


lexer3 :: String -> String -> [Token]
lexer3 [] _ = []
lexer3 ('"':cs) str = (TokenString str) : TokenComilla : lexer2 cs
lexer3 (c:cs) str = lexer3 cs (str++[c])

lexNum cs = if rest /= [] && rest!!0 == '.' then TokenFloat (read (num ++ num1) / 10^(length num1)) : lexer2 rest'  else TokenFloat (read num) : lexer2 rest
      where (num,rest) = span isDigit cs
	    (num1,rest') = span isDigit (tail rest)


lexFunc cs =
   case span isAlpha cs of
      ("suma",rest) -> TokenSUMATORIA : lexer2 rest
      ("concat",rest)  -> TokenCONCATENACION : lexer2 rest
      ("abs",rest) -> TokenABSOLUTO : lexer2 rest
      (otherstr,rest) -> (TokenString otherstr) : lexer2 rest

lexCelda :: String -> [Token]
lexCelda [] = []
lexCelda cs = (TokenCelda (map (\x -> if (fromEnum x <= fromEnum 'Z' && fromEnum x >= fromEnum 'A') then x else chr (fromEnum x + (fromEnum 'A' - fromEnum 'a')))columna,read (fila))) : lexer2 rest'
		where (columna,rest) = span (\x -> isAlpha x) cs
		      (fila,rest') = span isDigit rest 


}


















