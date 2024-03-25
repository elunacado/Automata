%estado inicial
estado_inicial(start).
%--------------------

%estados de exito
estado_exito(q3). %ilm
estado_exito(q12). %ikhut-eigh
estado_exito(q17). %ichwan
estado_exito(q21). %idras
estado_exito(q22). %idray
%--------------------

% movernos a traes del automata
% move(from, with, to)

%iniciamos con i en todas
move(start, i, q1).

%caso de ilm
move(q1, l, q2).
move(q2, m, q3).

%caso de ikhut-eigh
move(q1, k ,q4).
move(q4, h ,q5).
move(q5, u ,q6).
move(q6, t ,q7).
move(q7, - ,q8).
move(q8, e ,q9).
move(q9, i ,q10).
move(q10, g ,q11).
move(q11, h ,q12).

%caso de ichwan
move(q1, c, q13).
move(q13, h, q14).
move(q14, w, q15).
move(q15, a, q16).
move(q16, n, q17).

%Caso de idray e idras
move(q1, d, q18).
move(q18, r, q19).
move(q19, a, q20).

%cambio a idras
move(q20, s, q21).

%cambio a idray
move(q20, y, q22).

% codigo de aceptación()
%recibe un string entre comillas
aceptar(String) :-
    %separo el string por caracteres
    string_chars(String, ListaCaracteres),
    %llamo al estado inicial start
    estado_inicial(start),
    %le paso a la funcion auxiliar la lista de caracteres y el estado inicial
    aceptar_aux(ListaCaracteres, start).

aceptar_aux([], EstadoActual) :-
    %comprueba el estado inicial cuando se vacia la lista y nos da el resultado de true|false
    estado_exito(EstadoActual).

aceptar_aux([Simbolo|Resto], EstadoActual) :-
    % En caso de que todavia tenga contenido la lista de caracteres se mueve a traves del automata con el simbolo como trayecto
    move(EstadoActual, Simbolo, EstadoSiguiente),
    % Se llama a si misma con el resto de la lista de caracteres (si es que hay) utilizando el siguiente simbolo de la list
    aceptar_aux(Resto, EstadoSiguiente).

% Casos de prueba
prueba_aceptada1 :- aceptar("ilm"), write('ACEPTADO: ilm'), nl.
prueba_aceptada2 :- aceptar("ikhut-eigh"), write('ACEPTADO: ikhut-eigh'), nl.
prueba_aceptada3 :- aceptar("ichwan"), write('ACEPTADO: ichwan'), nl.
prueba_aceptada4 :- aceptar("idras"), write('ACEPTADO: idras'), nl.
prueba_aceptada5 :- aceptar("idray"), write('ACEPTADO: idray'), nl.

prueba_rechazada1 :- \+ aceptar("holaMundo"), write('RECHAZADO: holaMundo'), nl.
prueba_rechazada2 :- \+ aceptar("illm"), write('RECHAZADO: illm'), nl.
prueba_rechazada3 :- \+ aceptar("idra"), write('RECHAZADO: idra'), nl.
prueba_rechazada4 :- \+ aceptar("ikhu"), write('RECHAZADO: ikhu'), nl.
prueba_rechazada5 :- \+ aceptar("ichw"), write('RECHAZADO: ichw'), nl.

% Función para correr todos los casos de prueba
runTests :-
    prueba_aceptada1, prueba_aceptada2, prueba_aceptada3, prueba_aceptada4, prueba_aceptada5,  
    prueba_rechazada1, prueba_rechazada2, prueba_rechazada3, prueba_rechazada4, prueba_rechazada5.