%{
#include <stdio.h>
%}

%%

"//"(.*)               { printf("Single line comment: %s\n", yytext); }
"/*"([^*]|\*+[^*/])*\*+"/"   { printf("Multi-line comment: %s\n", yytext); }
.                      ; // Ignore other characters

%%

int yywrap(){}
int main() {
    yylex();
    return 0;
}

