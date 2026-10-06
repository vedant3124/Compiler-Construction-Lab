
%{
#include <stdio.h>
int single_comments = 0;
int multi_comments = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int lines = 1;
int spaces = 0;
%}

%%
"//".*                                    { single_comments++; }
"/*"([^*]|\*+[^*/])*\*+"/"                { multi_comments++; }
"int"|"float"|"char"|"double"|"void"|"if"|"else"|"while"|"for"|"return"|"switch"|"case"|"break" { keywords++; words++; }
[a-zA-Z_][a-zA-Z0-9_]*                    { identifiers++; words++; }
[0-9]+(\.[0-9]+)?                         { words++; } /* Treat regular numbers as words */
[^\t\n ]+                                 { words++; }
"\n"                                      { lines++; }
" "                                       { spaces++; }
"\t"                                      { spaces += 4; } /* Treat a tab as 4 spaces */
.                                         { /* Ignore other characters */ }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter code or text to analyze:\n");
    yylex();
    printf("\n--- Analysis Results ---\n");
    printf("Single-line Comments : %d\n", single_comments);
    printf("Multi-line Comments  : %d\n", multi_comments);
    printf("Keywords            : %d\n", keywords);
    printf("Identifiers         : %d\n", identifiers);
    printf("Total Words         : %d\n", words);
    printf("Lines               : %d\n", lines);
    printf("Spaces              : %d\n", spaces);
    return 0;
}

