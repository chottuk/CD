%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+ {
    int num = atoi(yytext);
    int a = 0, b = 1;
    printf("Fibonacci series up to %d:\n", num);
    while (a <= num) {
        printf("%d ", a);
        a=a+b;
        b=a-b;
    }
    printf("\n");
}

.       ;

%%
int yywrap(){ return 1;}

int main() {
    yylex();
    return 0;
}

