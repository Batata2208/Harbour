clear

nValorItemA := 0
nValorItemB := 0
nValorItemC := 0

nQuantidadeDeA := 0
nQuantidadeDeB := 0
nQuantidadeDeC := 0

@ 02,01 to 09,38

@ 03,02 say "Digite a quantidade de cada produto"
@ 04,02 say "Produto A R$ "
@ 04,22 say "Quantidade: "
@ 05,02 say "Produto B R$ "
@ 05,22 say "Quantidade: "
@ 06,02 say "Produto C R$ "
@ 06,22 say "Quantidade: "
@ 08,15 say "Total: R$ "

@ 04,15 get nValorItemA    picture "@e 999.99" valid nValorItemA    > 0
@ 05,15 get nValorItemB    picture "@e 999.99" valid nValorItemB    > 0
@ 06,15 get nValorItemC    picture "@e 999.99" valid nValorItemC    > 0
@ 04,34 get nQuantidadeDeA picture "@e 9999"   valid nQuantidadeDeA > 0
@ 05,34 get nQuantidadeDeB picture "@e 9999"   valid nQuantidadeDeB > 0
@ 06,34 get nQuantidadeDeC picture "@e 9999"   valid nQuantidadeDeC > 0
read

nTotal := (nQuantidadeDeA * nValorItemA) + (nQuantidadeDeB * nValorItemB) + (nQuantidadeDeC * nValorItemC)

@ 08,25 say nTotal picture "@e 99,999,999.99"

@ 10,20 say ""


