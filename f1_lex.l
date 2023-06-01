%{
    #include "y.tab.h"
%}

%%
"Search"|"Retrieve"|"Fetch"|"Find"      { return VERB; }
[0-9]+				                    { yylval.num = atoi(yytext); return NUMBER; }
"and"*                                  { yylval.str = "&"; return L; }
"or"*                                   { yylval.str = strdup("|"); return L; }
"not"*                                  { yylval.str = strdup("!"); return L; }
"in"+|"at"+                             { yylval.str = strdup(yytext); return PREP; }
"with"+|"where"+                        { yylval.str = strdup(yytext); return PREP2; }
"equal to"+                             { yylval.str = strdup("=="); return COMP; }
"less than"+                            { yylval.str = strdup("<"); return COMP; }
"more than"+                            { yylval.str = strdup(">"); return COMP; }
"less than or equal to"+                { yylval.str = strdup("<="); return COMP; }
"more than or equal to"+                { yylval.str = strdup(">="); return COMP; }
[a-zA-Z0-9]+[_]?[a-zA-Z0-9]+\.csv       { yylval.str = strdup(yytext); return FILENAME; }
"resultId"|"points"|"driver"|"laps"		{ yylval.str = strdup(yytext); return COLUMN; }
\n                                        return 0; 		    /* logical EOF */
.
%%
