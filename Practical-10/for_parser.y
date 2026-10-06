
%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token FOR ID NUM INC DEC LE GE EQ NE

%%
S : ST { printf("\nValid FOR loop statement structure!\n"); return 0; }
  ;

ST : FOR '(' INIT ';' COND ';' UPDATE ')' BODY
   ;

INIT : ID '=' NUM
     | ID '=' ID
     | /* empty */
     ;

COND : ID RELOP ID
     | ID RELOP NUM
     | /* empty */
     ;

RELOP : '<' | '>' | LE | GE | EQ | NE
      ;

UPDATE : ID '=' ID '+' NUM
       | ID '=' ID '-' NUM
       | ID INC
       | ID DEC
       | /* empty */
       ;

BODY : ST
     | '{' ST_LIST '}'
     | ';'
     | ID '=' EXPR ';'
     ;

ST_LIST : ST_LIST ID '=' EXPR ';'
        | /* empty */
        ;

EXPR : ID
     | NUM
     | ID '+' ID
     | ID '-' ID
     ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "\nInvalid FOR loop statement structure: %s\n", s);
}

int main() {
    printf("Enter a FOR loop statement:\n");
    yyparse();
    return 0;
}

