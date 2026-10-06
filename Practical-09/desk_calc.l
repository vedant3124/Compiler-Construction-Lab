
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?   { yylval.fval = atof(yytext); return NUMBER; }
[\t ]               { /* Skip whitespace */ }
\n                  { return NEWLINE; }
.                   { return yytext[0]; }
%%

int yywrap() {
    return 1;
}

