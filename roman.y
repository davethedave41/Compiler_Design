%{
# include <stdio.h>
# include <stdlib.h>
  int yylex();
  void yyerror(char *s);
%}
/* declare tokens SN: it is a bison convention
to give uppercase names to tokens but it is not required */
%token IV
%token IX
%token XL
%token XC
%token CD
%token CM
%token I 
%token V
%token X
%token L
%token C
%token D
%token M
%token EOL
%%
roman_nums: /* nothing */
| roman_nums thousands EOL { printf("= %d\n>", $2); }
;
thousands: hundreds
| hundreds M thousands { $$ = $1 + 1000; }
;
hundreds: tenths
| tenths C hundreds  { $$ = $1 + 100; }
| tenths D hundreds  { $$ = $1 + 500; }
| tenths CD hundreds { $$ = $1 + 400; }
| tenths CM 
;
tenths: units
| units X tenths  { $$ = $1 + 10; }
| units L tenths  { $$ = $1 + 50; }
| units XL tenths { $$ = $1 + 40; }
| units XC tenths { $$ = $1 + 90; }
;
units: /* nothing */
| I units  { $$ = $1 + 1; }
| IV units { $$ = $1 + 4; }
| IX units { $$ = $1 + 9; }
;
%%
int main()
{
    printf(">");
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}