%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define MAX_LEN  10

%}

%union {
  int iVal;
  char *sVal;
}

%token <iVal> NUMBER
%token EOLN PLUS MINUS MUL DIV LRP RRP 
%token SEMICOLON ID

%type <sVal> expr

/*
  E -> E + E | E * E | NUM | ID | (E)
  printf ("T1:got %d * %d\n", $1, $3);
*/
%left PLUS 
%left MUL


%%

lines  : lines expr SEMICOLON   
         { 
           printf( "The prefix expr is %s\n", $2);
           free($2);
           printf( "2:Pl enter yet another infix expr ending with ; or <ctrl-d> to quit : ");
         }
       | lines SEMICOLON  
       |  /*epsilon*/    { printf("1:Pl enter an infix expr ending with ; or <ctrl-d> to quit : ");}     
       ;

expr	 : expr PLUS expr         
         { 
           char *res = malloc(strlen($1)+strlen($3) + 5);
           sprintf (res, "+ %s %s", $1, $3);
           free($1); free($3);
           $$ = res;
         }
       | expr MUL  expr   
         { 
           char *res = malloc(strlen($1)+strlen($3) + 5);
           sprintf (res, "* %s %s", $1, $3);
           free($1); free($3);
           $$ = res;
         }
       | LRP expr  RRP            { $$ = $2;}
       | NUMBER                 { char *res = malloc(10); sprintf (res, "%d", $1); $$ = res;}
	     ;


%%
void yyerror(char *msg)
{
  printf("error in input %s\n", msg);
  exit(1);
}

int main()
{
  

  yyparse();
}
