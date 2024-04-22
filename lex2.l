%{
#include<stdio.h>
#include"y.tab.h"

%}

%%
[a-zA-Z][a-zA-Z0-9]* {return id;}
[ ] { return 0;}
. { return yytext[0];}
[\t];
[\n] { return 0;}
%%

int yywrap() { 
    return 1;
}

