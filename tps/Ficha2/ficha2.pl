%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com numeros

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma de dois valores: X,Y,R -> {V,F}

soma( X,Y,R ) :- R is X+Y. % I

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma de tres valores: X,Y,Z,R -> {V,F}

soma3( X,Y,Z,R ) :- R is X+Y+Z. % II

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado somaC: LN,R -> {V,F}

somaC( [X],X ).
somaC( [H|T],R ) :- somaC( T,R1 ), % III
					R is H+R1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado operacaoArit: X,Y,O,R -> {V,F}

operacaoArit( X,Y,+,R ) :-  R is X+Y. % IV
operacaoArit( X,Y,-,R ) :-  R is X-Y.
operacaoArit( X,Y,*,R ) :-  R is X*Y.
operacaoArit( X,Y,/,R ) :- Y \= 0,
						   R is X/Y.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: X,Y,R -> {V,F}

maior( X,Y,R ) :- X > Y, R is X. % VI
maior( X,Y,Y ).
				
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado do maior de tres valores: X,Y,Z,R -> {V,F}

maior3( X,Y,Z,X ) :- X >= Y , X >= Z. % VII
maior3( X,Y,Z,Y ) :- Y >= X , Y >= Z.
maior3( X,Y,Z,Z ) :- Z >= X , Z >= Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maiorL: L,R -> {V,F}

maiorL( [X],X ). % VIII
maiorL( [X|L],M ) :-
				maiorL( L,R ),
				maior( X,R,M ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado menor: X,Y,R -> {V,F}

menor( X,Y,R ) :- X < Y, R is X.   % IX
menor( X,Y,Y ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado do menor de tres valores: X,Y,Z,R -> {V,F}

menor3( X,Y,Z,X ) :- X <= Y , X <= Z. % X
menor3( X,Y,Z,Y ) :- Y <= X , Y <= Z.
menor3( X,Y,Z,Z ) :- Z <= X , Z = Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado menorL: L,R -> {V,F}

menorL([X],X). % XI
menorL([X|L],M) :-
	menorL(L,R),
	menor(X,R,M).













