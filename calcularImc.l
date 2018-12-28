%{
   #include "calcularImc.tab.h"
%}
%option noyywrap
%%
 
\t		    ;
\n		    { return NOVA_LINHA; }
[0-9]+\.?[0-9]*     { yylval.fval = atof(yytext);
          	    return NUM;
        	    }
IMC|imc 	    { return IMC; }
","	     	    { return SEPARADOR; }
"("     	    { return PARENTESE_A; }
")"     	    { return PARENTESE_F; }
";"	     	    { return FIM_LINHA; }
%%
