%{
#include <stdio.h>
int char_count = 0, word_count = 0, line_count = 0;
%}
%%
\n { line_count++; char_count++; }
[^\t\n ]+ { word_count++; char_count += yyleng; }
. { char_count++; }
%%
int yywrap() { return 1; }
int main() {
    printf("Enter input:\n");
    yylex();
    printf("\nLines: %d | Words: %d | Characters: %d\n", line_count, word_count, char_count);
    return 0;
}

