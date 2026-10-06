
%{
#include <stdio.h>
%}

%%
[a-z]       { printf("%c", yytext[0] - 32); }
[A-Z]       { printf("%c", yytext[0] + 32); }
.|\n        { printf("%s", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text to convert case:\n");
    yylex();
    return 0;
}

