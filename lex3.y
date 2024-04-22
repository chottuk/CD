%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror( char *);

%}

%token TYPE ID 

%%

D: T L    { printf("Valid expression\n"); }
 ;

T: TYPE    { }
 ;

L: L ',' ID  { }
 | ID           { }
 ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter the expression for the grammar: ");
    yyparse();
    return 0;
}

