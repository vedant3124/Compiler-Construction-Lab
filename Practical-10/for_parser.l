
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
"for"       { return FOR; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[0-9]+      { return NUM; }
"++"        { return INC; }
"--"        { return DEC; }
"<="        { return LE; }
">="        { return GE; }
"=="        { return EQ; }
"!="        { return NE; }
[\t ]       { /* Skip whitespace */ }
\n          { /* Skip newlines */ }
.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}

