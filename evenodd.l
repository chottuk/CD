%{
#include <stdio.h>
int even_count = 0;
int odd_count = 0;
%}

%%

[0-9]+ {
    int num = atoi(yytext);
    if (num % 2 == 0) {
        even_count++;
    } else {
        odd_count++;
    }
}

\n     {
        printf("Number of even integers: %d\n", even_count);
        printf("Number of odd integers: %d\n", odd_count);
        even_count = 0;
        odd_count = 0;
    }

.       ;

%%
int yywrap(){ return 1;}

int main() {
    yylex();
    return 0;
}

