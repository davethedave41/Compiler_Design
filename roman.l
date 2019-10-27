%{
#include "roman.tab.h"
void yyerror(char *s);
%}

%%
"I"  {yylval = 1; return NUMS;}
"V"  {yylval = 5; return NUMS;}
"X"  {yylval = 10; return NUMS;}
"L"  {yylval = 50; return NUMS;}
"C"  {yylval = 100; return NUMS;}
"D"  {yylval = 500; return NUMS;}
"M"  {yylval = 1000; return NUMS;}
"IV" {yylval = 4; return NUMS;}
"IX" {yylval = 9; return NUMS;}
"XL" {yylval = 40; return NUMS;}
"XC" {yylval = 90; return NUMS;}
"CD" {yylval = 400; return NUMS;}
"CM""C"{1,} {printf("syntax error\n"); return 0;}
"CM" {yylval = 900; return NUMS;}
"I"{4,} {printf("syntax error\n"); return 0;}
\n   {return EOL;}
[ \t] { /* ignore white space */ }
.     { printf("syntax error\n"); return 0;}
%%