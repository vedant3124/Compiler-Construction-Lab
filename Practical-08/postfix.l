
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[\t ]       { /* Skip whitespace */ }
\n          { return 0; }
.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}

