%{

#include<stdio.h>
int err = 0;
%}
%name parser

%%

A : E {}
   | E '\n' {}
E : '(' E ')' E {}
  | {}

%%

void main(){
   yyparse();
   if(err){
       printf("invalid\n");
       return;
   }
   
   printf("valid\n");
   
   
}

void yyerror(char *rakesh){
    err = 1;
}
