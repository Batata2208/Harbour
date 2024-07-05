set date to British
set epoch to 1940
set century on
set scoreboard off
clear

cLetra         := Space(1)
dData          := CToD("")
nNumeroInteiro := 0
nNumeroDecimal := 0
cString        := Space(20)

@ 01,01 to 07,50 double

@ 02,02 say "Digite uma letra         : "
@ 03,02 say "Digite uma Data          : "
@ 04,02 say "Digite um Numero Inteiro : "
@ 05,02 say "Digite um Numero Decimal : "
@ 06,02 say "Digite uma Frase         : "

@ 02,29 get cLetra         picture "@!"       valid !Empty(cLetra)
@ 03,29 get dData                             valid !Empty(dData)
@ 04,29 get nNumeroInteiro picture "@e 9,999" valid !Empty(nNumeroInteiro)
@ 05,29 get nNumeroDecimal picture "@e 99.99" valid !Empty(nNumeroDecimal)
@ 06,29 get cString        picture "@!"       valid !Empty(cString)
read

@ 08,01 to 14,50

@ 09,02 say "Digite uma letra         : " + cLetra
@ 10,02 say "Digite uma Data          : "
@ 11,02 say "Digite um Numero Inteiro : " + Alltrim(Str(nNumeroInteiro))
@ 12,02 say "Digite um Numero Decimal : " + Alltrim(Str(nNumeroDecimal))
@ 13,02 say "Digite uma Frase         : " + cString

@ 10,29 say dData

@ 20,29 say ""


Inkey (0)
