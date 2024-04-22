%{
#include<stdio.h>
int sc = 0, wc = 0, lc = 0, cc = 0;
%}

%%
[\n] { lc++; cc++; }
[  \t] { sc++; cc++; }
[^\t\n ]+ { wc++; cc++; }
%%

int main() {
    printf("Enter the input:\n");
    yylex();
    printf("The number of lines = %d\n", lc);
    printf("The number of spaces = %d\n", sc);
    printf("The number of words = %d\n", wc);
    printf("The number of characters = %d\n", cc);
    return 0;
}

int yywrap() {
    return 1;
}

