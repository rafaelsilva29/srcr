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
% Extensao do predicado que verifica se um elemento pertence a uma lista: Lista -> {V,F}

pertence( X, [X|T] ).   % I
pertence( X, [H|T] ) :- 
			X \= H, 
		    pertence( X,T ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que calcula o comprimento de uma lista: Lista -> {V,F}

comprimento( [],0 ).	% II
comprimento( [H|T],R ) :- 
			comprimento( T,R1 ),
			R is R1+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que calcula a quantidade de elmentos diferentes: Lista -> {V,F}

diferentes( [],0 ).		 % III
diferentes( [H|T],R ) :-  
			pertence( H,T ), 
			diferentes( T,R ).  
diferentes( [H|T],R ) :-  
			(\+pertence( H,T )), 
			diferentes( T,TR ),
			R is TR+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que apaga a primeira ocorrenica dum elemento: Lista, Elemento -> {V,F}

apaga1( X,[X|T],T ).    % IV
apaga1( X,[H|T],[H|R] ) :- apaga1( X,T,R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que apaga a ocorrenica dum elemento: Lista, Elemento -> {V,F}

apagaT( X,[],[] ).		% V 
apagaT( X,[H|T],[H|R] ) :- 
			X \= H, 
			apagaT( X,T,R ).
apagaT( X,[H|T],R ) :- 
			apagaT( X,T,R ).       

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que concatena duas listas: Lista, Lista, Lista -> {V,F}

concatenar( [],L2,L2 ).		% VII
concatenar( [H|T],L2,[H|R] ) :- 
			concatenar( T,L2,R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que verifica sublista: Lista, Lista -> {V,F}

sublista( S,L ):-		% IX
	concatenar( X,S,Y ),
	concatenar( Y,Z,L ).










