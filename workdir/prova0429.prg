// João Pedro Ricardo
//

setmode (25,80)
set date British
set epoch to 1940
set scoreboard off

clear

nOrdemDeServico := 1

cPictureString     := "@!"
cPicturePreco      := "@e 9,999,999.99"
cPictureDesconto   := "@e 999.99"
cPictureTotal      := "@e 999,999,999.99"
cPictureComissao   := "@e 999.99"
cPictureQuantidade := "999"

do while .t.

   clear

   nEscolhaAnterior := 0

   nTotalDaOrdemDeServico      := 0
   nLinha                      := 11
   nCancelar                   := 0
   nComissaoDoTecnicoTotal     := 0

   cCorGarantiaProduto := "R/N"
   cCorGarantiaServico := "R/N"
   
   cNomeCliente           := Space(50)
   cNomeTecnico           := Space(40)
   cDescricaoEquipamento  := Space(50)
   dDataDaOrdemDeServico  := CToD("")
   dDataDaCompra          := CToD("")

   nQuantidadeDeProdutos := 0
   nQuantidadeDeServicos := 0
  
   nCNPJDaEmpresa         := 0
   nNumeroDaNotaDeServico := 0
   dDataDaNota            := CToD("")



   @ 01,02 say "Ordem De Servico: " + Alltrim(Transform(nOrdemDeServico,"@e 999,999"))
   @ 02,02 say "Nome Do Cliente.: "
   @ 03,02 say "Nome Do Tecnico.: "
   @ 04,02 say "Data Da Ordem de servico: "
   @ 04,41 say "Data De Compra: "
   @ 05,02 say "Descricao do Equipamento: "

   @ 02,20 get cNomeCliente          Picture cPictureString Valid !Empty(cNomeCliente)
   @ 03,20 get cNomeTecnico          Picture cPictureString Valid !Empty(cNomeTecnico)
   @ 04,28 get dDataDaOrdemDeServico                        Valid dDataDaOrdemDeServico <= Date()
   @ 04,57 get dDataDaCompra                                Valid dDataDaCompra <= dDataDaOrdemDeServico
   @ 05,28 get cDescricaoEquipamento Picture cPictureString Valid !Empty(cDescricaoEquipamento)
   read

   if LastKey() == 27
      nOpcao := Alert("Deseja Sair do Programa?",{"Sim","Nao"},"N/W")     
      if nOpcao == 1
         exit    
      else
         loop   
      endif 
   endif 

   nTempoDoProduto :=  Year(dDataDaOrdemDeServico) - Year(dDataDaCompra)
  
   if Month(dDataDaOrdemDeServico) >= Month(dDataDaCompra) .and. day(dDataDaOrdemDeServico) > day(dDataDaCompra)
      nTempoDoProduto--
   endif
   
   if nTempoDoProduto < 2
      cCorGarantiaServico := "G/N"
      cCorGarantiaProduto := "G/N"
   elseif nTempoDoProduto < 3
      cCorGarantiaProduto := "G/N"
   endif   
   
   do while .t.
      nEscolha := Alert("Deseja Adicionar",{"Produtos","Servicos"},"N/W")
      if nEscolha == 0
         nOpcao := Alert("Quer Cancelar A Ordem De Servico?",{"Sim","Nao"},"N/W")
         if nOpcao == 1
            nCancelar := 1
            exit
         else
            loop
         endif
      else 
         exit
      endif
   enddo

   do while nEscolha > 0
      @ 07,01 clear to 22,79
      nLinha := 11

      do while nEscolha == 1
         cDescricao     := Space(30)
         nQuantidade    := 0
         nPrecoUnitario := 0
         nDesconto      := 0
         nTotal         := 0

         @ 23,02 say "Total Da OS : R$ " + Alltrim(Transform(nTotalDaOrdemDeServico,cPictureTotal))

         @ 07,66 say "Garantia"
         @ 07,75 say "P" color cCorGarantiaProduto
         @ 07,77 say "S" color cCorGarantiaServico 
         
         @ 07,02 say "Adicionando Produtos"
         @ 09,02 say "Descricao"
         @ 09,34 say "QTDE"
         @ 09,39 say "Preco Unitario"
         @ 09,54 say "Desconto %"
         @ 09,66 say "Total"

         @ nLinha,02 get cDescricao     Picture cPictureString     Valid !Empty(cDescricao)
         @ nLinha,34 get nQuantidade    Picture cPictureQuantidade Valid nQuantidade > 0
         @ nLinha,40 get nPrecoUnitario Picture cPicturePreco      Valid nPrecoUnitario > 0
         @ nLinha,56 get nDesconto      Picture cPictureDesconto   Valid nDesconto >= 0 .and. nDesconto <= 100
         read

         if LastKey() == 27
            nOpcao := Alert("Deseja",{"Finalizar OS","Adicionar Servicos","Cancelar OS"},"N/W") 
            if nOpcao == 1 
               nEscolhaAnterior := nEscolha
               nEscolha := 0
               exit
            elseif nOpcao == 2
               nEscolha := 2
               exit
            elseif nOpcao == 3
               nCancelar :=1
               nEscolha  := 0
               exit
            else
               loop
            endif
         endif
         
         nTotal := nPrecoUnitario * nQuantidade - ((nDesconto * nPrecoUnitario) / 100)

         @ nLinha++,66 say Alltrim(Transform(nTotal,cPictureTotal))

         if cCorGarantiaProduto = "G/N"
            @ 23,35 say "Produto na Garantia" Color cCorGarantiaProduto
         else
            nTotalDaOrdemDeServico += nTotal
         endif

         if nLinha = 22
            nLinha := 11
            @ 07,01 clear to 22,79
         endif

         nQuantidadeDeProdutos++
      enddo

      @ 07,01 clear to 22,79
      nLinha := 11

      do while nEscolha == 2 
         cDescricao         := Space(30)
         nComissaoDoTecnico := 0
         nDesconto          := 0
         nTotal             := 0

         @ 23,01 clear to 23,79

         @ 23,60 say "Comissao R$ " + Alltrim(Transform(nComissaoDoTecnicoTotal,cPictureTotal))
         @ 23,02 say "Total Da OS : R$ " + Alltrim(Transform(nTotalDaOrdemDeServico,cPictureTotal))
         
         @ 07,66 say "Garantia"
         @ 07,75 say "P" color cCorGarantiaProduto
         @ 07,77 say "S" color cCorGarantiaServico 

         @ 07,02 say "Adicionando Servicos"
         @ 09,02 say "Descricao"
         @ 09,34 say "Preco Total"
         @ 09,49 say "Desconto %"
         @ 09,60 say "Comissao %"
        

         @ nLinha,02 get cDescricao         Picture cPictureString   Valid !Empty(cDescricao)
         @ nLinha,34 get nTotal             Picture cPictureTotal    Valid nTotal > 0
         @ nLinha,50 get nDesconto          Picture cPictureDesconto Valid nDesconto >= 0 .and. nDesconto <= 100
         @ nLinha++,61 get nComissaoDoTecnico Picture cPictureComissao Valid nComissaoDoTecnico > 0
         read

         if LastKey() == 27
            nOpcao := Alert("Deseja",{"Finalizar OS","Adicionar Produtos","Cancelar OS"},"N/W") 
            if nOpcao == 1 
               nEscolhaAnterior := nEscolha
               nEscolha := 0
               exit
            elseif nOpcao == 2
               nEscolha := 1
               exit
            elseif nOpcao == 3
               nCancelar :=1
               nEscolha  := 0
               exit
            else
               loop
            endif
         endif
         
         nTotal -= ((nTotal * nDesconto) / 100) 
         nComissaoDoTecnicoTotal += ((nTotal * nComissaoDoTecnico) / 100) 

         if cCorGarantiaServico = "G/N"
            @ 23,35 say "Servico na Garantia" Color cCorGarantiaProduto
         else
            @ 23,30 say "Total do Servico " + Alltrim(Transform(nTotal,cPictureTotal))
            nTotalDaOrdemDeServico += nTotal
         endif

         if nLinha = 22
            nLinha := 11
            @ 07,01 clear to 22,79
         endif

         nQuantidadeDeServicos++

      enddo

      if nEscolha == 0 .and. nCancelar == 0 .and. nQuantidadeDeProdutos == 0 .and. nQuantidadeDeServicos == 0 
            Alert("Nenhum Produto ou Servico Adicionado, Nao e possivel finalizar a Ordem de Servico",,"N/W")
            nEscolha := nEscolhaAnterior
            loop
      endif
   enddo

   if nTotalDaOrdemDeServico == 0 .and. nCancelar == 0
      clear
      Alert("Ordem de Servico 100% paga pela Garantia",,"N/W")
      
      do while .t.
         
         @ 01,02 say "Dados Nota Fiscal"
         @ 02,02 say "CNPJ...................: "
         @ 03,02 say "Numero da Nota.........: "
         @ 04,02 say "Data de Emissao da Nota: "

         @ 02,27 get nCNPJDaEmpresa         Picture "99999999999999" Valid !Empty(nCNPJDaEmpresa)
         @ 03,27 get nNumeroDaNotaDeServico Picture "999999999"      Valid nNumeroDaNotaDeServico > 0
         @ 04,27 get dDataDaNota                                     Valid dDataDaNota >= dDataDaOrdemDeServico
         read

         if LastKey() == 27
            nOpcao := Alert("Deseja? ",{"Cancelar a OS","Finalizar a OS","Voltar aos Dados da Nota Fiscal"},"N/W")
            if nOpcao == 1
               nCancelar := 1
               exit
            elseif nOpcao == 2
               exit
            else
               loop
            endif
         endif
      
         exit
      enddo
   
   endif

  
   if nCancelar == 1
      loop
   endif

   Alert("Comissao Total Da OS Ao Tecnico R$ " + Alltrim(Transform(nComissaoDoTecnicoTotal,cPictureTotal)),,"N/W")
   nOrdemDeServico++

enddo