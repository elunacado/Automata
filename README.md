# README EVIDENCE
## Description
Chalkobska is a fictional language introduced in the Dune Saga, a series of science fiction novels written by Frank Herbert. In the Dune universe, Chalkobska is spoken by certain communities or groups, and it plays a significant role in the cultural and social dynamics of the fictional universe.

My positive test cases for this model were
* ichwan
* idray
* idras
* ikhut-eigh
* ilm

For this approach, I decided to use a DFA (Deterministic Finite Automaton) which is responsible for recognizing whether a string is accepted or not in which each input symbol triggers a transition to another state, resulting in the next state of the automata. and as explained in geeks for geeks introduction of Finite Automata "In a DFA, for a particular input character, the machine goes to one state only. A transition function is defined on every state for every input symbol. Also in DFA null (or ?) move is not allowed, i.e., DFA cannot change state without any input character." [1]
![alt text](https://github.com/elunacado/Automata/blob/main/automata(1).png) DFA 1

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
The time complexity of the model is O(n), where n is the length of the string to be processed. <br />

And the function to traverse the automata:
```prolog
aceptar_aux([Simbolo|Resto], EstadoActual) :-
    % En caso de que todavia tenga contenido la lista de caracteres se mueve a traves del automata con el simbolo como trayecto
    move(EstadoActual, Simbolo, EstadoSiguiente),
    % Se llama a si misma con el resto de la lista de caracteres (si es que hay) utilizando el siguiente simbolo de la list
    aceptar_aux(Resto, EstadoSiguiente).

```
Mainly does 2 things <br />
1. Transition through the Automaton:
move(EstadoActual, Simbolo, EstadoSiguiente) is a predicate that determines the next state EstadoSiguiente based on the current state EstadoActual and the symbol Simbolo. It effectively simulates the movement through the automaton. For each symbol encountered in the input string, it transitions from the current state to the next state based on the symbol.

2. Recursion:
aceptar_aux/2 is recursive. After determining the next state based on the current symbol, it calls itself recursively with the remaining symbols in the input string (Resto) and the newly calculated next state (EstadoSiguiente).
        This recursion continues until there are no more symbols left in the input string (Resto is empty), or until no valid transitions are available.

And it's equivalent to the next code:
```python
for elemento in lista:  # Recorremos la lista una vez
    print(elemento)
```

## Bibliography
[1] Introduction to finite automata: https://www.geeksforgeeks.org/introduction-of-finite-automata/





