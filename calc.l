
%{
#include "y.tab.h"
%}

%%
[0-9]+"."[0-9]+  { sscanf(yytext,"%lf",&yylval); return NUMBER; }
[0-9]+   { sscanf(yytext,"%lf",&yylval); return NUMBER; }

[ \t]   ;
[\n]   { return '\n'; }
.   { return yytext[0]; }

%%
int yywrap()
{
    return 1;
}
