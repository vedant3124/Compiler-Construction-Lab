
%{
#include <stdio.h>
int count_A = 0;
int count_exp = 0;
%}

%%
[aA][a-zA-Z]*                         { count_A++; }
[0-9]+(\.[0-9]+)?[eE][+-]?[0-9]+      { count_exp++; }
[^\t\n ]+                             { /* Skip other words */ }
\n                                    { /* Skip lines */ }
.                                     { /* Skip everything else */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text or numbers:\n");
    yylex();
    printf("\nWords starting with 'A'/'a': %d\n", count_A);
    printf("Exponential numbers: %d\n", count_exp);
    return 0;
}

