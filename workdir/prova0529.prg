//Joao Pedro Ricardo
//
//

setmode (25,80)
set date British
set epoch to 1940
set scoreboard off

clear

// Picture
cPictureEscolha                    := "9"
cPictureString                     := "@!"
cPictureQuantidade                 := "99"
cPicturePreco                      := "@e 999.99"
cPictureTotal                      := "@e 99,999.99"
cPictureAtendimentos               := "@e 99,999,999"
cPictureRelatorio                  := "@e 999,999.99"

// Mesa 1
cCorMesa1                          := "N/G"
nAtendimentosMesaUm                := 0
nAtendimentosCanceladosMesaUm      := 0
nValorTotalMesaUm                  := 0
nValorMesaUm                       := 0
nValorCanceladoTotalMesaUm         := 0

// Mesa 2
cCorMesa2                          := "N/G"
nAtendimentosMesaDois              := 0
nAtendimentosCanceladosMesaDois    := 0
nValorTotalMesaDois                := 0
nValorMesaDois                     := 0
nValorCanceladoTotalMesaDois       := 0

// Atendentes
nTaxaDeServicoAtendenteUm          := 0
nTaxaDeServicoAtendenteDois        := 0

// Numero de Atendimentos
nAtendimentosTotaisMesa            := 0
nAtendimentosTotaisCanceladosMesa  := 0

// Valor total dos atendimentos
nValorTotalAtendimentos            := 0
nValorTotalAtendimentosCancelados  := 0

// Tickets medios
nTicketMedioMesaUm                 := 0
nTicketMedioMesaDois               := 0
nTicketMedioGeral                  := 0

// Taxa de Servico
nTaxaDeServicoTotal                := 0

