%{
#include <stdio.h>
int fun(int l);
%}

%%
[a-zA-Z0-9]+ { int length = yyleng; fun(length); }
.            ; // Ignore other characters
%%

int fun(int l) {
    if (l == 3 && yytext[0] == 'A') {
        printf("%s is starting with A and has a length of 3\n", yytext);
    }
}

int yywrap(){}
int main() {
    printf("Enter input string: ");
    yylex();
    return 0;
}

