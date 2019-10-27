%{
#include "roman.tab.h"
void yyerror(char *s);
%}

%%
"IV" {return IV;}
"IX" {return IX;}
"XL" {return XL;}
"XC" {return XC;}
"CD" {return CD;}
"CM" {return CM;}
"I" {return I;}
"V" {return V;}
"X" {return X;}
"L" {return L;}
"C" {return C;}
"D" {return D;}
"M" {return M;}
\n  {return EOL;}
[ \t] { /* ignore white space */ }
.     { yyerror("Not a valid roman numeral\n");}
%%