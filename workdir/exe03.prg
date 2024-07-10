clear

nNumeroUm   := 0
nNumeroDois := 0

cCor := "W/D"

@ 02,02 say "Digite os numeros a serem calculados"
@ 03,02 say " Primeiro numero e   "
@ 04,02 say " Segundo  numero e   "
@ 06,02 say " O produto deles e   "

@ 03,22 get nNumeroUm   picture "999" valid !Empty(nNumeroUm)   color cCor
@ 04,22 get nNumeroDois picture "999" valid !Empty(nNumeroDois) color cCor
read

nNumeroProduto   := nNumeroUm * nNumeroDois

@ 06,22 say Alltrim(Str(nNumeroProduto))


