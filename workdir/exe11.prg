setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

//variaveis de String
cNomeNadador := Space(30)
cCategoria   := ""

//variaveis numericas
nIdadeNadador := 0

//Variaveis Linhas e colunas
nLinhasDoSay := 02
nColunaDoSay := 02

nLinhasDoGet := 03
nColunaDoGet := 02

nLinhaDoresultado  := 08
nColunaDoresultado := 02

@ 01,01 to 06,32


@ nLinhasDoSay++,nColunaDoSay say "Digte o Seu Nome: "     //linha 02
@ ++nLinhasDoSay,nColunaDoSay say "Digite a sua Idade: "   //linha 04

@ nLinhasDoGet++,nColunaDoGet get cNomeNadador  picture "@!"     valid !Empty(cNomeNadador) //linha 03
@ ++nLinhasDoGet,nColunaDoGet get nIdadeNadador picture "@e 999" valid nIdadeNadador > 0    //linha 05
read

if nIdadeNadador < 5
   cCategoria := "Nao definida, por ser muito novo"

elseif nIdadeNadador < 8
   cCategoria := "Infantil A"

elseif nIdadeNadador < 11
   cCategoria := "Infantil B"

elseif nIdadeNadador < 14
   cCategoria := "Juvenil A"

elseif nIdadeNadador < 18
   cCategoria := "Juvenil B"

else
   cCategoria := "Senior"

endif

@ 07,01 to 10,50

@ nLinhaDoresultado++,nColunaDoresultado say "O Nadador:      " + cNomeNadador
@ nLinhaDoresultado,nColunaDoresultado say "‚ da Categoria: " + cCategoria

@ 12,02 say "Precione uma tecla para continuar"
Inkey(0)
