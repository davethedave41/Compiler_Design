%{
  char str[3];
  int num;
  int n_years_registered;
%}
NUMBER [0-9]+    
COUNTY1 CE|CN|CW|DL|D|G|KE|KY|KK|KY|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|WH|WX|WW|W 
YEAR1 [0-9]{3}   
YEAR2 [0-9]{2}
COUNTY2 CE|CN|CW|DL|D|G|KE|KY|KK|KY|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|WH|WX|WW|W|WD|TN|TS|LK 
%%
{YEAR2}-T-{NUMBER}                                               {printf("INVALID\n");}
[0-9]{4,10}-                                                     {printf("INVALID\n");}
({YEAR2}|{YEAR1})-[a-z]-{NUMBER}                                 {printf("INVALID\n");} 
({YEAR1}-{COUNTY1})|({YEAR2}-{COUNTY2})-[0-9]{7,20}              {printf("INVALID\n");}
({YEAR1}-{COUNTY1}-{NUMBER})|({YEAR2}-{COUNTY2}-{NUMBER})        {strncpy(str,yytext,2);
                                                                  num = atoi(str);
                                                                  if(num>19){
                                                                    n_years_registered = 119 - num;
                                                                  }
                                                                  else{
                                                                    n_years_registered = 19 - num;
                                                                  }
                                                                  printf("%d",n_years_registered);}
[ \r\t\n]                                                        {}
%%

int main()
{
  yylex();
  return 0;
}