do while .t.

   do while .t.

      clear

      nTotalVenda := 0

      nLinha      := 11
      nLinhaTotal := 12
      nCancelar   := 0

      nAtendente  := 0
      nMesa       := 0

      @ 00,00 to 24,79 double
      @ 02,01 to 02,78 double
      @ 04,01 to 04,78 double

      @ 01,27 say "RESTAURANTE - SG SISTEMAS"
      @ 03,34 say "ATENDIMENTO"
      @ 05,02 say "Mesa.....:"
      @ 06,02 say "Atendente:"
      @ 05,16 say "01" color cCorMesa1
      @ 05,20 say "02" color cCorMesa2

      @ 05,13 get nAtendente Picture cPictureEscolha Valid nAtendente > 0 .and. nAtendente < 3
      @ 06,13 get nMesa      Picture cPictureEscolha Valid nMesa > 0 .and. nMesa < 3
      read

      if LastKey() == 27

         nOpcao := Alert("Deseja Sair do Programa?",{"Sim","Nao"},"N/W")
         if nOpcao == 1
            exit

         else
            loop

         endif

      endif

      if (cCorMesa1 == "N/G" .and. nMesa == 1) .or. (cCorMesa2 == "N/G" .and. nMesa == 2)

         do while .t.

            cProduto       := Space(30)
            nQuantidade    := 0
            nPrecoUnitario := 0
            nTotalProduto  := 0

            @ 07,01 to 07,78 double
            @ 09,01 to 09,78 double

            @ 08,36 say "PEDIDO"
            @ 10,10 say "PRODUTO"
            @ 10,32 say "| QTD | PREC. UNIT |"
            @ 10,53 say "VALOR"

            @ nLinha,01 get cProduto       Picture cPictureString     Valid !Empty(cProduto)
            @ nLinha,34 get nQuantidade    Picture cPictureQuantidade Valid nQuantidade > 0
            @ nLinha,40 get nPrecoUnitario Picture cPicturePreco      Valid nPrecoUnitario > 0
            Read

            if LastKey() == 27

               nOpcao := Alert("Deseja?",{"Enviar pedido para producao","Continuar digitando","Abandonar digitacao"},"N/W")
               if nOpcao == 1

                  if nTotalVenda == 0
                     loop

                  else
                     Alert("Pedido Enviado Para Producao",,"N/W")
                     exit

                  endif

               elseif nOpcao == 3
                  nCancelar := 1
                  exit

               else
                  loop

               endif

            endif

            nTotalProduto := nQuantidade * nPrecoUnitario
            nTotalVenda   += nTotalProduto

            @ nLinhaTotal,52 clear to nLinhaTotal++,78

            @ nLinha++,52    say Transform(nTotalProduto,cPictureTotal) color "N/W"
            @ nLinhaTotal,52 say Transform(nTotalVenda,cPictureTotal)   color "N/W"

            if nLinhaTotal > 19
               @ 22,02 say "Dados cadastrados com sucesso!"
               @ 23,02 say "Pressione alguma tecla para continuar."

               Inkey(0)
               @ 11,01 clear to 23,78

               nLinha := 11
               nLinhaTotal := 12

            endif

         enddo

         if nCancelar == 1
            loop

         elseif nMesa == 1
            nValorMesaUm := nTotalVenda
            cCorMesa1 := "N/R"

         else
            nValorMesaDois := nTotalVenda
            cCorMesa2 := "N/R"

         endif

      elseif (cCorMesa1 == "N/R" .and. nMesa == 1) .or. (cCorMesa2 == "N/R" .and. nMesa == 2)

         nOpcao := Alert("Deseja?",{"Digitar outra mesa","Faturar Atendimento","Cancelar Atendimento"},"N/W")
         if nOpcao == 2

            do while .t.
               nTotalAPagar   := 0
               nTaxaDeServico := 0
               nValorPago     := 0
               nTroco         := 0
               cTipoPagamento := Space(1)

               if nMesa == 1
                  nTotalAPagar := nValorMesaUm

               else
                  nTotalAPagar := nValorMesaDois

               endif

               @ 07,01 to 07,78 double
               @ 09,01 to 09,78 double

               @ 08,34 say "FATURAMENTO"

               @ 10,01 say "[D]inheiro / [C]artao / Che[Q]ue:"
               @ 11,01 say "Total Pagar.....................:"
               @ 12,01 say "Valor recebido..................:"

               nOpcao := Alert("Aceita taxa de servico?",{"Sim","Nao"},"N/W")

               if nOpcao = 1
                  nTaxaDeServico := ((nTotalAPagar * 10) / 100)
                  nTotalAPagar   += nTaxaDeServico

               endif

               @ 11,34 say Transform(nTotalAPagar,cPictureTotal)

               @ 10,35 get cTipoPagamento Picture cPictureString Valid cTipoPagamento $ "DCQ"
               @ 12,34 get nValorPago     Picture cPictureTotal  Valid nValorPago > 0
               read

               if LastKey() == 27

                  nOpcao := Alert("Deseja?",{"Cancelar pagamento","Recomecar pagamento"},"N/W")
                  if nOpcao == 1
                     exit

                  else
                     loop

                  endif

               endif

               if nValorPago < nTotalAPagar

                  Alert("Valor recebido menor do que o valor total a pagar. Tente novamente!")
                  loop

               elseif nValorPago > nTotalAPagar
                  nTroco := nValorPago - nTotalAPagar
                  @ 13,01 say "Valor troco.....................:" + Transform(nTroco,cPictureTotal)

               endif

               @ 15,01 say "Pagamento efeutado com sucesso!"
               @ 16,01 say "Pressione alguma tecla para continuar."

               if nMesa == 1
                  nValorTotalMesaUm += nValorMesaUm
                  cCorMesa1 := "N/G"
                  nAtendimentosMesaUm++

               else
                  nValorTotalMesaDois += nValorMesaDois
                  cCorMesa2 := "N/G"
                  nAtendimentosMesaDois++

               endif

               if nAtendente == 1
                  nTaxaDeServicoAtendenteUm += nTaxaDeServico

               else
                  nTaxaDeServicoAtendenteDois += nTaxaDeServico

               endif

               Inkey(0)

               exit

            enddo
         elseif nOpcao == 3

            if nMesa == 1
               nValorCanceladoTotalMesaUm += nValorMesaUm
               cCorMesa1 := "N/G"
               nAtendimentosCanceladosMesaUm++

            else
               nValorCanceladoTotalMesaDois += nValorMesaDois
               cCorMesa2 := "N/G"
               nAtendimentosCanceladosMesaDois++

            endif

         else
            loop

         endif

      endif

   enddo

   // Numero de Atendimentos
   nAtendimentosTotaisMesa           := nAtendimentosMesaUm + nAtendimentosMesaDois
   nAtendimentosTotaisCanceladosMesa := nAtendimentosCanceladosMesaUm + nAtendimentosCanceladosMesaDois

   // Valor total dos atendimentos
   nValorTotalAtendimentos           := nValorTotalMesaUm + nValorTotalMesaDois
   nValorTotalAtendimentosCancelados := nValorCanceladoTotalMesaUm + nValorCanceladoTotalMesaDois

   // Tickets medios
   nTicketMedioMesaUm   := nValorTotalMesaUm / nAtendimentosMesaUm
   nTicketMedioMesaDois := nValorTotalMesaDois / nAtendimentosMesaDois
   nTicketMedioGeral    := nValorTotalAtendimentos / nAtendimentosTotaisMesa

   // Taxa de Servico
   nTaxaDeServicoTotal := nTaxaDeServicoAtendenteUm + nTaxaDeServicoAtendenteDois

   @ 03,01 clear to 23,78

   @ 04,01 to 04,78 double

   @ 03,30 say "RELATORIO GERENCIAL"
   @ 05,41 say "MESA 1"
   @ 05,54 say "MESA 2"
   @ 05,67 say "GERAL"
   @ 06,01 say "Quantidade de atendimentos...........: " + Transform(nAtendimentosMesaUm,cPictureAtendimentos) + "   " + Transform(nAtendimentosMesaDois,cPictureAtendimentos) + "   " + Transform(nAtendimentosTotaisMesa,cPictureAtendimentos)
   @ 07,01 say "Quantidade de atendimentos cancelados: " + Transform(nAtendimentosCanceladosMesaUm,cPictureAtendimentos) + "   " + Transform(nAtendimentosCanceladosMesaDois,cPictureAtendimentos) + "   " + Transform(nAtendimentosTotaisCanceladosMesa,cPictureAtendimentos)
   @ 08,01 say "Val. total de atendimentos...........: " + Transform(nValorTotalMesaUm,cPictureRelatorio) + "   " + Transform(nValorTotalMesaDois,cPictureRelatorio) + "   " + Transform(nValorTotalAtendimentos,cPictureRelatorio)
   @ 09,01 say "Val. total de atendimentos cancelados: " + Transform(nValorCanceladoTotalMesaUm,cPictureRelatorio) + "   " + Transform(nValorCanceladoTotalMesaDois,cPictureRelatorio) + "   " + Transform(nValorTotalAtendimentosCancelados,cPictureRelatorio)
   @ 10,01 say "Ticket Medio.........................: " + Transform(nTicketMedioMesaUm,cPictureRelatorio) + "   " + Transform(nTicketMedioMesaDois,cPictureRelatorio) + "   " + Transform(nTicketMedioGeral,cPictureRelatorio)
   @ 12,41 say "FUNC 1"
   @ 12,54 say "FUNC 2"
   @ 12,67 say "GERAL"
   @ 13,01 say "Valor a receber......................: " + Transform(nTaxaDeServicoAtendenteUm,cPictureRelatorio) + "   " + Transform(nTaxaDeServicoAtendenteDois,cPictureRelatorio) + "   " + Transform(nTaxaDeServicoTotal,cPictureRelatorio)

   @ 20,01 say "Pressione alguma tecla para continuar."
   Inkey(0)

   exit

enddo
