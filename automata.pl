%estado inicial
estado_inicial(q1).
%--------------------

%estados de exito
estado_exito(q19). %ilm

%--------------------

% movernos a traes del automata
% move(from, with, to)

%iniciamos con i en todas
move(q1, i, q2).

%caso de ilm
move(q2, l, q7).
move(q7, m, q19).

%caso de ikhut-eigh
move(q2, k ,q11).
move(q11, h ,q12).
move(q12, u ,q13).
move(q13, t ,q14).
move(q14, - ,q15).
move(q15, e ,q16).
move(q16, i ,q17).
move(q17, g ,q18).
move(q18, h ,q19).

%caso de ichwan
move(q2, c, q3).
move(q3, h, q4).
move(q4, w, q5).
move(q5, a, q6).
move(q6, n, q19).

%Caso de idray e idras
move(q2, d, q8).
move(q8, r, q9).
move(q9, a, q10).

%cambio a idras
move(q10, s, q19).

%cambio a idray
move(q10, y, q19).

% codigo de aceptación()
%recibe un string entre comillas
aceptar(String) :-
    %separo el string por caracteres
    string_chars(String, ListaCaracteres),
    %llamo al estado inicial q1
    estado_inicial(q1),
    %le paso a la funcion auxiliar la lista de caracteres y el estado inicial
    aceptar_aux(ListaCaracteres, q1).

aceptar_aux([], EstadoActual) :-
    %comprueba el estado inicial cuando se vacia la lista y nos da el resultado de true|false
    estado_exito(EstadoActual).

aceptar_aux([Simbolo|Resto], EstadoActual) :-
    % En caso de que todavia tenga contenido la lista de caracteres se mueve a traves del automata con el simbolo como trayecto
    move(EstadoActual, Simbolo, EstadoSiguiente),
    % Se llama a si misma con el resto de la lista de caracteres (si es que hay) utilizando el siguiente simbolo de la list
    aceptar_aux(Resto, EstadoSiguiente).

% Casos de prueba
prueba1 :- aceptar("ilm"), write('ACCEPTED: ilm'), nl.
prueba2 :- aceptar("ikhut-eigh"), write('ACCEPTED: ikhut-eigh'), nl.
prueba3 :- aceptar("ichwan"), write('ACCEPTED: ichwan'), nl.
prueba4 :- aceptar("idras"), write('ACCEPTED: idras'), nl.
prueba5 :- aceptar("idray"), write('ACCEPTED: idray'), nl.
prueba6 :- \+ aceptar("holaMundo"), write('REJECTED: holaMundo'), nl.
prueba7 :- \+ aceptar("illm"), write('REJECTED: illm'), nl.
prueba8 :- \+ aceptar("idra"), write('REJECTED: idra'), nl.
prueba9 :- \+ aceptar("ikhu"), write('REJECTED: ikhu'), nl.
prueba10 :- \+ aceptar("ichw"), write('REJECTED: ichw'), nl.

% Función para correr todos los casos de prueba
runTests :-
    prueba1, prueba2, prueba3, prueba4, prueba5, prueba6, prueba7, prueba8, prueba9, prueba10.
