%{

#include<stdio.h>
int ans = 0;
int err = 0;
%}
%name parser

%token num

%left '+' '-'
%left '*' '/' '%'

%%

A : E {ans = $1;}
  | E '\n' {ans = $1;}
E : E '+' E {$$ = $1 + $3;}
  | E '-' E {$$ = $1 - $3;}
  | E '*' E {$$ = $1 * $3;}
  | E '/' E {$$ = $1 / $3;}
  | E '%' E {$$ = $1 % $3;}
  | '(' E ')' {$$ = $2;}
  | num {$$ = $1;}

%%

void main(){

   yyparse();
   
   if(err){
      printf("syntax error\n");
   }else{
      printf("valid");
   }
}

void yyerror(char *s){
   err = 1;
}

