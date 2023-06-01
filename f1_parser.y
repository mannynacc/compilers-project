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

%token <str> PREP

%token <str> DEST

%token <str> PREP2

%token <str> COLUMN

%token <str> COMP

%token <str> L

%token <num> NUMBER


%token EQ LT MT LET MET 

%%
S: A                                            { printf("valid"); }    
 | B                                            { printf("valid"); }      
;

A: VERB PREP DEST PREP2 COMP NUMBER COLUMN       
;

B:                                                    
 | A C                                          
;

C: L COMP NUMBER COLUMN                        
;
%%
