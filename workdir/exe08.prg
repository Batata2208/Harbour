setmode (25,80)
set date British
clear

//Variaveis numericas
nValorItem := 0
nQuantidade := 0
nTotal  := 0
nLinha  := 6

// variavel de texto
cNomeProduto := Space(8)
cCor         := "W/D"
cSifrao      := "R$"

//Variavel de data
dData   := Date()

//Variavel logica
lCompra := .t.


//desenho da caixa
@ 04,01 to 04,37
@ 09,01 to 11,13
@ 05,24 to 09,24
@ 02,01 to 09,37
@ 02,01 to 11,37 double

@ 10,04 say dData

//Titulo da loja
@ 03,11 say "Ferinha do Seu Z‚"

//linha :)
@ 05,16 say "Preco"
@ 05,26 say "Quantidade:"

//Itens
@ 06,02 say "         :"
@ 07,02 say "         :"
@ 08,02 say "         :"
@ 06,13 say cSifrao
@ 07,13 say cSifrao
@ 08,13 say cSifrao


//Total dos produtos
@ 10,15 say "Total R$ "

do while lCompra = .t.
   @ nLinha,02 get cNomeProduto picture "@!"        valid !Empty(cNomeProduto) color cCor
   @ nLinha,16 get nValorItem   picture "@e 999.99" valid nValorItem  >= 0     color cCor
   @ nLinha,29 get nQuantidade  picture "@e 9,999"  valid nQuantidade >= 0     color cCor
   read

   if Lastkey() = 27
      nOpcao := Alert("Deseja Finalizar compra?",{"Sim","Nao"},"D/W ")
      if nOpcao == 1
         exit
      endif
   endif

   nTotal += nQuantidade * nValorItem

   @ 10,24 say nTotal picture "@e 99,999,999.99"

   nQuantidade  := 0
   nValorItem   := 0
   cNomeProduto := Space(8)
   nLinha++
   if nTotal >= 50000000
      Alert("NOT ENOUGH MONEY",,"D/W")
      exit
   else
      if nLinha >= 9
         @ 06,02 clear to 08,10
         @ 06,16 clear to 08,21
         @ 06,28 clear to 08,36
         nLinha := 6
      endif
   endif
enddo

@ 14,02 say "Agradeco pela compra, pressione uma tecla para sair"
Inkey(0)

/*set date British
clear

//Variaveil de item
nValorItem := 0

//variaveil de quantidade
nQuantidade := 0

//Utilitarios
cCor   := "W/D"
nTotal := 0
dData  := Date()

//desenho da caixa
@ 04,01 to 04,37
@ 09,01 to 11,13
@ 05,24 to 09,24
@ 02,01 to 09,37
@ 02,01 to 11,37 double

@ 10,04 say dData

//Titulo da loja
@ 03,11 say "Ferinha do Seu Z‚"

//linha :)
@ 05,16 say "Preco"
@ 05,26 say "Quantidade:"

//Itens
@ 06,02 say "Abacaxi : R$ "
@ 07,02 say "Toranja : R$ "
@ 08,02 say "Picanha : R$ "

//Total dos produtos
@ 10,15 say "Total R$ "

@ 06,16 get nValorItem  picture "@e 999.99" valid nValorItem    >= 0 color cCor
@ 06,29 get nQuantidade picture "@e 9,999"  valid nQuantidade >= 0 color cCor
read

nTotal += nQuantidade * nValorItem

@ 10,24 say nTotal picture "@e 99,999,999.99"

nQuantidade := 0
nValorItem  := 0

@ 07,16 get nValorItem  picture "@e 999.99" valid nValorItem    >= 0 color cCor
@ 07,29 get nQuantidade picture "@e 9,999"  valid nQuantidade >= 0 color cCor
read

nTotal += nQuantidade * nValorItem

@ 10,24 say nTotal picture "@e 99,999,999.99"

nQuantidade := 0
nValorItem  := 0

@ 08,16 get nValorItem  picture "@e 999.99" valid nValorItem    >= 0 color cCor
@ 08,29 get nQuantidade picture "@e 9,999"  valid nQuantidade >= 0 color cCor
read

nTotal += nQuantidade * nValorItem

@ 10,24 say nTotal picture "@e 99,999,999.99"

nQuantidade := 0
nValorItem  := 0

@ 14,02 say "Agradeco pela compra, pressione uma tecla para sair"
Inkey(0)*/

/*set date British
clear

//Variaveis de item
nValorItemA := 0
nValorItemB := 0
nValorItemC := 0

//variaveis de quantidade
nQuantidadeDeA := 0
nQuantidadeDeB := 0
nQuantidadeDeC := 0

//Utilitarios
cCor   := "W/D"
nTotal := 0
dData  := Date()

//desenho da caixa
@ 04,01 to 04,37
@ 09,01 to 11,13
@ 05,24 to 09,24
@ 02,01 to 09,37
@ 02,01 to 11,37 double

@ 10,04 say dData

//Titulo da loja
@ 03,11 say "Ferinha do Seu Z‚"

//linha :)
@ 05,16 say "Preco"
@ 05,26 say "Quantidade:"

//Itens
@ 06,02 say "Abacaxi : R$ "
@ 07,02 say "Toranja : R$ "
@ 08,02 say "Picanha : R$ "

//Total dos produtos
@ 10,15 say "Total R$ "

@ 06,16 get nValorItemA    picture "@e 999.99" valid nValorItemA >= 0    color cCor
@ 06,29 get nQuantidadeDeA picture "@e 9,999"  valid nQuantidadeDeA >= 0 color cCor
read

nTotal += nQuantidadeDeA * nValorItemA

@ 10,24 say nTotal picture "@e 99,999,999.99"

@ 07,16 get nValorItemB    picture "@e 999.99" valid nValorItemB >= 0    color cCor
@ 07,29 get nQuantidadeDeB picture "@e 9,999"  valid nQuantidadeDeB >= 0 color cCor
read

nTotal += nQuantidadeDeB * nValorItemB

@ 10,24 say nTotal picture "@e 99,999,999.99"

@ 08,16 get nValorItemC    picture "@e 999.99" valid nValorItemC >= 0    color cCor
@ 08,29 get nQuantidadeDeC picture "@e 9,999"  valid nQuantidadeDeC >= 0 color cCor
read

nTotal += nQuantidadeDeC * nValorItemC

@ 10,24 say nTotal picture "@e 99,999,999.99"



@ 14,02 say "Agradeco pela compra, pressione uma tecla para sair"
Inkey(0) */
