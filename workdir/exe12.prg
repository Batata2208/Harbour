setmode(25,80)
set date to British
set epoch to 1940
set century on
set scoreboard off

clear

nNumeroMaior := 0
nNumeroUm    := 0
nNumeroDois  := 0
nNumeroTres  := 0

@ 02,02 say "Digite 3 numeros e irei verificar qual ‚ o maior"

@ 03,02 get nNumeroUm   picture "999" valid !Empty(nNumeroUm)
@ 03,06 get nNumeroDois picture "999" valid !Empty(nNumeroDois)
@ 03,10 get nNumeroTres picture "999" valid !Empty(nNumeroTres)
read

nNumeroMaior := nNumeroUm

if nNumeroDois > nNumeroMaior
   nNumeroMaior := nNumeroDois
endif

if nNumeroTres > nNumeroMaior
   nNumeroMaior := nNumeroTres
endif

@ 05,02 say nNumeroMaior


