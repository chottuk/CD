%{
 #include<stdio.h>
 #include "y.tab.h"

%}

%%
[10] {yylval = atoi(yytext) ; return digit;}
\n {return 0;}
. {return yyerror();}
%%

int yywrap(){


}
