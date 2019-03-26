%option yylineno
%pointer
%{
#include <stdio.h>
#include "file2.tab.h"
extern int yylval;
%}
alpha [A-Za-z]
digit [0-9]
%%
[0-9]+ {
			yylval=atoi(yytext);
			return NUM;
}
[\t \n]     {}  ;
\n     {yylineno++;}
#define     			return DEFINE;
int|float|char|double   		 return TYPE;
{alpha}({alpha}|{digit})*    return ID;
{digit}+     return NUM;
.     return yytext[0];
%%