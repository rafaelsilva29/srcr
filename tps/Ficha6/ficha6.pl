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
% Extensao do meta-predicado par: Questao -> {V,F}

par( 0 ).
par( X ) :-
	N is X-2,
	N >= 0,
	par( N ).
-par( X ) :-
	nao( par( X ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado impar: Questao -> {V,F}

impar( 1 ).
impar( X ) :-
	N is X-2,
	N >= 1,
	impar( N ).
-impar( X ) :-
	nao( impar( X ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado de numero naturais: -> {V,F}

natural( 1 ).
natural( X ) :- N is X - 1,
				N > 0,
				natural( N ).
-natural( X ) :-
	nao( natural( X ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado de numero inteiros: -> {V,F}

inteiro( 0 ).
inteiro( X ) :- N is abs( X ), 
                natural( N ).
-inteiro( X ) :-
	nao( inteiro( X ) ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado de cores arco-iris: -> {V,F}

arcoiris(violeta).
arcoiris(vermelho).
-arcoiris(branco).
-arcoiris(preto).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Atravessar a estrada?

atravessar( estrada ) :-
    nao( vem_automovel ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Atravessar a linha de caminho-de-ferro?

atravessar( ferrovia ) :-
    -vem_comboio.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado nodo: N -> {V,F,D}

nodo(a).
nodo(b).
nodo(c).
nodo(d).
nodo(e).
nodo(f).
nodo(g).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado arco: O,D -> {V,F,D}

arco(b,a).
arco(b,c).
arco(c,a).
arco(c,d).
arco(f,g).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado terminal: N -> {V,F,D}

terminal( N ):-
    nodo( N ),
    nao(arco( N,D )).
-terminal( N ):-
    nodo( N ),
    arco( N,D ).




