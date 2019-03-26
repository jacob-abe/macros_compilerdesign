%{
#include <stdio.h>												
#include <stdlib.h>
int yylex();
int res=0;
int flag=0;
void yyerror(char *s);
%}
%start S
%token DEFINE ID TYPE NUM
%right "="
%left  '+' '-'
%left  '*' '/'
%right UMINUS
%left '!'

%%
S  : DEFINE	ID TYPE ';' {printf("\ninput accepted Type macro");exit(0);} 
 | DEFINE ID E ';' {printf("\ninput accepted Arithmetic expression");
   printf("%d",$3);
 exit(0);} ;
E: E'+'E   {$$ = $1 + $3;}
 |E'-'E   	{$$= $1 - $3;}
 |E'*'E   	{$$= $1 * $3;}
 |E'/'E  	{$$= $1 / $3;}
 |E'^'E  
 |'('E')'   
 |'-'E %prec UMINUS  
 |ID
 |NUM
; 
%%
int yywrap()
{
return 1;
}
void main()
{
printf("enter");
yyparse();
}
void yyerror(char *s){
extern int yylineno;
fprintf(stderr,"line no %d:%s \n",yylineno,s);}
