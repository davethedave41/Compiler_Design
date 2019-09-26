%{
int even_numbers = 0;
int even_chars = 0;
%}

%%

[0-9]+  	       {if(atoi(yytext)%2 == 0) even_numbers++;}
\n                 {}
.                  {}
%%

int main()
{
    yylex();
    printf("%d\n", even_numbers);
    yywrap();
    return 0;
}