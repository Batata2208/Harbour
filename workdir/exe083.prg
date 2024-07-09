setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

//Variaveis numericas
nValorItemA  := 0
nValorItemB  := 0
nValorItemC  := 0

nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0

nTotalItemA  := 0
nTotalItemB  := 0
nTotalItemC  := 0

nTotal       := 0

nIdade       := 0
nLinha       := 11

//Variaveis de String
cNomeProdutoA := Space(8)
cNomeProdutoB := Space(8)
cNomeProdutoC := Space(8)

cSifrao       := " R$ "
cNomeCliente  := Space(50)
cEndereco     := Space(50)

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

dEntrega := dVenda + 7

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
@ nLinha,02 get cNomeProdutoA picture "@!"        valid !Empty(cNomeProdutoA)
@ nLinha,16 get nValorItemA   picture "@e 999.99" valid nValorItemA  >= 0
@ nLinha,29 get nQuantidadeA  picture "@e 9,999"  valid nQuantidadeA >= 0
read

//Calculo do total do produto e do total da venda
nTotal      += nQuantidadeA * nValorItemA
nTotalItemA += nQuantidadeA * nValorItemA

@ 15,38 say     nTotal      picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItemA picture "@e 9,999,999.99"

nLinha++

//pegar o nome, o pre‡o e a quantidade do produto
@ nLinha,02 get cNomeProdutoB picture "@!"        valid !Empty(cNomeProdutoB)
@ nLinha,16 get nValorItemB   picture "@e 999.99" valid nValorItemB  >= 0
@ nLinha,29 get nQuantidadeB  picture "@e 9,999"  valid nQuantidadeB >= 0
read

//Calculo do total do produto e do total da venda
nTotal      += nQuantidadeB * nValorItemB
nTotalItemB += nQuantidadeB * nValorItemB

@ 15,38     say nTotal      picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItemB picture "@e 9,999,999.99"

//resetando as variaveis para adicionar mais produtos
nLinha++

//pegar o nome, o pre‡o e a quantidade do produto
@ nLinha,02 get cNomeProdutoC picture "@!"        valid !Empty(cNomeProdutoC)
@ nLinha,16 get nValorItemC   picture "@e 999.99" valid nValorItemC  >= 0
@ nLinha,29 get nQuantidadeC  picture "@e 9,999"  valid nQuantidadeC >= 0
read

//Calculo do total do produto e do total da venda
nTotal      += nQuantidadeC * nValorItemC
nTotalItemC += nQuantidadeC * nValorItemC

@ 15,38     say nTotal      picture "@e 99,999,999.99"
@ nLinha,39 say nTotalItemC picture "@e 9,999,999.99"

@ 19,02 say "Agradeco pela compra, pressione uma tecla para ver o recibo"

Inkey(0)

//codigo Cupom do Cliente
clear

cIdade       := Alltrim(Str(nIdade))
cvenda       := DToC(dVenda)
cEntrega     := DToC(dEntrega)

@ 02,00 to 20,77 double
@ 06,01 to 06,76
@ 13,01 to 13,76

@ 03,01 say "Nome Cliente: " + cNomeCliente
@ 03,66 say "Idade: " + cIdade
@ 04,01 say "Endereco:     " + cEndereco
@ 07,02 say "Produto       Preco     Quantidade     Total Item"

@ 08,02 say cNomeProdutoA
@ 08,16 say nValorItemA   picture "@e 999.99"
@ 08,29 say nQuantidadeA  picture "@e 9,999"
@ 08,40 say nTotalItemA   picture "@e 9,999,999.99"

@ 09,02 say cNomeProdutoB
@ 09,16 say nValorItemB   picture "@e 999.99"
@ 09,29 say nQuantidadeB  picture "@e 9,999"
@ 09,40 say nTotalItemB   picture "@e 9,999,999.99"

@ 10,02 say cNomeProdutoC
@ 10,16 say nValorItemC   picture "@e 999.99"
@ 10,29 say nQuantidadeC  picture "@e 9,999"
@ 10,40 say nTotalItemC   picture "@e 9,999,999.99"

@ 12,02 say "Total da Compra"
@ 12,39 say nTotal picture "@e 99,999,999.99"

@ 15,01 say "Data da Venda:  " + cVenda
@ 16,01 say "Data da Entrega do Produto com Minimo de 7 dias "
@ 17,01 say "Data da Entrega: "+ cEntrega

nDiaSemanaVenda   := DoW(dVenda)
nAnoVenda         := Year(dVenda)
nDiaVenda         := Day(dVenda)
nMesVenda         := Month(dVenda)

cLugarDeVenda     := "Maring "

cDiaSemanaVenda   := ""
cAnoVenda         := Alltrim(Str(nAnoVenda))
cDiaVenda         := Alltrim(Str(nDiaVenda))
cMesVenda         := ""

if nDiaSemanaVenda == 1
   cDiaSemanaVenda := "Domingo"

elseif nDiaSemanaVenda == 2
   cDiaSemanaVenda := "Segunda-Feira"

elseif nDiaSemanaVenda == 3
   cDiaSemanaVenda := "Terca-Feira"

elseif nDiaSemanaVenda == 4
   cDiaSemanaVenda := "Quarta-Feira"

elseif nDiaSemanaVenda == 5
   cDiaSemanaVenda := "Quinta-Feira"

elseif nDiaSemanaVenda == 6
   cDiaSemanaVenda := "Sexta-Feira"

elseif nDiaSemanaVenda == 7
   cDiaSemanaVenda := "Sabado"

endif

if nMesVenda == 1
   cMesVenda := "Janeiro"

elseif nMesVenda == 2
   cMesVenda := "Fevereiro"

elseif nMesVenda == 3
   cMesVenda := "Marco"

elseif nMesVenda == 4
   cMesVenda := "Abril"

elseif nMesVenda == 5
   cMesVenda := "Maio"

elseif nMesVenda == 6
   cMesVenda := "Junho"

elseif nMesVenda == 7
   cMesVenda := "Julho"

elseif nMesVenda == 8
   cMesVenda := "Agosto"

elseif nMesVenda == 9
   cMesVenda := "Setembro"

elseif nMesVenda == 10
   cMesVenda := "Outubro"

elseif nMesVenda == 11
   cMesVenda := "Novembro"

elseif nMesVenda == 12
   cMesVenda := "Dezembro"

endif

@ 19,01 say cLugarDeVenda + ", " + cDiaVenda + " de " + cMesVenda + " de " + cAnoVenda + " (" + cDiaSemanaVenda + ")"

@ 24,02 say "Precione algo para sair"
Inkey(0)

