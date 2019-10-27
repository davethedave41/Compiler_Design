%{
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
| roman_nums thousands EOL {printf("= %d\n>", $2); }
;
thousands: hundreds
|
;
hundreds: tenths
| 
;
tenths: units
|units X tenths  { $$ = $$ + 10; }
|units XL tenths { $$ = $$ + 40; }
|units XC tenths { $$ = $$ + 90; }
;
units: /* nothing */
| I units  { $$ = $$ + 1; }
| IV units { $$ = $$ + 4; }
| IX units { $$ = $$ + 9; }
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