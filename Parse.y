{

module Parse where
import Data.Char
import Common
--import Eval
import System.Console.Readline
import Control.Monad.Except

}

%name parseExpr
%tokentype { Token }
%error { parseError }
%monad { IO } { (>>=) } { return }

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
	'<'      { TokenMenor }
	'>'      { TokenMayor }
	'<='     { TokenMenorIg }
	'>='     { TokenMayorIg }
	'&'	 { TokenAnd }
	'|'	 { TokenOr }
	'+'	 { TokenMas }
	'-'	 { TokenMenos }
	'*'	 { TokenPor }
	'/'	 { TokenDiv }
	'(' 	 { TokenParIzq }
	')'	 { TokenParDer }
	'['	 { TokenCorIzq }
	']'	 { TokenCorDer }
	suma	 { TokenSUMATORIA }
	si	 { TokenSI }
	concat   { TokenCONCATENACION }
	absoluto { TokenABSOLUTO }
	true 	 { TokenTRUE }
	false	 { TokenFALSE }
%%

Exp : string				 { Str $1}
    | float				     { Fl $1 }
    | true				 { Bo True }
    | false				 { Bo False }
    | '-' float				 { Fl (-1*$2) }
    | '=' ExpEval		 	 { Eval $2 }

ExpEval : ExpEval '==' ExpEvalT	 	 { Ig $1 $3}
	| ExpEval '<' ExpEvalT		 { Menor $1 $3}
	| ExpEval '>' ExpEvalT		 { Mayor $1 $3}
	| ExpEval '<=' ExpEvalT		 { MenorIg $1 $3 }
	| ExpEval '>=' ExpEvalT		 { MayorIg $1 $3 }
	| ExpEval '&' ExpEvalT		 { And $1 $3 }
	| ExpEval '|' ExpEvalT		 { Or $1 $3 }
	| ExpEval '+' ExpEvalT 		 { Mas $1 $3 }
	| ExpEval '-' ExpEvalT		 { Menos $1 $3 } 
	| ExpEvalT			 { $1 }

ExpEvalT : ExpEvalT '*' ExpEvalF	 { Por $1 $3 }
	 | ExpEvalT '/' ExpEvalF	 { Div $1 $3 }
	 | ExpEvalF			 { $1 }

ExpEvalF : float			 { EFl $1 }
	 | celda   	 		 { Var $1 }
	 | true				 { EBo True }
	 | '"' string '"'	 	 { EStr $2 }
	 | false			 { EBo False }
	 | '(' ExpEval ')'		 { $2 }
	 | suma '(' ExpList		 { Suma $3 }
	 | concat '(' ExpList		 { Concat $3 }
	 | absoluto '(' ExpEval ')'	 { Abs $3 }
	 | si '(' ExpEval ',' ExpEval ',' ExpEval ')' { Si $3 $5 $7 }
	 | '-' ExpEvalF			 { Opuesto $2 }
	 
ExpList : ExpEval ')'			 { [$1] }
	| ExpEval ',' ExpList		 { $1:$3 } 
{



parseError :: [Token] -> IO a
parseError _ = ioError (error "Parse error")




data Token = TokenInt Int
	   | TokenString String
	   | TokenFloat Float
	   | TokenCelda (String,Int)
	   | TokenPunto
	   | TokenComa
	   | TokenEval 
	   | TokenComilla 
	   | TokenIg  
	   | TokenMenor
	   | TokenMayor
	   | TokenMenorIg
	   | TokenMayorIg
	   | TokenAnd
	   | TokenOr
	   | TokenSI
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
	   | TokenTRUE
	   | TokenFALSE
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
      | c == '<' = if cs!!0 == '=' then TokenMenorIg : lexer2 (tail cs) else TokenMenor : lexer2 cs
      | c == '>' = if cs!!0 == '=' then TokenMayorIg : lexer2 (tail cs) else TokenMayor : lexer2 cs
      | c == '&' = TokenAnd : lexer2 cs
      | c == '|' = TokenOr : lexer2 cs
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
      ("si",rest) -> TokenSI : lexer2 rest
      ("concat",rest)  -> TokenCONCATENACION : lexer2 rest
      ("abs",rest) -> TokenABSOLUTO : lexer2 rest
      ("true",rest) -> TokenTRUE : lexer2 rest
      ("false",rest) -> TokenFALSE : lexer2 rest
      (otherstr,rest) -> (TokenString otherstr) : lexer2 rest

lexCelda :: String -> [Token]
lexCelda [] = []
lexCelda cs = t3 : lexer2 rest'
		where (columna,rest) = span (\x -> isAlpha x) cs
		      t1 	  = map (\x -> if (fromEnum x <= fromEnum 'Z' && fromEnum x >= fromEnum 'A') then x else chr (fromEnum x + (fromEnum 'A' - fromEnum 'a'))) columna
		      (fila,rest') = if rest == [] then ("",[]) else span isDigit rest 
		      t2	 = if fila /= "" then read (fila) else -555
		      t3 	 = if t2 /= -555 then TokenCelda (t1,t2) else TokenString (t1++"-555")
		       

}


















