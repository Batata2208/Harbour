//João Pedro Ricardo
//
//

setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

//Pictures
cPictureString     := "@!"
cPictureLimite     := "@e 999,999.99"
cPictureTotal      := "@e 9,999.99"
cPictureUmNumero   := "9"
cPictureCodigo     := "9999"
cPictureQuantidade := "999.99"
cPictureDesconto   := "99"


//Produtos
nCodigoProduto1         := 1500
nPrecoProduto1          := 1.50
nEstoqueProduto1        := 155 
nDescontoMaximoProduto1 := 20 
cNomeProduto1           := "Banana Prata"

nCodigoProduto2         := 2501
nPrecoProduto2          := 9
nEstoqueProduto2        := 117.5
nDescontoMaximoProduto2 := 15 
cNomeProduto2           := "Pera Argentina"

nCodigoProduto3         := 3001
nPrecoProduto3          := 5
nEstoqueProduto3        := 859
nDescontoMaximoProduto3 := 10 
cNomeProduto3           := "Batata Peruana"

//Login
cLoginPermitidoNome  := "ADMIN"
cLoginPermitidoSenha := "teste123" 

//Pedidos e vendas
nNumeroPedido := 1

do while .t.

   clear

   cNomeLogin  := Space(30)
   cSenhaLogin := Space(30)
   
   @ 02,12 say "Frutaria Joao"
   @ 04,02 say "Login.:"
   @ 05,02 say "Senha.:"

   @ 04,09 get cNomeLogin  Picture cPictureString Valid !Empty(cNomeLogin)
   @ 05,09 get cSenhaLogin                        Valid !Empty(cSenhaLogin)
   Read
   
   if LastKey() == 27
      nOpcao := Alert("Deseja Sair do Programa?",{"Sim","Nao"},"N/W")
      if nOpcao == 1
         exit
      else
         loop
      endif
   endif

   if AllTrim(cNomeLogin) == cLoginPermitidoNome .and. AllTrim(cSenhaLogin) == cLoginPermitidoSenha
      do while .t.
         clear

         nEscolha := 0

         @ 02,20 say "Frutaria Joao"
         @ 03,25 say "Menu"
         @ 04,02 say "1 - Efetuar Vendas"
         @ 05,02 say "2 - Sair"

         @ 06,02 get nEscolha Picture cPictureUmNumero Valid nEscolha > 0 .and. nEscolha < 3
         Read

         if LastKey() == 27
            nOpcao := Alert("Deseja Voltar a tela Inicial",{"Sim","Nao"},"N/W")
            if nOpcao == 1
               exit
            else
               loop
            endif
         endif

         if nEscolha == 1
            do while .t.

               clear

               nSair  := 0
               //Tabela de produtos
               nLinhaTabela         := 09
               nLinhaProdutosTabela := 11
               nTotalCompra         := 0
               
               //dados cliente
               cNomeCliente    := Space(30)
               cEntregaEscolha := Space(1)
               aData           := DToC(Date())
               nLimiteCredito  := 0
               
               //dados endereco
               cEndereco   := Space(30)
               cBairro     := Space(20)
               cReferencia := Space(30)
               cTelefone   := Space(11)

               @ 02,30 say "Frutaria Joao"
               @ 03,29 say "Efetuar Compras"
               @ 05,02 say "Pedido Numero : " + AllTrim(Str(nNumeroPedido))
               @ 05,43 say "Data atual - " + DToC(Date())
               @ 06,02 say "Cliente: "
               @ 06,43 say "Data Da Venda - "
               @ 07,02 say "Limite do Cliente: "
               @ 07,39 say "Entrega Domicilio? [S] [N] : "

               @ 06,11 get cNomeCliente    Picture cPictureString Valid !Empty(cNomeCliente)
               @ 06,59 get aData                                  Valid CToD(aData) <= Date() .and. CToD(aData) > Date() - 2
               @ 07,22 get nLimiteCredito  Picture cPictureLimite Valid nLimiteCredito > 0
               @ 07,68 get cEntregaEscolha Picture cPictureString Valid cEntregaEscolha $ "SN"
               Read

               if LastKey() == 27
                  nOpcao := Alert("Deseja Voltar ao Menu?",{"Sim","Nao"},"N/W")
                  if nOpcao == 1
                     exit
                  else
                     loop
                  endif
               endif

               if cEntregaEscolha == "S"
                  do while .t.
                     @ 09,02 say "Endereco...: "
                     @ 09,46 say "Bairro...: "
                     @ 10,02 say "Referencia.: "
                     @ 10,46 say "Telefone.: "
                     @ 11,02 say "R$ 5,00 Adicionado ao total do pedido por causa da taxa de entrega"

                     @ 09,14 get cEndereco   Picture cPictureString Valid !Empty(cEndereco)
                     @ 09,56 get cBairro     Picture cPictureString Valid !Empty(cBairro)
                     @ 10,14 get cReferencia Picture cPictureString Valid !Empty(cReferencia)
                     @ 10,56 get cTelefone   Picture cPictureString Valid !Empty(cTelefone)
                     Read

                     nTotalCompra += 5

                     if LastKey() == 27   
                        nOpcao := Alert("Cancelar compra?",{"Sim","Nao"},"N/W")
                        if nOpcao == 1
                           nSair := 1
                           exit 
                        else
                           loop
                        endif
                     endif

                     nLinhaTabela         := 13
                     nLinhaProdutosTabela := 15
                     exit
                  enddo
               endif

               if nSair = 1 
                  loop
               endif

            
              
               do while nSair = 0

                  nCodigoProduto     := 0
                  nQuantidadeProduto := 0
                  nDescontoProduto   := 0
                  nTotalProduto      := 0

                  @ nLinhaTabela,02 say "Codigo Produto"
                  @ nLinhaTabela,17 say "Descricao produto"
                  @ nLinhaTabela,35 say "Qtde"
                  @ nLinhaTabela,42 say "Preco Unit."
                  @ nLinhaTabela,54 say "%Desc"
                  @ nLinhaTabela,60 say "Total do Produto"

                  @ 23,10 say "Total: R$ " + Transform(nTotalCompra,cPictureTotal)

                  @ nLinhaProdutosTabela,02 get nCodigoProduto Picture cPictureCodigo Valid nCodigoProduto > 0
                  Read

                  if LastKey() == 27 
                     nOpcao := Alert("Deseja?",{"Cancelar Compra","Finalizar compra"},"N/W")                   
                     if nOpcao == 1
                        nSair := 1
                        exit                     
                     elseif nOpcao == 2
                        exit 
                     else
                        loop
                     endif
                  endif

                  if nCodigoProduto == nCodigoProduto1

                     @ nLinhaProdutosTabela, 17 say cNomeProduto1
                     @ nLinhaProdutosTabela, 45 say AllTrim(Str(nPrecoProduto1))
                  elseif nCodigoProduto == nCodigoProduto2

                     @ nLinhaProdutosTabela, 17 say cNomeProduto2
                     @ nLinhaProdutosTabela, 45 say AllTrim(Str(nPrecoProduto2))
                  elseif nCodigoProduto == nCodigoProduto3

                     @ nLinhaProdutosTabela, 17 say cNomeProduto3
                     @ nLinhaProdutosTabela, 45 say AllTrim(Str(nPrecoProduto3))
                  else
                     Alert("Produto nao encontrado")
                     loop
                  endif

                  @ nLinhaProdutosTabela,35 get nQuantidadeProduto Picture cPictureQuantidade Valid nQuantidadeProduto > 0
                  @ nLinhaProdutosTabela,55 get nDescontoProduto   Picture cPictureDesconto   Valid nDescontoProduto >= 0
                  Read

                  if LastKey() == 27 
                     nOpcao := Alert("Deseja?",{"Finalizar compra","Cancelar compra"},"N/W")                     
                     if nOpcao == 1
                        exit                   
                     elseif nOpcao == 2
                        nSair := 1
                        exit
                     else
                        loop                    
                     endif                 
                  endif

                  if nCodigoProduto == nCodigoProduto1
                     if nQuantidadeProduto > nEstoqueProduto1  
                        Alert("Produto sem estoque o suficiente. Estoque restante = " + Alltrim(Str(nEstoqueProduto1)))
                        @ nLinhaProdutosTabela,02 clear to nLinhaProdutosTabela,78
                        loop
                     elseif nDescontoProduto > nDescontoMaximoProduto1
                        Alert("Desconto Muito Alto Para o Produto. Desconto Maximo = " + Alltrim(Str(nDescontoMaximoProduto1)))
                        @ nLinhaProdutosTabela,02 clear to nLinhaProdutosTabela,78
                        loop
                     endif

                     nTotalProduto := nPrecoProduto1 * nQuantidadeProduto
                     nTotalProduto -= ((nDescontoProduto * nTotalProduto) / 100)
                     
                  elseif nCodigoProduto == nCodigoProduto2
                     if nQuantidadeProduto > nEstoqueProduto2  
                        Alert("Produto sem estoque o suficiente. Estoque restante = " + Alltrim(Str(nEstoqueProduto2)))
                        @ nLinhaProdutosTabela,02 clear to nLinhaProdutosTabela,78
                        loop
                     elseif nDescontoProduto > nDescontoMaximoProduto2
                        Alert("Desconto Muito Alto Para o Produto. Desconto Maximo = " + Alltrim(Str(nDescontoMaximoProduto2)))
                        @ nLinhaProdutosTabela,02 clear to nLinhaProdutosTabela,78
                        loop
                     endif

                     nTotalProduto := nPrecoProduto2 * nQuantidadeProduto
                     nTotalProduto -= ((nDescontoProduto * nTotalProduto) / 100)

                  elseif nCodigoProduto == nCodigoProduto3
                     if nQuantidadeProduto > nEstoqueProduto3  
                        Alert("Produto sem estoque o suficiente. Estoque restante = " + Alltrim(Str(nEstoqueProduto3)))
                        @ nLinhaProdutosTabela,02 clear to nLinhaProdutosTabela,78
                        loop
                     elseif nDescontoProduto > nDescontoMaximoProduto3
                        Alert("Desconto Muito Alto Para o Produto. Desconto Maximo = " + Alltrim(Str(nDescontoMaximoProduto3)))
                        @ nLinhaProdutosTabela,02 clear to nLinhaProdutosTabela,78
                        loop
                     endif

                     nTotalProduto := nPrecoProduto3 * nQuantidadeProduto
                     nTotalProduto -= ((nDescontoProduto * nTotalProduto) / 100)
                  endif

                  if nTotalProduto + nTotalCompra > nLimiteCredito
                     Alert("Limite de Credito nao suficiente para adicionar o produto")
                     @ nLinhaProdutosTabela,02 clear to nLinhaProdutosTabela,78
                     loop

                  elseif nTotalProduto + nTotalCompra = nLimiteCredito
                     Alert("Limite Atingido, Finalize a compra")
                     
                  endif
                     
                  
                  
                  nTotalCompra += nTotalProduto

                  if nCodigoProduto = nCodigoProduto1
                     nEstoqueProduto1 -= nQuantidadeProduto

                  elseif nCodigoProduto = nCodigoProduto2
                     nEstoqueProduto2 -= nQuantidadeProduto

                  elseif nCodigoProduto = nCodigoProduto3
                     nEstoqueProduto3 -= nQuantidadeProduto

                  endif
               
                  @ nLinhaProdutosTabela++,60 say "R$ " + Transform(nTotalProduto,cPictureTotal)

                  if nLinhaProdutosTabela >= 22
                     @ nLinhaTabela,02 clear to nLinhaProdutosTabela,79
                     
                     if cEntregaEscolha = "S"
                        nLinhaProdutosTabela := 15
                     else
                        nLinhaProdutosTabela := 11
                     endif
                  endif

               enddo

               if nSair = 1
                  loop
               endif

               do while .t.

                  nNumeroPedido++

                  clear

                  @ 02,02 say "O total da Compra Ficou R$ " + Transform(nTotalCompra,cPictureLimite)
                  @ 03,02 say ""

                  Inkey(0)

                  exit
               enddo   

            enddo
   
         elseif nEscolha == 2 
            exit
         endif
     
      enddo
   
   else
      Alert("Usuario ou Senha Errados, Tente Novamente")
   endif

enddo