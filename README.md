# README EVIDENCE
## Description
Chalkobska is a fictional language introduced in the Dune Saga, a series of science fiction novels written by Frank Herbert. In the Dune universe, Chalkobska is spoken by certain communities or groups, and it plays a significant role in the cultural and social dynamics of the fictional universe.

My positive test cases for this model were
* ichwan
* idray
* idras
* ikhut-eigh
* ilm

For this approach i decided to use a DFA (Deterministic Finite Automata) which resulted in the next Automata
![alt text](https://github.com/elunacado/Automata/blob/main/automata.png) DFA 1

Which is equivalent to the next RE (regular expression) <br />
DFA 1 -> RE 1: {(^i)chwan|lm|(dra(y|s))|khut-eigh}

## Implementation
The implementation follows the structure outlined in the automata.pl file. To use the file, input your desired test case using the following format:<br />

prueba(numeberOfTheTest) :- \+<- if you want the case to be rejected aceptar <br />
("ichw") <- your test case, <br />
write('REJECTED: ichw') <- what the program will print,<br />
nl. <br />


Add to the list of tests<br />
runTests :-    prueba1, prueba2, prueba3, prueba4, prueba5, prueba6, prueba7, prueba8, prueba9, prueba10.<br />

And the program should return 'ACCEPTED' if the string is accepted or 'REJECTED' if the string is not part of the language. <br />

some examples of inputs and outputs are:<br /> 
* ACCEPTED: ilm 
* ACCEPTED: ikhut-eigh 
* ACCEPTED: ichwan 
* ACCEPTED: idras 
* ACCEPTED: idray 
* REJECTED: holaMundo 
* REJECTED: illm 
* REJECTED: idra 
* REJECTED: ikhu 
* REJECTED: ichw 

## Tests
They're included in the automata.pl file <br />

## Analysis
The complexity of the model is O(n), where n is the length of the string to be processed. <br />

And it's equivalent to the next code:
```python
for elemento in lista:  # Recorremos la lista una vez
    print(elemento)
```




