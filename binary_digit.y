%{

#include<stdio.h>
int err = 0;
int ans = 0;

%}
%name parser

%token digit

%%
A : L {ans = $1;}
  | L '\n' {ans = $1;}
L : L B {$$ = $1 + $2;}
   | B  {$$ = $1;}
B : digit {
      if($1 == 1)$$ = 1;
      else $$ = 1;
    }



%%

void main(){
   yyparse();
   if(err){
       printf("syntax error\n");
       return;
   }
   
   printf("No of digits = %d\n" , ans);
   
   
}

void yyerror(char *rakesh){
    err = 1;
}
