grammar Pcl2;  // A tiny subset of Pascal

@header {
#include "wci/intermediate/TypeSpec.h"
using namespace wci::intermediate;
}

program   : header mainBlock '.' ;
header    : PROGRAM IDENTIFIER ';' ;
mainBlock : block;
block     : declarations compound_Stmt ;

declarations : VAR declList ';' ;
declList     : decl ( ';' decl )* ;
decl         : varList ':' typeId ;
varList      : varId ( ',' varId )* ;
varId        : IDENTIFIER ;
typeId       : IDENTIFIER ;

compound_Stmt : BEGIN stmt ';' ( stmt ';')* END;



stmt : compound_Stmt  # compoundStmt
     | assignmentStmt (|';') # assignment_Stmt
     | loop_stmt   (|';')# loopStmt 
     | if_stmt   (|';')  # ifStmt
     |        #emptyStmt
     ;
     
stmtList       : stmt ( ';' stmt )* ;
assignmentStmt : variable ':=' expr ;
loop_stmt  		: LOOP expr stmt ;
if_stmt       : IF expr stmt ;

variable : IDENTIFIER ;

expr locals [ TypeSpec *type = nullptr ]
    : expr mulDivOp expr   # mulDivExpr
    | expr addSubOp expr   # addSubExpr
    | expr rel_operation expr       # relExpr
    | number               # unsignedNumberExpr
    | signedNumber         # signedNumberExpr
    | variable             # variableExpr
    | '(' expr ')'         # parenExpr
    ;
     
mulDivOp : MUL_OP | DIV_OP ;
addSubOp : ADD_OP | SUB_OP ;
     
signedNumber locals [ TypeSpec *type = nullptr ] 
    : sign number 
    ;
sign : ADD_OP | SUB_OP ;

number locals [ TypeSpec *type = nullptr ]
    : INTEGER    # integerConst
    | FLOAT      # floatConst
    ;

PROGRAM : 'PROGRAM' ;
VAR     : 'VAR' ;
BEGIN   : 'BEGIN' ;
END     : 'END' ;
LOOP   : 'LOOP' ;
IF    : 'IF' ;

IDENTIFIER : [a-zA-Z][a-zA-Z0-9]* ;
INTEGER    : [0-9]+ ;
FLOAT      : [0-9]+ '.' [0-9]+ ;

mul_div_operation : MUL_operation | DIV_operation ;
add_sub_operation : ADD_operation | SUB_operation ;
rel_operation     : EQEQ_operation | NE_operation | LT_operation | LE_operation | GT_operation | GE_operation ;


MUL_OP :   '*' ;
DIV_OP :   '/' ;
ADD_OP :   '+' ;
SUB_OP :   '-' ;

EQ_operation  : '=' ;
EQEQ_operation: '==';
NE_operation  : '!=' ;
LT_operation  : '<' ;
LE_operation  : '<=' ;
GT_operation  : '>' ;
GE_operation  : '>=' ;

NEWLINE : '\r'? '\n' -> skip  ;
WS      : [ \t]+ -> skip ; 