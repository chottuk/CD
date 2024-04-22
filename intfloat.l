%{
#include <stdio.h>
int int_count = 0;
int float_count = 0;
%}

%%
[0-9]+      { int_count++; }          // Match integers
[0-9]+"."[0-9]+  { float_count++; }  // Match floating-point numbers
%%

int main() {
    yylex();
    printf("Number of integers: %d\n", int_count);
    printf("Number of floating point numbers: %d\n", float_count);
    return 0;
}

