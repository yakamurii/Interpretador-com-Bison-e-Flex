# Primeiro Passo: Instalar Flex e Bison

Instalação do Flex
sudo apt-get install flex

Instalação do Bison
sudo apt-get install bison

# Compilar Arquivos

flex calcularImc.l 


bison -d calcularImc.y



g++ calcularImc.tab.c lex.yy.c -o calcularImc

# Executar

./calcularImc


# Como testar
Deve-se inserir o peso e altura, entre os parênteses separados por vírgula, respectivamente.Exemplos:


imc(57.5,1.65);

IMC(64.9,1,76);
