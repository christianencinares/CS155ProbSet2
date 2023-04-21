/*Usage:                     */
/*flex ENCINARES_CSS155_PS1.l*/
/*gcc lex.yy.c -o output     */
/*.\output <input file name> */

%option noyywrap

/*Definitions*/
%{
#include <stdio.h>
#include <stdlib.h>
void print_class(char *class);
%}
/*-----------*/
FLOAT          (-)?([1-9][0-9]*|0)(\.[0-9]+)
INT            (-)?([1-9][0-9]*|0) 
ID             [A-Za-z_][0-9A-Za-z_]*
MATH_FUNC      (floor|ceil|mod|log2|log)
OPEN_PAREN     (\()
CLOSE_PAREN    (\))
DOUBLE_QUOTE   (\") 
ARITHMETIC_OP  (\+|\-|\/|\*|\^) 
LOGICAL_OP     (and|or|not)
RELATIONAL_OP  (<=|>=|==|!=|>|<)
WHITESPACE     [ \t\r\n\f]
/*---Rules---*/
%%
"go to"         {print_class("[GO_TO]");}
"endwhile"      {print_class("[END_WHILE]");}
"endcase"       {print_class("[END_CASE]");}
"endfor"        {print_class("[END_FOR]");}  
"while"         {print_class("[WHILE]");}
"case"          {print_class("[CASE]");}
"forever"       {print_class("[FOREVER]");}
"for"           {print_class("[FOR]");}
"do"            {print_class("[DO]");}
"else if"       {print_class("[ELSE_IF]");}
"if"            {print_class("[IF]");}
"else"          {print_class("[ELSE]");}
"then"          {print_class("[THEN]");} 
"repeat"        {print_class("[REPEAT]");}
"until"         {print_class("[UNTIL]");}
"loop"          {print_class("[LOOP]");}
"by"            {print_class("[BY]");}
"to"            {print_class("[TO]");}
"input"         {print_class("[INPUT]");}
"output"        {print_class("[OUTPUT]");}
"array"         {print_class("[ARRAY]");}
"node"          {print_class("[NODE]");}
"call"          {print_class("[CALL]");}
"return"        {print_class("[RETURN]");}
"procedure"     {print_class("[PROCEDURE]");}
"end"           {print_class("[END]");}
"exit"          {print_class("[EXIT]");}
"stop"          {print_class("[STOP]");}
{MATH_FUNC}     {print_class("[MATH_FUNC]");}
"="             {print_class("[ASSIGN]");}
":"             {print_class("[COLON]");}
";"             {print_class("[SEMICOLON]");}
","             {print_class("[COMMA]");}
{OPEN_PAREN}    {print_class("[OPEN_PAREN]");}
{CLOSE_PAREN}   {print_class("[CLOSE_PAREN]");}
"'"             {print_class("[SINGLE_QUOTE]");}
{DOUBLE_QUOTE}  {print_class("[DOUBLE_QUOTE]");}
{ARITHMETIC_OP} {print_class("[ARITHMETIC_OP]");}
{LOGICAL_OP}    {print_class("[LOGICAL_OP]");}
{RELATIONAL_OP} {print_class("[RELATIONAL_OP]");}
{FLOAT}         {print_class("[FLOAT]");}	
{INT}           {print_class("[INTEGER]");}
{ID}	        {print_class("[IDENTIFIER]");}
{WHITESPACE}    /*Ignore*/
.               {print_class("[UNKNOWN]");}

%%
/*-----------*/
void print_class(char *class){
    printf("Token Read: %s | Class: %s\n", yytext, class);
}

/*----Code----*/
int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}/*-----------*/