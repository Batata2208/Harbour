//João Pedro Ricardo
//
//

setmode (25,80)
set date British
set epoch to 1940
set scoreboard off

clear

cPictureString := "@!"

do while .t.

   clear

   cNome             := Space(30)
   dDataDeNascimento := CToD("")
   dData             := Date()

   @ 02,02 say "Nome...............: "
   @ 03,02 say "Data de nascimento.: "

   @ 02,23 get cNome             Picture cPictureString valid !Empty(cNome)
   @ 03,23 get dDataDeNascimento                        valid !Empty(dDataDeNascimento)
   Read

   if LastKey() == 27
      nOpcao := Alert("Deseja Sair do Programa?",{"Sim","Nao"},"N/W") 
      if nOpcao == 1
         exit 
      else
         loop 
      endif
   endif

   //Nascimento  

   nAnoDataHoje         := Year(dData)
   nDiaDataHoje         := Day(dData)
   nMesDataHoje         := Month(dData)
   nDiaDaSemanaDataHoje := DoW(dData)


   nAnoDataDeNascimento         := Year(dDataDeNascimento)
   nDiaDataDeNascimento         := Day(dDataDeNascimento)
   nMesDataDeNascimento         := Month(dDataDeNascimento)
   nDiaDaSemanaDataDeNascimento := DoW(dDataDeNascimento)

   if nDiaDaSemanaDataDeNascimento = 1
      cDiaDaSemanaNascimento := "Domingo"
   
   elseif nDiaDaSemanaDataDeNascimento = 2
      cDiaDaSemanaNascimento := "Segunda-Feira"
   
   elseif nDiaDaSemanaDataDeNascimento = 3
      cDiaDaSemanaNascimento := "Terca-Feira"
   
   elseif nDiaDaSemanaDataDeNascimento = 4
      cDiaDaSemanaNascimento := "Quarta-Feira"
   
   elseif nDiaDaSemanaDataDeNascimento = 5
      cDiaDaSemanaNascimento := "Quinta-Feira"
   
   elseif nDiaDaSemanaDataDeNascimento = 6
      cDiaDaSemanaNascimento := "Sexta-Feira"
   
   elseif nDiaDaSemanaDataDeNascimento = 7
      cDiaDaSemanaNascimento := "Sabado"
   
   endif

   if nMesDataDeNascimento = 1
      cMesDeNascimento := "Janeiro"
   
   elseif nMesDataDeNascimento = 2
      cMesDeNascimento := "Fevereiro"
   
   elseif nMesDataDeNascimento = 3
      cMesDeNascimento := "Marco"
   
   elseif nMesDataDeNascimento = 4
      cMesDeNascimento := "Abril"
   
   elseif nMesDataDeNascimento = 5
      cMesDeNascimento := "Maio"
   
   elseif nMesDataDeNascimento = 6
      cMesDeNascimento := "Junho"
   
   elseif nMesDataDeNascimento = 7
      cMesDeNascimento := "Julho"
   
   elseif nMesDataDeNascimento = 8
      cMesDeNascimento := "Agosto"
   
   elseif nMesDataDeNascimento = 9
      cMesDeNascimento := "Setembro"
   
   elseif nMesDataDeNascimento = 10
      cMesDeNascimento := "Outubro"
   
   elseif nMesDataDeNascimento = 11
      cMesDeNascimento := "Novembro"
   
   elseif nMesDataDeNascimento = 12
      cMesDeNascimento := "Dezembro"
   
   endif


      nAnoIdade         := nAnoDataHoje - nAnoDataDeNascimento 
      nDiaIdade         := nDiaDataHoje - nDiaDataDeNascimento
      nMesIdade         := nMesDataHoje - nMesDataDeNascimento

      if nMesIdade < 0
         nMesIdade += 12
         nAnoIdade--
      endif


      if nDiaIdade < 0

         if nMesIdade = 1
               nMesIdade -= 1
               nDiaIdade += 31

         elseif nMesIdade = 2

               nMesIdade -= 1
               nDiaIdade += 28
         
         elseif nMesIdade = 3
               nMesIdade -= 1
               nDiaIdade += 31
         
         elseif nMesIdade = 4
               nMesIdade -= 1
               nDiaIdade += 30

         
         elseif nMesIdade = 5

               nMesIdade -= 1
               nDiaIdade += 31

         
         elseif nMesIdade = 6

               nMesIdade -= 1
               nDiaIdade += 30
         
         
          elseif nMesIdade = 7
         
               nMesIdade -= 1
               nDiaIdade += 31

         
         elseif nMesIdade = 8

               nMesIdade -= 1
               nDiaIdade += 31
         

         elseif nMesIdade = 9
         
               nMesIdade -= 1
               nDiaIdade += 30

         
         elseif nMesIdade = 10
         
               nMesIdade -= 1
               nDiaIdade += 31

         elseif nMesIdade = 11
         
               nMesIdade -= 1
               nDiaIdade += 30

         
         elseif nMesIdade = 12  
               nMesIdade -= 1
               nDiaIdade += 31
         endif

         if nMesIdade = 0
            nMesIdade += 11
         endif

      endif

      nDiaProximoAniversario         := nDiaDataDeNascimento - nDiaDataHoje
      nMesProximoAniversario         := nMesDataDeNascimento - nMesDataHoje 

      if nMesProximoAniversario < 0
         nMesProximoAniversario += 12
      endif

      if nDiaProximoAniversario <= 0

         if nMesProximoAniversario = 1
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 31
         elseif nMesProximoAniversario = 2

               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 28
         
         elseif nMesProximoAniversario = 3
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 31
         
         elseif nMesProximoAniversario = 4
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 30

         
         elseif nMesProximoAniversario = 5

               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 31

         
         elseif nMesProximoAniversario = 6

               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 30
         
         
          elseif nMesProximoAniversario = 7
         
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 31

         
         elseif nMesProximoAniversario = 8

               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 31
         

         elseif nMesProximoAniversario = 9
         
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 30

         
         elseif nMesProximoAniversario = 10
         
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 31

         elseif nMesProximoAniversario = 11
         
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 30

         
         elseif nMesProximoAniversario = 12  
               nMesProximoAniversario -= 1
               nDiaProximoAniversario += 31
         endif

         if nMesProximoAniversario = 0
            nMesProximoAniversario += 11
         endif

      endif

      if nMesProximoAniversario = 0
         nMesProximoAniversario += 11
      endif
      

   if nMesDataDeNascimento = 1 .and. nDiaDataDeNascimento >= 21 .or. nMesDataDeNascimento = 2 .and. nDiaDataDeNascimento <= 18
      cSigno := "Aquario"
   
   elseif nMesDataDeNascimento = 2 .and. nDiaDataDeNascimento >= 19 .or. nMesDataDeNascimento = 3 .and. nDiaDataDeNascimento <= 20
      cSigno := "Peixes"
   
   elseif nMesDataDeNascimento = 3 .and. nDiaDataDeNascimento >= 21 .or. nMesDataDeNascimento = 4 .and. nDiaDataDeNascimento <= 20
      cSigno := "Aries"
   
   elseif nMesDataDeNascimento = 4 .and. nDiaDataDeNascimento >= 21 .or. nMesDataDeNascimento = 5 .and. nDiaDataDeNascimento <= 20
      cSigno := "Touro"
   
   elseif nMesDataDeNascimento = 5 .and. nDiaDataDeNascimento >= 21 .or. nMesDataDeNascimento = 6 .and. nDiaDataDeNascimento <= 20
      cSigno := "Gemeos"
   
   elseif nMesDataDeNascimento = 6 .and. nDiaDataDeNascimento >= 21 .or. nMesDataDeNascimento = 7 .and. nDiaDataDeNascimento <= 22
      cSigno := "cancer"
   
   elseif nMesDataDeNascimento = 7 .and. nDiaDataDeNascimento >= 23 .or. nMesDataDeNascimento = 8 .and. nDiaDataDeNascimento <= 22
      cSigno := "Leao"
   
   elseif nMesDataDeNascimento = 8 .and. nDiaDataDeNascimento >= 23 .or. nMesDataDeNascimento = 9 .and. nDiaDataDeNascimento <= 22
      cSigno := "Virgem"
   
   elseif nMesDataDeNascimento = 9 .and. nDiaDataDeNascimento >= 23 .or. nMesDataDeNascimento = 10 .and. nDiaDataDeNascimento <= 22
      cSigno := "Libra"
   
   elseif nMesDataDeNascimento = 10 .and. nDiaDataDeNascimento >= 23 .or. nMesDataDeNascimento = 11 .and. nDiaDataDeNascimento <= 21
      cSigno := "Escorpiao"
   
   elseif nMesDataDeNascimento = 11 .and. nDiaDataDeNascimento >= 22 .or. nMesDataDeNascimento = 12 .and. nDiaDataDeNascimento <= 21
      cSigno := "Sagitario"
   
   elseif nMesDataDeNascimento = 12 .and. nDiaDataDeNascimento >= 22 .or. nMesDataDeNascimento = 1 .and. nDiaDataDeNascimento <= 20
      cSigno := "Capricornio"
   
   endif

   nDataCalendario := nAnoDataHoje + 1

   if nAnoIdade = nAnoDataDeNascimento - nAnoDataHoje
      nDataCalendario := nAnoDataHoje
   endif

   dProximoAniversario := CToD(Alltrim(Str(nDiaDataDeNascimento)) + "/" + Alltrim(Str(nMesDataDeNascimento)) + "/" + Alltrim(Str(nDataCalendario))) 
   dMesDoCalendario    := CToD ("01/" + Alltrim(Str(nMesDataDeNascimento)) + "/" + Alltrim(Str(nDataCalendario)))

   nDiaDaSemanaProximoAniversario := DoW(dProximoAniversario)
   nDiaDaSemanaDoCalendario       := DoW(dMesDoCalendario)
   nMesDoCalendario               := Month(dMesDoCalendario)

   if nDiaDaSemanaProximoAniversario = 1
      cDiaDaSemanaProximoAniversario := "Domingo"
   
   elseif nDiaDaSemanaProximoAniversario = 2
      cDiaDaSemanaProximoAniversario := "Segunda-Feira"
   
   elseif nDiaDaSemanaProximoAniversario = 3
      cDiaDaSemanaProximoAniversario := "Terca-Feira"
   
   elseif nDiaDaSemanaProximoAniversario = 4
      cDiaDaSemanaProximoAniversario := "Quarta-Feira"
   
   elseif nDiaDaSemanaProximoAniversario = 5
      cDiaDaSemanaProximoAniversario := "Quinta-Feira"
   
   elseif nDiaDaSemanaProximoAniversario = 6
      cDiaDaSemanaProximoAniversario := "Sexta-Feira"
   
   elseif nDiaDaSemanaProximoAniversario = 7
      cDiaDaSemanaProximoAniversario := "Sabado"
   
   endif

   if nDiaDaSemanaDoCalendario = 1
      nColuna := 30

   elseif nDiaDaSemanaDoCalendario = 2
      nColuna := 33

   elseif nDiaDaSemanaDoCalendario = 3
      nColuna := 36

   elseif nDiaDaSemanaDoCalendario = 4
      nColuna := 39

   elseif nDiaDaSemanaDoCalendario = 5
      nColuna := 42

   elseif nDiaDaSemanaDoCalendario = 6
      nColuna := 45

   elseif nDiaDaSemanaDoCalendario = 7
      nColuna := 48

   endif

   if nMesDoCalendario = 1
      nCalendario := 31

   elseif nMesDoCalendario = 2
      nCalendario := 28
   
   elseif nMesDoCalendario = 3
      nCalendario := 31
   
   elseif nMesDoCalendario = 4
      nCalendario := 30
   
   elseif nMesDoCalendario = 5
      nCalendario := 31
   
   elseif nMesDoCalendario = 6
      nCalendario := 30
   
   elseif nMesDoCalendario = 7
      nCalendario := 31
   
   elseif nMesDoCalendario = 8
      nCalendario := 31
   
   elseif nMesDoCalendario = 9
      nCalendario := 30
   
   elseif nMesDoCalendario = 10
      nCalendario := 31
   
   elseif nMesDoCalendario = 11
      nCalendario := 30
   
   elseif nMesDoCalendario = 12
      nCalendario := 31
   
   endif

   nContador := 1
   nLinha    := 11
   cCor      := "W/N"

   clear    

   @ 02,02 say "Nascido em................: " + Alltrim(Str(nDiaDataDeNascimento)) + " de " + cMesDeNascimento + " de " + Alltrim(Str(nAnoDataDeNascimento)) 
   @ 03,02 say "Nascido em uma............: " + cDiaDaSemanaNascimento
   @ 04,02 say "Idade de..................: " + Alltrim(Str(nAnoIdade)) + " anos " + Alltrim(Str(nMesIdade)) + " meses e " + Alltrim(Str(nDiaIdade)) + " dias"
   @ 05,02 say "Signo.....................: " + cSigno
   @ 06,02 say "Proximo aniversario em....: " + Alltrim(Str(nMesProximoAniversario)) + " meses " + Alltrim(Str(nDiaProximoAniversario)) + " dias "
   @ 07,02 say "Proximo aniversario em uma: " + cDiaDaSemanaProximoAniversario
   @ 08,02 say "Calendario................: " + cMesDeNascimento + " de " + Alltrim(Str(nDataCalendario))
   
   @ 10,31 say "D  S  T  Q  Q  S  S"

   do while nContador < nCalendario

      if nContador = Day(dProximoAniversario)
         cCor := "N/R"
      else
         cCor := "W/N"
      endif

      @ nLinha,nColuna say Transform(nContador++,"99") color cCor

      nColuna += 3

      if nColuna >= 50
         nColuna := 30
         nLinha++
      endif

   enddo

   if nDiaDataHoje = nDiaDataDeNascimento .and. nMesDataHoje = nMesDataDeNascimento
      @ 20,02 say "                       Parabens " + Alltrim(cNome) + " hoje e seu aniversario                 " color "W/G"
   endif

   Inkey(0)

enddo