if nNotaTotalDisciplina < 6 .or. nFaltasTotaisDisciplina > 56
   cResultado        := "R"
   cCorResultado     := "R/D"
   cReprovadoMateria := Alltrim(cDisciplina)
   nReprovado++

elseif nFaltasTotaisDisciplina > 48

   @ 16,67 get cConselho1 picture cPictureTextos valid cConselho1 == "S" .or. cConselho1 == "N"
   @ 16,69 get cConselho2 picture cPictureTextos valid cConselho1 == "S" .or. cConselho1 == "N"
   @ 16,71 get cConselho3 picture cPictureTextos valid cConselho1 == "S" .or. cConselho1 == "N"
   read

   if ( cConselho1 == cConselho2 .and. cConselho1 == "N" ) .or.;
      ( cConselho3 == cConselho1 .and. cConselho1 == "N" ) .or.;
      ( cConselho2 = cConselho3  .and. cConselho2 == "N" )

      cResultado         := "R"
      cCorResultado      := "R/D"
      cReprovadoMateria  := Alltrim(cDisciplina)
      nReprovado++

   endif

endif

/***********************************************************************************************************/

nValorMensalidadeNovo := nValorMensalidade + ( ( ( nValorMensalidade * 15 ) / 100 ) * nReprovado )

//If para ver se ele reprovou ou ficou de dependencia
if cBolsista == "I"

   if nReprovado > 0
      cResultadoFinal := "Aluno Reprovado por ser bolsista e ter levado 1 ou mais dependencias"
      cMensalidade    := "Mensalidade continuara a mesma pois ao ser reprovado ele perde a bolsa"
   else

      nValorMensalidadeNovo -= (nValorMensalidade * 98) / 100
      cResultadoFinal := "O Aluno Bolsista Foi Aprovado sem Dependencias"
      cMensalidade    := "A mensalidade sera reduzida em 98%. Nova Mensalidade: R$ " + Alltrim(Str(nValorMensalidadeNovo))
   endif


elseif cBolsista == "P"

   if nReprovado = 1
      cResultadoFinal := "Aluno Parcialmente Bolsista Aprovado com Uma Dependencia em " + Alltrim(cReprovadoMateria)
      cMensalidade    := "A nova mensalidade e de R$  " + Alltrim(Str(nValorMensalidadeNovo))

   elseif nReprovado >= 2
      cResultadoFinal := "ALuno reprovado por ser bolsista parcial e ter levado 2 ou mais dependencias"
      cMensalidade    := "Mensalidade coninuara a mesma pois ao ser reprovado ele perder a bolsa"

   else

      nValorMensalidadeNovo -= (nValorMensalidade * 50) / 100

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
