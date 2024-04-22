%{

#include<stdio.h>
char ans[100];
int last = -1;
int err = 0;
%}
%name parser

%token num

%left '+' '-'
%left '*' '/' '%'

%%

A : E {}
  | E '\n' {}
E : E '+' E {append('+');}
  | E '-' E {append('-');}
  | E '*' E {append('*');}
  | E '/' E {append('/');}
  | E '%' E {append('%');}
  | '(' E ')' {}
  | num {append((char)('0' + $1));}

%%

void append(char x){
   int i;
  for( i = 0 ; ans[i] != '\0' ; i++){
  
  }
  ans[i] = x;
  ans[i+1] = '\0';
}

void main(){
    ans[0] = '\0';
   yyparse();
   
   if(err){
      printf("syntax error\n");
   }else{
      printf("%s" , ans);
   }
}

void yyerror(char *s){
   err = 1;
}

