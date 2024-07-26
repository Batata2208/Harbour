//Joao Pedro Ricardo
//
// Descoberta

setmode (25,80)
set date British
set epoch to 1940
set scoreboard off

clear

nLinhaEmbarcacaoUm  := 1
nColunaEmbarcacaoUm := 1

nLinhaEmbarcacaoDois  := 1
nColunaEmbarcacaoDois := 5

nLinhaEmbarcacaoTres  := 3
nColunaEmbarcacaoTres := 6

nLinhaEmbarcacaoQuatro  := 4
nColunaEmbarcacaoQuatro := 2

nLinhaEmbarcacaoCinco  := 5
nColunaEmbarcacaoCinco := 5

nLinhaEmbarcacaoSeis  := 6
nColunaEmbarcacaoSeis := 3

nAbandonar := 0

cPictureNumeros      := "99"
cPicturePegarNumeros := "9"

do while .t.

   set color to "W/N"

   nNumeroDeAcertos            := 0
   nNumeroDeErros              := 0
   nNumeroDeJogadasRealizadas  := 0
   nNumeroDeJogadasRestantes   := 20

   cNumerosUsados  := Space(0)
  
   @ 00,00 to 24,78 double
   @ 02,01 to 02,77 double
   @ 04,01 to 04,15 double
   @ 07,01 to 07,15 double
   @ 09,01 to 09,15 double
   @ 03,16 to 23,16 double
   
   @ 01,29 say "DESCOBERTA NAVAL"
   @ 03,05 say "JOGADA"
   @ 05,01 say "LINHA.....:"
   @ 06,01 say "COLUNA....:"
   @ 08,04 say "JOGADAS"
   @ 10,01 say "RESTANTE..: " + Transform(nNumeroDeJogadasRestantes,cPictureNumeros)
   @ 11,01 say "REALIZADAS: " + Transform(nNumeroDeJogadasRealizadas,cPictureNumeros)
   @ 12,01 say "ACERTOS...: " + Transform(nNumeroDeAcertos,cPictureNumeros)
   @ 13,01 say "ERROS.....: " + Transform(nNumeroDeErros,cPictureNumeros)

   @ 04,27 say "1"
   @ 04,37 say "2"
   @ 04,46 say "3"
   @ 04,55 say "4"
   @ 04,64 say "5"
   @ 04,73 say "6"

   @ 07,19 say "1"
   @ 10,19 say "2"
   @ 13,19 say "3"
   @ 16,19 say "4"
   @ 19,19 say "5"
   @ 22,19 say "6"

   set color to "B/B"

   @ 06,24 clear to 23,77 

   do while .t.
      
      set color to "W/N"

      nPegarNumeroDaLinha  := 0
      nPegarNumeroDaColuna := 0
      
      nLinhaPintar         := 6
      nLinhaPararDePintar  := 0

      nColunaPintar        := 24
      nColunaPararDePintar := 0

      cCorResposta  := "W/W"
      
      @ 10,13 say Transform(nNumeroDeJogadasRestantes,cPictureNumeros)
      @ 11,13 say Transform(nNumeroDeJogadasRealizadas,cPictureNumeros)
      @ 12,13 say Transform(nNumeroDeAcertos,cPictureNumeros)
      @ 13,13 say Transform(nNumeroDeErros,cPictureNumeros)
      
      @ 05,13 get nPegarNumeroDaLinha Picture cPicturePegarNumeros Valid nPegarNumeroDaLinha > 0 .and. nPegarNumeroDaLinha < 7
      @ 06,13 get nPegarNumeroDaColuna Picture cPicturePegarNumeros Valid nPegarNumeroDaColuna > 0 .and. nPegarNumeroDaColuna < 7
      read

      if LastKey() == 27
         nOpcao := Alert("Abandonar Jogo?",{"Sim","Nao"},"N/W")
         if nOpcao == 1
            nAbandonar := 1
            exit
         else
            loop
         endif
      endif
  
      nLinhaPintar  += (3 * (nPegarNumeroDaLinha - 1))      
      nColunaPintar += (9 * (nPegarNumeroDaColuna - 1)) 

      nLinhaPararDePintar  := nLinhaPintar + 2
      nColunaPararDePintar := nColunaPintar + 8

      cVerifica := Alltrim(Str(nPegarNumeroDaLinha)) + Alltrim(Str(nPegarNumeroDaColuna))

      if cVerifica $ cNumerosUsados
         alert("Coordenadas ja utilizadas!")
         loop
      endif

      if (nPegarNumeroDaLinha = nLinhaEmbarcacaoUm .and. nPegarNumeroDaColuna = nColunaEmbarcacaoUm) .or. (nPegarNumeroDaLinha = nLinhaEmbarcacaoDois .and. nPegarNumeroDaColuna = nColunaEmbarcacaoDois) .or. (nPegarNumeroDaLinha = nLinhaEmbarcacaoTres .and. nPegarNumeroDaColuna = nColunaEmbarcacaoTres) .or. (nPegarNumeroDaLinha = nLinhaEmbarcacaoQuatro .and. nPegarNumeroDaColuna = nColunaEmbarcacaoQuatro) .or. (nPegarNumeroDaLinha = nLinhaEmbarcacaoCinco .and. nPegarNumeroDaColuna = nColunaEmbarcacaoCinco) .or. (nPegarNumeroDaLinha = nLinhaEmbarcacaoSeis .and. nPegarNumeroDaColuna = nColunaEmbarcacaoSeis)
         cCorResposta  := "R/R"
         Alert("Encontrou")
         nNumeroDeAcertos++
      else
         Alert("Errou")
         nNumeroDeErros++
      endif

      set color to (cCorResposta)

      @ nLinhaPintar,nColunaPintar clear to nLinhaPararDePintar,nColunaPararDePintar
      cNumerosUsados += cVerifica + " "

      nNumeroDeJogadasRealizadas++
      nNumeroDeJogadasRestantes--
      
      if nNumeroDeAcertos + nNumeroDeJogadasRestantes < 6
         Alert("Voce perdeu! Tentavivas restantes nao sao suficientes para desvendar todas as embarcacoes")
         exit
      endif

      if nNumeroDeAcertos = 6
         Alert("Voce ganhou. Parabens!")
         exit
      endif

   enddo

   if nAbandonar = 0
      nOpcao := Alert("Jogar novamente?",{"Sim","Nao"})
      if nOpcao == 1
         loop
      endif
   endif
   
   exit
enddo