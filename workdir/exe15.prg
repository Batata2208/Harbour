setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

nLinha    := 5
nContador := 0
cNomePessoa := Space(30)

@ 02,02 say "Escreva seu nome que ele sera imprimido 10 vezes"
@ 03,02 say "Nome: "

@ 03,08 get cNomePessoa picture "@!" valid !Empty(cNomePessoa)
read

do while nContador < 10

    @ nLinha++,02 say cNomePessoa

    nContador++
    Inkey(0.5)
enddo

@ 20,02 say "prescione algo para usar outro nome"

Inkey(0)