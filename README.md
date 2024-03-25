# README EVIDENCE
## Description
The language i choose was the Chalkobska from the Dune Saga, my positive test cases were
-ichwan
-idray
-idras
-ikhut-eigh
-ilm

For this approach i decided to use a DFA (Deterministic Finite Automata) which resulted in the next Automata
![alt text](https://github.com/elunacado/Automata/blob/main/automata.drawio(1).png) DFA 1

Which is equivalent to the next RE (regular expression)
DFA 1 -> RE 1: {(^i)chwan|lm|(dra(y|s))|khut-eigh}

## Implementation
I followed the regular expressions as can be seen in the automata.pl file. To use the file you need to put the input of your choice using the  next format

prueba(numeberOfTheTest) :- \+<- if you want the case to be rejected aceptar("ichw") <- your test case, write('REJECTED: ichw') <- what the program will print, nl.


Add to the list of tests
runTests :-    prueba1, prueba2, prueba3, prueba4, prueba5, prueba6, prueba7, prueba8, prueba9, prueba10.

And the program should return yes if the string is accepted or no if the string is not part of the language.

some examples of inputs and outputs are:
ACCEPTED: ilm
ACCEPTED: ikhut-eigh
ACCEPTED: ichwan
ACCEPTED: idras
ACCEPTED: idray
REJECTED: holaMundo
REJECTED: illm
REJECTED: idra
REJECTED: ikhu
REJECTED: ichw
