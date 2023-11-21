// Specification JFlex
import java_cup.runtime.Symbol;
%%
%unicode
%cup
%line
%column

%{
	public int getYyLine(){
		return yyline+1;
	}
%}


print = PRINT
op_plus = [+]
op_fois = [*]
par_ouv = [(] 
par_ferm = [)] 
virgule = ","
affect = "="
nombre = [0-9]+
sep = "}"|"{"|"]"|"["
ident = [a-zA-Z_][a-zA-Z0-9_]*
tableau = @[a-zA-Z_][a-zA-Z0-9_]*
concat = "^"


%%

{print}			    { return new Symbol(sym.PRINT, new String(yytext())); }
{concat}			{ return new Symbol(sym.CONCAT, new String(yytext())); }
{virgule}           { return new Symbol(sym.VIRG, new String(yytext())); }
{affect}            { return new Symbol(sym.AFFECT, new String(yytext())); }
{sep}               { return new Symbol(sym.SEP, new String(yytext()));}
{op_plus}           { return new Symbol(sym.OP_PLUS, new String(yytext()));}
{op_fois}           { return new Symbol(sym.OP_FOIS, new String(yytext()));}
{par_ouv}           { return new Symbol(sym.PAR_OUV, new String(yytext()));}
{par_ferm}          { return new Symbol(sym.PAR_FERM, new String(yytext()));}
{nombre}            { return new Symbol(sym.ENTIER, new Integer(yytext()));}
{ident}             { return new Symbol(sym.IDENT, new String(yytext()));}
{tableau}           { return new Symbol(sym.TABLEAU, new String(yytext()));}
<<EOF>>             { System.out.println(""); return null; }
\n                  {return new Symbol(sym.ANTI_SLASH, new String(yytext()));}
[ \t]+              {  }


// Single-line comment
"//".* 				         {/* ignore */}

// Multi-line comment
"/*"([^*]|"*"+[^*/])*"*"+"/" { /* ignore */ }


.                            { System.out.println("erreur lexicale : " + yytext() + "non reconnu ligne " + yyline); }