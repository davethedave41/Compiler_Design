%{
int yylex();
void yyerror(char *s);
%}

/* declare tokens SN: it is a bison convention
to give uppercase names to tokens but it is not required */
%token I
%token V
%token X
%token L
%token C
%token D
%token M

