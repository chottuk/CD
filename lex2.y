%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex(void); // Declaration of yylex function

 int flag=0;
void yyerror( char *msg);
%}

%token id
%name parse

%%

S: S '=' L|R { flag++;}
L: '*'R|id
R:L
 ;
%%

int main() {
    printf("Enter the expression for the grammar: ");
    yyparse();
    if (flag) {
        printf("\nValid expression\n");
    } else {
        yyerror("Syntax error");
    }
    return 0;
}

void yyerror( char *msg) {
    printf("%s\n", msg);
    exit(1);
}

