
%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%union {
    double fval;
}

%token <fval> NUMBER
%token NEWLINE
%left '+' '-'
%left '*' '/'

%type <fval> expr

%%
session: /* empty */
       | session line
       ;

line: NEWLINE
    | expr NEWLINE { printf("Result: %g\n", $1); }
    | error NEWLINE { yyerrok; printf("Error recovered. Enter next expression:\n"); }
    ;

expr: expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { 
                        if($3 == 0) {
                            yyerror("Division by zero");
                            $$ = 0;
                        } else {
                            $$ = $1 / $3; 
                        }
                    }
    | '(' expr ')'   { $$ = $2; }
    | NUMBER         { $$ = $1; }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main() {
    printf("Enter arithmetic expressions (with error recovery support):\n");
    yyparse();
    return 0;
}

