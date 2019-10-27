%{
# include <stdio.h>
# include <stdlib.h>
  int yylex();
  void yyerror(char *s);
%}
/* declare tokens SN: it is a bison convention
to give uppercase names to tokens but it is not required */
%token NUMS
%token EOL
%%

roman_nums: /* nothing */
| roman_nums expr EOL { printf("%d\n", $2); }
;
expr: NUMS
| expr NUMS { $$ = $$ + $2; }
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