setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

nLinha      := 5
nColuna     := 2
nContador   := 1
nQuantidade := 0

cNomePessoa     := Space(30)
cPictureNumeros := "999"

@ 00,01 to 04,79

@ 01,02 say "Escreva seu nome e a quantidade de vezes que ele deve ser imprimida na tela "
@ 02,02 say "Nome: "
@ 03,02 say "Quantidade: "

@ 02,08 get cNomePessoa picture "@!"            valid !Empty(cNomePessoa)
@ 03,13 get nQuantidade picture cPictureNumeros valid nQuantidade > 0
read

@ 04,01 to 24,79

nTamanhoFrase    := Len(Transform(nContador, cPictureNumeros) + " " + AllTrim(cNomePessoa))

do while nContador < nQuantidade 
   
   nTamanhoProximo := nColuna + (nTamanhoFrase * 2)
   
   if nLinha > 23
      
      if nTamanhoProximo >= 78
         
         @ 05,02 clear to 23,78

         nLinha  := 5
         nColuna := 2
   
      else

         nColuna += 1 + nTamanhoFrase   
         nLinha  := 5
      
      endif           
   
   endif
   
	@ nLinha++,nColuna say Transform(nContador++, cPictureNumeros) + " " + AllTrim(cNomePessoa) 

   Inkey(0.5)
   
enddo

@ 03,43 say "Pressione qualquer coisa para sair" color "R/D"

Inkey(0)