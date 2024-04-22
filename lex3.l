%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}



%%

int|float   { return TYPE; }
[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return ID; }
','         { return ','; }
[ \t\n]     ;  // Ignore whitespace characters
.           { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1; // Indicate end of input
}

