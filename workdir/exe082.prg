setmode (25,80)
set date British
set epoch to 1940
clear

//Variaveis numericas
nValorItem  := 0
nQuantidade := 0
nTotal      := 0
nTotalItem  := 0
nIdade      := 0
nLinha      := 11

//Variaveis de String
cNomeProduto := Space(8)
cSifrao      := " R$ "
cNomeCliente := Space(50)
cEndereco    := Space(50)

//Data
dVenda   := Date()

//Cor
cCor := "W/D"

//Cabe‡alho
@ 02,01 to 06,76 double

@ 03,02 say "Nome:     "
@ 03,64 say "Idade: "
@ 04,02 say "Endere‡o: "
@ 05,02 say "Data da venda: "
@ 05,50 say "Data de Entrega: "

@ 03,12 get cNomeCliente picture "@!"  valid !Empty(cNomeCliente) color cCor
@ 03,71 get nIdade       picture "999" valid nIdade >= 18         color cCor
@ 04,12 get cEndereco    picture "@!"  valid !Empty(cEndereco)    color cCor
@ 05,17 get dVenda                     valid dVenda <= Date()     color cCor
read

dEntrega := Date() + 7

@ 05,67 get dEntrega                   valid dEntrega >= dVenda  color cCor
read

//desenho da caixa
@ 09,01 to 09,52
@ 14,01 to 16,14
@ 10,24 to 14,24
@ 10,37 to 14,37
@ 07,01 to 14,52
@ 07,01 to 16,52 double

@ 15,04 say dVenda

//Titulo da loja
@ 08,19 say "Ferinha do Seu Z‚"

//linha :)
@ 10,02 say "Produto"
@ 10,16 say "Preco"
@ 10,26 say "Quantidade"
@ 10,40 say "Total Item"

//Itens
@ 11,02 say "         :" + cSifrao
@ 12,02 say "         :" + cSifrao
@ 13,02 say "         :" + cSifrao
//@ 11,12 say cSifrao
//@ 12,12 say cSifrao
//@ 13,12 say cSifrao

//Total dos produtos
@ 15,29 say "Total" + cSifrao

@ nLinha,02 get cNomeProduto picture "@!"        valid !Empty(cNomeProduto) color cCor
@ nLinha,16 get nValorItem   picture "@e 999.99" valid nValorItem  >= 0     color cCor
@ nLinha,29 get nQuantidade  picture "@e 9,999"  valid nQuantidade >= 0     color cCor
read

nTotal     += nQuantidade * nValorItem
nTotalItem += nQuantidade * nValorItem

@ 15,38 say nTotal         picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItem picture "@e 9,999,999.99"

nTotalItem   := 0
nValorItem   := 0
nQuantidade  := 0
cNomeProduto := space(8)
nLinha++

@ 12,02 get cNomeProduto picture "@!"        valid !Empty(cNomeProduto) color cCor
@ 12,16 get nValorItem   picture "@e 999.99" valid nValorItem  >= 0     color cCor
@ 12,29 get nQuantidade  picture "@e 9,999"  valid nQuantidade >= 0     color cCor
read

nTotal     += nQuantidade * nValorItem
nTotalItem += nQuantidade * nValorItem

@ 15,38 say nTotal         picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItem picture "@e 9,999,999.99"

nTotalItem   := 0
nValorItem   := 0
nQuantidade  := 0
cNomeProduto := space(8)
nLinha++

@ 13,02 get cNomeProduto picture "@!"        valid !Empty(cNomeProduto) color cCor
@ 13,16 get nValorItem   picture "@e 999.99" valid nValorItem  >= 0     color cCor
@ 13,29 get nQuantidade  picture "@e 9,999"  valid nQuantidade >= 0     color cCor
read

nTotal     += nQuantidade * nValorItem
nTotalItem += nQuantidade * nValorItem

@ 15,38 say nTotal         picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItem picture "@e 9,999,999.99"

@ 19,02 say "Agradeco pela compra, pressione uma tecla para sair"

Inkey(0)
