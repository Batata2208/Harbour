setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

cPictureGets := "@e 999,999.99"
cPictureSay  := "@e 999,999,999,999.99999"

do while .t.
   
   clear

   nNumeroUm     := 0
   nNumeroDois   := 0

   @ 01,01 to 10,46

   @ 02,02 say " Digite os numeros a serem calculados"
   @ 03,02 say " Primeiro numero e.: "
   @ 04,02 say " Segundo  numero e.: "
 
   @ 03,22 get nNumeroUm   picture cPictureGets valid nNumeroUm >= 0
   @ 04,22 get nNumeroDois picture cPictureGets valid nNumeroDois >= 0
   read

   if LastKey() == 27
      nOpcao := Alert( "Deseja Sair do Programa?", {"Sim","Nao"}, "N/W" )
      if nOpcao == 1
         exit
      else
         loop
      endif
   endif

   nNumeroSomado       := nNumeroUm + nNumeroDois
   nNumeroSubtraido    := nNumeroUm - nNumeroDois
   nNumeroDividido     := nNumeroUm / nNumeroDois
   nNumeroMultiplicado := nNumeroUm * nNumeroDois
   
   @ 06,02 say " A soma deles e......: " + Transform( nNumeroSomado, cPictureSay )
   @ 07,02 say " A subtracao deles e.: " + Transform( nNumeroSubtraido, cPictureSay )
   @ 08,02 say " O produto deles e...: " + Transform( nNumeroMultiplicado, cPictureSay )
   @ 09,02 say " A divisao deles e...: " + Transform( nNumeroDividido, cPictureSay )
   Inkey(0)

enddo
