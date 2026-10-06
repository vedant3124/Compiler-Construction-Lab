
%{
#include <stdio.h>
%}

%%
.*"COM"\n   { printf("MATCHED: %s", yytext); }
.*\n        { printf("REJECTED: %s", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter lines to check if they end with 'COM':\n");
    yylex();
    return 0;
}

