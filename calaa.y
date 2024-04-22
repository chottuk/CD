%{
#include<stdio.h>
int yylex(void);
void yyerror(char *s);
%}

%token INTEGER
%left '+'
%left '*'

%%
E1 : E '\n' {printf("valid"); }
	| E
	;
E : E '+' E {printf("+");}
  | E '*' E {printf("*");}
  | INTEGER {printf("%d",$1);}
  ;
%%

int main(void){
yyparse();
return 0;

}
 void yyerror(char *s)
 {}
 
