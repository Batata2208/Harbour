
// João Pedro Ricardo
//
//

setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

//Variaveis
//============================================================================\\
// Utilitarios
cPictureTextos := "@!"
cPictureNotas  := "99.9"
cPictureFaltas := "99"
nLinha         := 12

nMaterias      := 1

//Resultado da nota e faltas do aluno
cCorResultado       := "G/D"
cResultado          := "A"
cResultadoFinal     := "O Aluno Foi Aprovado sem Dependencias"
cMensalidade        := "A mensalidade Continua a mesma"

nReprovado            := 0
nValorMensalidadeNovo := 0

cReprovadoMateria := ""

nConselhoReprovou := 0
cConselho1        := Space(1)
cConselho2        := Space(1)
cConselho3        := Space(1)

//Dados instituição
cNomeInstituicao     := "UniSG - Universidade unida da SG."
cEnderecoInstituicao := "Aquela Rua Numero 560"

cDataAtual           := DToC(Date())

//Dados Aluno
cNomeAluno           := Space(50)
cCursoAluno          := Space(20)
cBolsista            := Space(1)

nSerie                := 0
nAnoLetivo            := 0
nValorMensalidade     := 0

dDataNascimentoAluno := CToD("")

//Dados Disciplinas Aluno
cDisciplina     := Space(15)

//Nota Diciplina
nNotaDisciplinaBimestre1 := 0
nNotaDisciplinaBimestre2 := 0
nNotaDisciplinaBimestre3 := 0
nNotaDisciplinaBimestre4 := 0

nNotaTotalDisciplina := 0

//Faltas Diciplina
nFaltasDisciplinaBimestre1 := 0
nFaltasDisciplinaBimestre2 := 0
nFaltasDisciplinaBimestre3 := 0
nFaltasDisciplinaBimestre4 := 0

nFaltasTotaisDisciplina := 0

nSaida := 0

//============================================================================\\
//=====================================================================================================================================================================\\

