
%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER

%%
calculation: expr { printf("\nResult: %d\n", $1); return 0; }
           ;

expr: expr expr '+' { $$ = $1 + $2; }
    | expr expr '-' { $$ = $1 - $2; }
    | expr expr '*' { $$ = $1 * $2; }
    | expr expr '/' { 
                        if($2 == 0) {
                            yyerror("Division by zero!");
                            exit(1);
                        }
                        $$ = $1 / $2; 
                    }
    | NUMBER        { $$ = $1; }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a postfix expression (e.g., 5 3 + 2 *):\n");
    yyparse();
    return 0;
}

