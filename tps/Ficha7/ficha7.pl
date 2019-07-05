%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado si: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

si( Questao,verdadeiro ) :-
    Questao.
si( Questao,falso ) :-
    -Questao.
si( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado morcego: A -> {V,F,D}

morcego(batemane).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pinguim: A -> {V,F,D}

pinguim(pingu).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avestruz: A -> {V,F,D}

avestruz(trux).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado cao: A -> {V,F,D}

cao(boby).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado canario: A -> {V,F,D}

canario(twetty).
canario(piupiu).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado voa: A -> {V,F,D}

-voa(tweety).
voa( A ) :-
	ave( A ), nao( execao( voa( A ) ) ).
voa( A ) :- 
	execao( -voa( A ) ).
voa( A ) :-
	execao( -voa( A ) ).

-voa( A ) :-
	mamifero( A ), nao( execao( -voa( A ) ) ).
-voa( A ) :- 
	execao( voa( A ) ).


execao( voa( A ) ) :- 
	avestruz( A ).
execao( voa( A ) ) :- 	
	mamifero( A ).
execao( -voa( A ) ) :- 	
	morcego( A ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ave: A -> {V,F,D}

ave(pitigui).
ave(A):-
    canario(A).
ave(A):-
    avestruz(A).
ave(A):-
    pinguim(A).
-ave(A):-
    mamifero(A).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado mamifero: A -> {V,F,D}

mamifero(silvestre).
mamifero(A):-
    cao(A).
mamifero(A):-
    gato(A).
mamifero(A):-
    morcego(A).
-mamifero(A):-
    ave(A).




