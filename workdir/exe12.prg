setmode(25,80)
set date to British
set epoch to 1940
set century on
set scoreboard off

clear

cFrase   := "Nenhum numero e igual"

nNumeroMaior := 0
nNumeroUm    := 0
nNumeroDois  := 0
nNumeroTres  := 0

@ 01,01 to 04,50 double

@ 02,02 say "Digite 3 numeros e irei verificar qual ‚ o maior"

@ 03,02 get nNumeroUm   picture "@e 999,999.99" valid !Empty(nNumeroUm)
@ 03,13 get nNumeroDois picture "@e 999,999.99" valid !Empty(nNumeroDois)
@ 03,24 get nNumeroTres picture "@e 999,999.99" valid !Empty(nNumeroTres)
read

nNumeroMaior := nNumeroUm

if nNumeroDois > nNumeroMaior
   nNumeroMaior := nNumeroDois
endif

if nNumeroTres > nNumeroMaior
   nNumeroMaior := nNumeroTres
endif

if nNumeroUm = nNumeroDois .and. nNumeroDois = nNumeroTres
   cFrase := "Todos os numeros sao iguais"
elseif nNumeroUm = nNumeroDois
   cFrase :=  "Os numeros um e dois sao iguais"
elseif nNumeroUm = nNumeroTres
   cFrase :=  "Os numeros um e tres sao iguais"
elseif nNumeroDois = nNumeroTres
   cFrase :=  "Os numeros dois e tres sao iguais"
endif

@ 05,02 say "O maior numero e " + Transform(nNumeroMaior,"@e 999,999.99")
@ 06,02 say cfrase

Inkey(0)
