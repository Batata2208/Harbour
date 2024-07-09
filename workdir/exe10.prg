setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

//variaveis string
cNomePessoa := Space(30)

//Variaveis numericas
nIdadePessoa := 0

// Para os says do if
nLinha  := 5
nColuna := 2

@ 02,02 say "Nome Pessoa:  "
@ 03,02 say "Idade Pessoa: "

//pegar nome e idade
@ 02,16 get cNomePessoa  picture "@!"  Valid !Empty(cNomePessoa)
@ 03,16 get nIdadePessoa picture "999" valid nIdadePessoa >= 0
read

//resultado
cMaior21 := "A Pessoa " + Alltrim(cNomePessoa) + " Tem mais de 21 Anos Parabens :)"
cMenor21 := "A pessoa " + Alltrim(cNomePessoa) + " Tem menos que 21 Anos Triste :("

if nIdadePessoa > 21
   @ nLinha,nColuna say cMaior21
else
   @ nLinha,nColuna say cMenor21
endif

Inkey(0)