do while .t.

   @ 00,01 to 06,79

   @ 01,02 say cNomeInstituicao + " Endereco: " + cEnderecoInstituicao
   @ 02,62 say "Data: " + cDataAtual

   @ 02,02 say "Nome: "
   @ 04,02 say "Mensalidade: "
   @ 03,02 say "Data de Nascimento: "
   @ 03,33 say "Curso: "
   @ 04,26 say "serie: "
   @ 04,36 say "Ano Letivo: "
   @ 05,02 say "Bolsista Integral [I] Bolsista Parcial [P] Nao Bolsista [N] "

   @ 02,07 get cNomeAluno           picture cPictureTextos  valid !Empty(cNomeAluno)
   @ 03,22 get dDataNascimentoAluno                         Valid !Empty(dDataNascimentoAluno) .and. dDataNascimentoAluno < Date()
   @ 03,40 get cCursoAluno          picture cPictureTextos  Valid !Empty(cCursoAluno)
   @ 04,15 get nValorMensalidade    picture "@e 999,999.99" valid nValorMensalidade > 0
   @ 04,33 get nSerie               picture "99"            valid nSerie > 0
   @ 04,48 get nAnoLetivo           picture "9999"          valid nAnoLetivo > 2000 .and. nAnoLetivo > Year(dDataNascimentoAluno)
   @ 05,62 get cBolsista            picture cPictureTextos  valid cBolsista $ "IPN"
   read

   if LastKey() == 27
      nOpcao := Alert("Deseja Sair do Programa?",{"Sim","Nao"},"N/W")    
      if nOpcao == 1
         exit
      else
         loop     
      endif
    endif

   @ 07,01 to 19,79

   @ 09,02 to 09,78
   @ 11,02 to 11,78
   @ 13,02 to 13,78
   @ 15,02 to 15,78
   @ 17,02 to 17,78

   @ 08,17 to 18,17
   @ 08,25 to 18,25
   @ 08,33 to 18,33
   @ 08,41 to 18,41
   @ 08,49 to 18,49
   @ 08,61 to 18,61

   @ 08,20 say "1 Bi"
   @ 08,28 say "2 Bi"
   @ 08,36 say "3 Bi"
   @ 08,44 say "4 Bi"
   @ 08,51 say "Resultado"
   @ 08,66 say "Conselho"
   @ 10,02 say " Materia "
   @ 10,21 say "N/F"
   @ 10,29 say "N/F"
   @ 10,37 say "N/F"
   @ 10,45 say "N/F"
   @ 10,53 say "NT/FT"
   @ 10,67 say "S ou N"

   //=====================================================================================================================================================================\\
   //Disciplinas
   do while nMaterias < 5
      //Resetando as variaveis ( preparando para um do while )
      cCorResultado := "G/D"
      cResultado    := "A"

      nConselhoReprovou := 0
      cConselho1        := Space(1)
      cConselho2        := Space(1)
      cConselho3        := Space(1)

      cDisciplina := Space(15)

      //Notas Diciplina
      nNotaDisciplinaBimestre1 := 0
      nNotaDisciplinaBimestre2 := 0
      nNotaDisciplinaBimestre3 := 0
      nNotaDisciplinaBimestre4 := 0

      nNotaTotalDisciplina := 0

      //Faltas Diciplina
      nFaltasDisciplinaBimestre1 := 0
      nFaltasDisciplinaBimestre2 := 0
      nFaltasDisciplinaBimestre3 := 0
      nFaltasDisciplinaBimestre4 := 0

      nFaltasTotaisDisciplina := 0

      @ nLinha,02 get cDisciplina                picture cPictureTextos valid !Empty(cDisciplina)
      @ nLinha,18 get nNotaDisciplinaBimestre1   picture cPictureNotas  valid nNotaDisciplinaBimestre1 >= 0 .and. nNotaDisciplinaBimestre1 <= 10.0
      @ nLinha,23 get nFaltasDisciplinaBimestre1 picture cPictureFaltas valid nFaltasDisciplinaBimestre1 >= 0 .and. nFaltasDisciplinaBimestre1 <= 61
      @ nLinha,26 get nNotaDisciplinaBimestre2   picture cPictureNotas  valid nNotaDisciplinaBimestre2 >= 0 .and. nNotaDisciplinaBimestre2 <= 10.0
      @ nLinha,31 get nFaltasDisciplinaBimestre2 picture cPictureFaltas valid nFaltasDisciplinaBimestre2 >= 0 .and. nFaltasDisciplinaBimestre2 <= 61
      @ nLinha,34 get nNotaDisciplinaBimestre3   picture cPictureNotas  valid nNotaDisciplinaBimestre3 >= 0 .and. nNotaDisciplinaBimestre3 <= 10.0
      @ nLinha,39 get nFaltasDisciplinaBimestre3 picture cPictureFaltas valid nFaltasDisciplinaBimestre3 >= 0 .and. nFaltasDisciplinaBimestre3 <= 61
      @ nLinha,42 get nNotaDisciplinaBimestre4   picture cPictureNotas  valid nNotaDisciplinaBimestre4 >= 0 .and. nNotaDisciplinaBimestre4 <= 10.0
      @ nLinha,47 get nFaltasDisciplinaBimestre4 picture cPictureFaltas valid nFaltasDisciplinaBimestre4 >= 0 .and. nFaltasDisciplinaBimestre4 <= 61
      read
      
      if LastKey() == 27
      nOpcao := Alert("Deseja Cancelar esse Boletim?",{"Sim","Nao"},"N/W")
      
      if nOpcao == 1
         exit
         nSaida := 1
      else
         loop
      
      endif

      endif
      
      nFaltasTotaisDisciplina := nFaltasDisciplinaBimestre1 + nFaltasDisciplinaBimestre2 + nFaltasDisciplinaBimestre3 + nFaltasDisciplinaBimestre4
      nNotaTotalDisciplina    := (nNotaDisciplinaBimestre1 + nNotaDisciplinaBimestre2 + nNotaDisciplinaBimestre3 + nNotaDisciplinaBimestre4) / 4
      
      if nNotaTotalDisciplina < 6 .or. nFaltasTotaisDisciplina > 56
         cResultado        := "R"
         cCorResultado     := "R/D"
         cReprovadoMateria := Alltrim(cDisciplina)
         nReprovado++
      
      elseif nFaltasTotaisDisciplina > 48
         @ nLinha,67 get cConselho1 picture cPictureTextos valid cConselho1 $ "SN"
         @ nLinha,69 get cConselho2 picture cPictureTextos valid cConselho2 $ "SN"
         @ nLinha,71 get cConselho3 picture cPictureTextos valid cConselho3 $ "SN"
         read
         
         if LastKey() == 27
            nOpcao := Alert("Deseja Cancelar esse Boletim?",{"Sim","Nao"},"N/W")
            
            if nOpcao == 1
               exit
               nSaida := 1
            else
               loop
            
            endif
      
         endif

         if (cConselho1 == cConselho2 .and. cConselho1 == "N") .or. (cConselho1 == cConselho3 .and. cConselho1 == "N") .or. (cConselho2 == cConselho3 .and. cConselho2 == "N")
            cResultado         := "R"
            cCorResultado      := "R/D"
            cReprovadoMateria  := Alltrim(cDisciplina)
            nReprovado++
         endif
      
      endif

      @ nLinha,60 say cResultado                            color cCorResultado
      @ nLinha,50 say Alltrim(Str(nNotaTotalDisciplina))    color cCorResultado
      @ nLinha,56 say Alltrim(Str(nFaltasTotaisDisciplina)) color cCorResultado

      nLinha += 2
      nMaterias++

   enddo

   //=============================================================================================================================\\
   if nSaida = 1
      loop
      nSaida := 0
   endif

   nValorMensalidadeNovo := nValorMensalidade + ( ( ( nValorMensalidade * 15 ) / 100 ) * nReprovado )

   //If para ver se ele reprovou ou ficou de dependencia
   if cBolsista == "I"

      if nReprovado >= 1
         cResultadoFinal := "Aluno Reprovado por ser bolsista e ter levado 1 ou mais dependencias"
         cMensalidade    := "Mensalidade continuara a mesma pois ao ser reprovado ele perde a bolsa"

      else
      nValorMensalidadeNovo -= (nValorMensalidade * 98) / 100
      cResultadoFinal := "O Aluno Bolsista Foi Aprovado sem Dependencias"
      cMensalidade    := "A mensalidade sera reduzida em 98%. Nova Mensalidade: R$ " + Alltrim(Str(nValorMensalidadeNovo))

      endif

   elseif cBolsista == "P"

      nValorMensalidadeNovo -= (nValorMensalidade * 50) / 100

      if nReprovado = 1
         cResultadoFinal := "Aluno Parcialmente Bolsista Aprovado com Uma Dependencia em " + Alltrim(cReprovadoMateria)
         cMensalidade    := "A nova mensalidade e de R$  " + Alltrim(Str(nValorMensalidadeNovo))

      elseif nReprovado >= 2
         cResultadoFinal := "ALuno reprovado por ser bolsista parcial e ter levado 2 ou mais dependencias"
         cMensalidade    := "Mensalidade coninuara a mesma pois ao ser reprovado ele perder a bolsa"

      else
         cResultadoFinal := "O Aluno Parcialmente Bolsista Foi Aprovado sem Dependencias"
         cMensalidade    := "A mensalidade sera reduzida em 98%. Nova Mensalidade: R$ " + Alltrim(Str(nValorMensalidadeNovo))

      endif
   elseif cBolsista == "N"

      if nReprovado = 1
         cResultadoFinal := "Aluno Aprovado com Uma Dependencia em " + Alltrim(cReprovadoMateria)
         cMensalidade    := "A nova mensalidade e de R$  " + Alltrim(Str(nValorMensalidadeNovo))

      elseif nReprovado = 2
         cResultadoFinal := "Aluno Aprovado com Uma Dependencia em " + Alltrim(cReprovadoMateria)
         cMensalidade := "A nova mensalidade e de R$ " + Alltrim(Str(nValorMensalidadeNovo))

      elseif nReprovado >= 3
         cResultadoFinal := "Aluno esta Reprovado por ter 3 ou mais disciplina de depencia"
         cMensalidade    := "Mesalidade nao calculado por que o aluno esta reprovado"

      endif

   endif

   @ 20,01 to 23,79

   @ 21,02 say cResultadoFinal
   @ 22,02 say cMensalidade

   Inkey(0)    
enddo