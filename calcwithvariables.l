/* 
   CS3071 Assignment 6 -> calculator with variables
		David Urdaibay 
*/
%{
# include "calcwithvariables.tab.h"
void yyerror(char* s);  
%}

%%
":="            { return ASSIGN; }
"+"             { return ADD; }
"-"             { return SUB; }
"*"             { return MUL; }
"/"             { return DIV; }
"print"         { return PRINT; }
[a-z]           { yylval = yytext[0]; return VAR; }
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
";"             { return EOL; }
[ \t\n\r\f\v]*  { }
.               { yyerror("syntax error"); }
%%
