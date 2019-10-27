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
| roman_nums units EOL { printf("%d\n", $2); }
;
units: tenths
| tenths I units  { $$ = $$ + 1; }
| tenths IV units { $$ = $$ + 4; }
| tenths IX units { $$ = $$ + 9; }
;
tenths: hundreds
| hundreds X tenths  { $$ = $$ + 10; }
| hundreds L tenths  { $$ = $$ + 50; }
| hundreds XL tenths { $$ = $$ + 40; }
| hundreds XC tenths { $$ = $$ + 90; }
;
hundreds: thousands
| thousands C hundreds  { $$ = $$ + 100; }
| thousands D hundreds  { $$ = $$ + 500; }
| thousands CD hundreds { $$ = $$ + 400; }
| thousands CM hundreds { $$ = $$ + 900; } 
;
thousands: 
| M thousands { $$ = $$ + 1000; }
;
%%
int main()
{
    yyparse();
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}