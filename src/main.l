%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"


%}


%%

[0-9]+ {return NUMERO;}
[0-9]+[.][0-9]+ {return FLOAT;}
\"[a-zA-Z0-9 ]*\" {return STRING;}
\, {return VIRGULA;}
\[ {return ABRE_COLCHETE;}
\] {return FECHA_COLCHETE;}
[{] {return ABRE_CHAVE;}
[}] {return FECHA_CHAVE;}
[ \t\n] 
\: {return DOISPONTOS;}
\; 

. ;


%%

int yywrap() {
  return 1;
}
