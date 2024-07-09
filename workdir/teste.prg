setmode(25,80)
set date to British
set epoch to 1940
set century on
set scoreboard off

clear

nSim := 0
cCor := "B/G"
nBox := 1

do while nSim = 0

   @ 01,00 to 02,79 double color cCor
   @ 02,00 to 03,79 double color cCor
   @ 03,00 to 04,79 double color cCor
   @ 04,00 to 05,79 double color cCor
   @ 05,00 to 06,79 double color cCor
   @ 06,00 to 07,79 double color cCor
   @ 07,00 to 08,79 double color cCor
   @ 08,00 to 09,79 double color cCor
   @ 09,00 to 10,79 double color cCor
   @ 10,00 to 11,79 double color cCor
   @ 11,00 to 12,79 double color cCor
   @ 12,00 to 13,79 double color cCor
   @ 13,00 to 14,79 double color cCor
   @ 14,00 to 15,79 double color cCor
   @ 15,00 to 16,79 double color cCor
   @ 16,00 to 17,79 double color cCor
   @ 17,00 to 18,79 double color cCor
   @ 18,00 to 19,79 double color cCor
   @ 19,00 to 20,79 double color cCor
   @ 20,00 to 21,79 double color cCor
   @ 21,00 to 22,79 double color cCor
   @ 22,00 to 23,79 double color cCor
   @ 23,00 to 24,79 double color cCor
   @ 24,00 to 24,79 double color cCor

   if nBox = 1
      cCor := "G/B"
      nBox++
   elseif nBox = 2
      cCor := "R/G"
      nBox++
   elseif nBox = 3
      cCor := "B/R"
      nBox := 1
   endif

   Inkey(0.5)
enddo
