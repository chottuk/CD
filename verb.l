%{
#include <stdio.h>
%}

%%

[a-zA-Z]+ing   { printf("%s is a verb.\n", yytext); }
[a-zA-Z]+      { printf("%s is a non-verb.\n", yytext); }
.              { printf("Invalid input.\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}

