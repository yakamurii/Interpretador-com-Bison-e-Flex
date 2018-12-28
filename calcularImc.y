%{
   #include <iostream>
   using namespace std;
 
   extern int yylex();
   extern int yyparse();
   extern FILE* yyin;
   void yyerror(const char* s);
   string getSituacao(float imc);
%}
 
%union {
   float fval;
}
 
%token <fval> NUM
%token IMC
%token PARENTESE_A
%token PARENTESE_F
%token SEPARADOR
%token FIM_LINHA
%token NOVA_LINHA

%start line

%%

line:
	| line EXPRESSAO NOVA_LINHA
;

EXPRESSAO: IMC PARENTESE_A NUM SEPARADOR NUM PARENTESE_F FIM_LINHA{
    float imc = $3/($5*$5);
    cout<<"Seu imc e: "<<imc<<endl;
    cout<<getSituacao(imc);
};
 
%%
 
int main(int, char**){
    yyin = stdin;
    yyparse();
    return 0;
}
 
void yyerror(const char* s){
    fprintf(stderr, "Erro: %s\n", s);
}

string getSituacao(float imc) {
   if(imc < 17)
      return "Muito abaixo do peso\n";
   else if(imc >= 17 && imc < 18.50)
      return "Abaixo do peso\n";
   else if(imc >= 18.5 && imc < 25)
      return "Peso normal\n";
   else if(imc >= 25 && imc < 30)
      return "Acima do peso\n";
   else if(imc >= 30 && imc < 35)
      return "Obesidade I\n";
   else if(imc >= 35 && imc < 40)
      return "Obesidade II\n";
   else 
      return "Obesidade III\n";
}
