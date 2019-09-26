%{
    char str[1000];
    int isAsterisk = 0;
    int isBrackets = 0;
    int notAComment = 0;
    int activeComment = 0;
%}

%%
"\""                         {if(notAComment == 0){ notAComment = 1;}
                              else{ notAComment = 0;}            
                              strcat(str, yytext);}
"{"                          {if(notAComment == 0){ isBrackets = 1; activeComment = 1;} 
                              else { strcat(str, yytext);}}
"}"                          {if(notAComment == 0 && activeComment == 1){ isBrackets = 0; activeComment = 0;}
                              else if(notAComment == 1){ strcat(str, yytext);} 
                              else if(activeComment == 0){ strcat(str, "syntax error\n"); return 0;}}
"**"            	         {if(notAComment == 0) isAsterisk = 1;
                              else strcat(str, yytext);}
^.                           {if(isBrackets == 0) strcat(str, yytext);
                              isAsterisk = 0;}
.                            {if(isAsterisk == 0 && isBrackets == 0) strcat(str, yytext);}
\n                           {if(isBrackets == 0) strcat(str, "\n");}
<<EOF>>                      {if(activeComment == 0) return 0;
                              else{ strcat(str, "syntax error\n"); return 0;}}
%%

int main()
{
    yylex();
    printf("%s", str);
    return 0;
}