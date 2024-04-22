%{
#include <stdio.h>
int v = 0;
int c = 0;
%}

%%
[aAeEiIoOuU]    { v++; }
[a-zA-Z]        { c++; }
.               { /* ignore all other characters */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string: ");
    yylex();
    printf("Vowels: %d\n", v);
    printf("Consonants: %d\n", c);
    return 0;
}

