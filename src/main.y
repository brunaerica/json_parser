

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token NUMERO STRING FLOAT DOISPONTOS VIRGULA ABRE_COLCHETE FECHA_COLCHETE ABRE_CHAVE FECHA_CHAVE


%%
JSON:
	OBJETO {printf("VALIDO\n");}	
	;

OBJETO:
	ABRE_CHAVE MEMBROS FECHA_CHAVE
	;


MEMBROS:
	MEMBRO
	| MEMBRO VIRGULA MEMBROS 
	;


MEMBRO:
	STRING DOISPONTOS ELEMENTO
	;

LISTA:
	ABRE_COLCHETE ELEMENTOS FECHA_COLCHETE
	| ABRE_COLCHETE MEMBROS FECHA_COLCHETE 
	 /*{printf("estou em lista float\n");}*/
	;


ELEMENTOS:
	ELEMENTO
	ELEMENTO VIRGULA ELEMENTO /*{printf("estou em elemento\n");}*/
	;

ELEMENTO:
	VALOR
	;



VALOR:
	OBJETO
	| LISTA
	| STRING
	| NUMERO
	| FLOAT /* {printf("estou em valor float\n");}*/
	;





%%
void yyerror(char *s) {
	printf("INVALIDO\n");
}
int main() {
  yyparse();
    return 0;
}
