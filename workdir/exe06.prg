clear

nValor1 := 0
nValor2 := 0
nValor3 := 0

@ 04,09 to 10,43 double

@ 05,10 say "Digite as notas do  aluno foram: "

@ 06,10 say "Nota 1              "
@ 07,10 say "Nota 2              "
@ 08,10 say "Nota 3              "

@ 06,17 get nValor1 picture "@E 99.99"
@ 07,17 get nValor2 picture "@E 99.99"
@ 08,17 get nValor3 picture "@E 99.99"
read

nMedia := (nValor1 + nValor2 + nValor3) / 3

@ 09,23 say nMedia

@ 09,10 say "A media do aluno foi"

@ 24,79 say ""
