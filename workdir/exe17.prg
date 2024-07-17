setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

cPalavra          := Space(30)
cPalavraInvertida := Space(0)

@ 01,01 to 04,42

do while .t.
   @ 02,02 say "Escreva uma palavra e ela sera invertida"
   @ 03,02 say "Palavra: "

   @ 03,11 get cPalavra picture "@!" valid !Empty(cPalavra)
   read

   if LastKey() == 27
      
      nOpcao := Alert("Deseja Sair do Programa?",{"Sim","Nao"},"N/W")
      
      if nOpcao == 1
         exit
      
      else
         loop
      
      endif

   endif

   nQuantidadeLetras := Len(Alltrim(cPalavra))

   do while nQuantidadeLetras > 0
      cPalavraInvertida += SubStr(cPalavra,nQuantidadeLetras--,1)
   enddo

   @ 05,01 to 07,31

   @ 06,02 say cPalavraInvertida

   Inkey(0)
enddo
