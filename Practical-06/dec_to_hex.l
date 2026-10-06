
%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+      { int num = atoi(yytext); printf("0x%X", num); }
.|\n        { printf("%s", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text containing decimal numbers:\n");
    yylex();
    return 0;
}

