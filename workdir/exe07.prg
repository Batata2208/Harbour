clear

nNumeroUm     := 0
nNumeroDois   := 0

@ 01,01 to 10,40

@ 02,02 say " Digite os numeros a serem calculados"
@ 03,02 say " Primeiro numero e   "
@ 04,02 say " Segundo  numero e   "
@ 06,02 say " A soma deles e      "
@ 07,02 say " A subtracao deles e "
@ 08,02 say " O produto deles e   "
@ 09,02 say " A divisao deles e   "

@ 03,22 get nNumeroUm   picture "@e 999.99"
@ 04,22 get nNumeroDois picture "@e 999.99"
read

nNumeroTres   := nNumeroUm + nNumeroDois
nNumeroQuatro := nNumeroUm - nNumeroDois
nNumeroCinco  := nNumeroUm / nNumeroDois
nNumeroSeis   := nNumeroUm * nNumeroDois

@ 06,27 say nNumeroTres   picture "@e 999,999.9999"
@ 07,27 say nNumeroQuatro picture "@e 999,999.9999"
@ 08,27 say nNumeroSeis   picture "@e 999,999.9999"
@ 09,27 say nNumeroCinco  picture "@e 999,999.9999"

@ 11,22 say ""


