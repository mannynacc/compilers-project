%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%union {
    char *str;
    int num;
}

%token <str> VERB

%token <str> LINKING_VERB

%token <str> PREP

%token <str> FILENAME

%token <str> PREP2

%token <str> COLUMN

%token <str> COMP

%token <str> L

%token <num> NUMBER

%type <str> A
%type <str> B
%type <str> C

%%
statement: A                                 { printf("%s])", $1); }   
 | B                                         { printf("%s])", $1); }        
;

A: VERB PREP FILENAME PREP2 COLUMN LINKING_VERB COMP NUMBER        { 
    printf("import pandas as pd\n");
    printf("df = pd.read_csv('%s')\n", $3);

    $$ = (char*) malloc(sizeof(char) * 100);
    sprintf($$, "print(df[(df['%s'] %s %d)", $5, $7, $8);
}
;

B: A C                                                { 
    $$ = (char*) malloc(sizeof(char) * 100);
    sprintf($$, "%s %s", $1, $2);
}

 | B C                                                { 
    $$ = (char*) malloc(sizeof(char) * 100);
    sprintf($$, "%s %s", $1, $2);
}
;

C: L COLUMN LINKING_VERB COMP NUMBER                               { 
    $$ = (char*) malloc(sizeof(char) * 100);
    sprintf($$, "%s (df['%s'] %s %d)", $1, $2, $4, $5);
}
;
%%
