ksetmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

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

cProdutoA    := Space(40)
cProdutoB    := Space(40)
cProdutoC    := Space(40)

//Data
dVenda   := Date()



//Cabe‡alho
@ 02,01 to 06,76 double

@ 03,02 say "Nome:     "
@ 03,64 say "Idade: "
@ 04,02 say "Endere‡o: "
@ 05,02 say "Data da venda: "
@ 05,48 say "Data de Entrega: "

@ 03,12 get cNomeCliente picture "@!"  valid !Empty(cNomeCliente)
@ 03,71 get nIdade       picture "999" valid nIdade >= 18
@ 04,12 get cEndereco    picture "@!"  valid !Empty(cEndereco)
@ 05,17 get dVenda                     valid dVenda <= Date()
read

dEntrega := Date() + 7

@ 05,65 get dEntrega                   valid dEntrega >= dVenda + 7
read

//desenho da caixa
@ 09,01 to 09,52
@ 14,01 to 16,16
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

//Total dos produtos
@ 15,29 say "Total" + cSifrao


//pegar o nome, o pre‡o e a quantidade do produto
@ nLinha,02 get cNomeProduto picture "@!"        valid !Empty(cNomeProduto)
@ nLinha,16 get nValorItem   picture "@e 999.99" valid nValorItem  >= 0
@ nLinha,29 get nQuantidade  picture "@e 9,999"  valid nQuantidade >= 0
read

//Calculo do total do produto e do total da venda
nTotal     += nQuantidade * nValorItem
nTotalItem += nQuantidade * nValorItem
cProdutoA  := cNomeProduto + "      " + Alltrim(Str(nValorItem)) + " " + Alltrim(Str(nQuantidade)) + " " + Alltrim(Str(nTotalItem))

@ 15,38 say     nTotal     picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItem picture "@e 9,999,999.99"

//resetando as variaveis para adicionar mais produtos
nTotalItem   := 0
nValorItem   := 0
nQuantidade  := 0
cNomeProduto := space(8)
nLinha++

//pegar o nome, o pre‡o e a quantidade do produto
@ nLinha,02 get cNomeProduto picture "@!"        valid !Empty(cNomeProduto)
@ nLinha,16 get nValorItem   picture "@e 999.99" valid nValorItem  >= 0
@ nLinha,29 get nQuantidade  picture "@e 9,999"  valid nQuantidade >= 0
read

//Calculo do total do produto e do total da venda
nTotal     += nQuantidade * nValorItem
nTotalItem += nQuantidade * nValorItem
cProdutoB  := cNomeProduto + " " + Alltrim(Str(nValorItem)) + " " + Alltrim(Str(nQuantidade)) + " " + Alltrim(Str(nTotalItem))

@ 15,38     say nTotal     picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItem picture "@e 9,999,999.99"

//resetando as variaveis para adicionar mais produtos
nTotalItem   := 0
nValorItem   := 0
nQuantidade  := 0
cNomeProduto := space(8)
nLinha++

//pegar o nome, o pre‡o e a quantidade do produto
@ nLinha,02 get cNomeProduto picture "@!"        valid !Empty(cNomeProduto)
@ nLinha,16 get nValorItem   picture "@e 999.99" valid nValorItem  >= 0
@ nLinha,29 get nQuantidade  picture "@e 9,999"  valid nQuantidade >= 0
read

//Calculo do total do produto e do total da venda
nTotal     += nQuantidade * nValorItem
nTotalItem += nQuantidade * nValorItem
cProdutoC  := cNomeProduto + " " + Alltrim(Str(nValorItem)) + " " + Alltrim(Str(nQuantidade)) + " " + Alltrim(Str(nTotalItem))

@ 15,38     say nTotal     picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItem picture "@e 9,999,999.99"

@ 19,02 say "Agradeco pela compra, pressione uma tecla para ver o recibo"

Inkey(0)

clear

cNomeCliente := Alltrim(cNomeCliente)
cIdade       := Alltrim(Str(nIdade))
cEndereco    := Alltrim(cEndereco)
cvenda       := DToC(dVenda)
cEntrega     := DToC(dEntrega)

@ 02,00 to 24,77 double

@ 03,01 say "Nome Cliente: " + cNomeCliente
@ 03,66 say "Idade: " + cIdade
@ 04,01 say "Endereco: " + cEndereco
@ 05,01 say "Data da Venda: " + cVenda
@ 07,02 say "Produto       Preco     Quantidade     Total Item"
@ 08,02 say cProdutoA

@ 11,01 say "Data da Entrega com Minimo de 7 dias " + cEntrega












