setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

cPictureLimite     := "@e 999,999.99"
cPictureQuantidade := "999"
cPicturePreco      := "@e 99,999.99"
cPictureStrings    := "@!"

do while .t.
   clear
   
   nCancelar := 0
   nLinha    := 7

   //Variaveis Cabeçalho
   cNomeAdolescente := Space(30)
   nLimite          := 0

   //Variaveis Pagamento
   cFormaDePagamento := Space(1)
   nValorRecebido    := 0
   nTroco            := 0

   //Variaveis da compra
   nTotalCompra  := 0
   nLimiteCompra := 0

   @ 01,01 to 03,79 double
   
   @ 02,02 say "Nome.:"
   @ 02,40 say "Limite.:"

   @ 02,08 get cNomeAdolescente Picture cPictureStrings Valid !Empty(cNomeAdolescente)
   @ 02,48 get nLimite          Picture cPictureLimite  Valid nLimite > 0
   read

   if LastKey() == 27
      nOpcao := Alert("Deseja Sair do Programa?",{"Sim","Nao"},"N/W")
      if nOpcao == 1
         exit
      else
         loop      
      endif
   endif

   nLimiteCompra := nLimite

   @ 04,01 to 24,79 double

   @ 05,02 say "Produto"
   @ 05,18 say "QTD"
   @ 05,22 say "Valor"
   @ 05,38 say "Total"

   @ 22,01 to 24,79 double

   do while nLimite > 0
      cProduto           := Space(15)
      nQuantidadeProduto := 0
      nValorProduto      := 0
      nTotalProduto      := 0

      @ 23,02 say "Total.: R$ " + Transform(nTotalCompra,cPictureLimite)
      @ 23,57 say "Limite.: R$ " + Transform(nLimiteCompra,cPictureLimite)

      @ nLinha,02 get cProduto           Picture cPictureStrings    Valid !Empty(cProduto)
      @ nLinha,18 get nQuantidadeProduto Picture cPictureQuantidade Valid nQuantidadeProduto > 0
      @ nLinha,22 get nValorProduto      Picture cPicturePreco      Valid nValorProduto > 0
      read

      if LastKey() == 27
         nOpcao := Alert("O que Deseja Fazer?",{"Finalizar a compra","Continuar Comprando","Cancelar a Compra"},"N/W")
         if nOpcao == 1 .or. nOpcao == 3
            exit
         else
            loop
         endif
      endif

      nTotalProduto := nQuantidadeProduto * nValorProduto

      @ nLinha,35 say Transform(nTotalProduto,cPictureLimite)
      
      if nLimiteCompra < nTotalProduto
         nOpcao := Alert("Produto Excede o Limite Disponivel para Compra, Deseja",{"Comprar outro Produto", "Finalizar a compra"}, "N/W")
         if nOpcao == 1
            @ nLinha,02 clear to nLinha,78
            loop
         else
            exit
         endif
      
      else
         nLimiteCompra -= nTotalProduto
         nTotalCompra += nTotalProduto
         
         if nLinha = 21
            @ 07,02 clear to 21,78
            nLinha := 7
         
         else

            nLinha += 2
         endif

         if nLimiteCompra == 0
            nOpcao := Alert("Limite Atingido",{"Voltar a tela de compra","Continuar ao Pagamento","Cancelar Compras"},"N/W")
            if nOpcao == 1
               Alert("Ao voltar a essa tela voce so podera ver, nenhum produto podera ser adicionado, para mais opcoes aperte ESC","N/W")
               loop
            
            else
               exit
            endif
         endif
      endif
   enddo

   if nOpcao = 3
      loop
   endif

   clear

   @ 01,01 to 09,79 double

   @ 03,02 say "Forma de Pagamento [D]Dinheiro [C]Cartao [P]Pix.: "
   @ 04,02 say "Total da Compra.:   R$ " + Transform(nTotalCompra,cPictureLimite)
   @ 05,02 say "Limite do Cliente.: R$ " + Transform(nLimite,cPictureLimite)

   @ 03,53 get cFormaDePagamento Picture cPictureStrings Valid !Empty(cFormaDePagamento)
   read

   if LastKey() == 27
      nOpcao := Alert("Deseja Cancelar a compra?",{"Sim","Nao"},"N/W")
      if nOpcao == 1
         loop
      endif
   endif

   nLimite -= nTotalCompra

   //Caso o pagamento seja em dinheiro ele ira receber uma quantidade
   if cFormaDePagamento == "D"

      @ 06,02 say "Valor Recebido.:    R$ "
      
      @ 06,25 get nValorRecebido Picture cPictureLimite Valid nValorRecebido >= nTotalCompra
      read
      if LastKey() == 27
         nOpcao := Alert("Deseja Cancelar a compra?",{"Sim","Nao"},"N/W")
         if nOpcao == 1
            loop
         endif
      endif

      nTroco := nValorRecebido - nTotalCompra

   else

      @ 06,02 say "Valor Recebido Igual ao Valor da Compra"

   endif

   //Mostra o troco recebido pelo cliente e o dinheiro restante dele
   @ 07,02 say "Troco.:             R$ " + Transform(nTroco,cPictureLimite)  
   @ 08,02 say "Limite restante : " + Transform(nLimite,cPictureLimite)

   Inkey(0)
enddo