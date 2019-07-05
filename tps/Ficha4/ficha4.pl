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
% Extensao do predicado de pares: -> {V,F}

par( 2 ).
par( X ) :- N is X - 2,
			N >= 2,
			par( N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado de impares: -> {V,F}

impar( 1 ).
impar( X ) :- N is X - 2,
			  N >= 1,
			  impar( N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado de numero naturais: -> {V,F}

natural( 1 ).
natural( X ) :- N is X - 1,
				N > 0,
				natural( N ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado de numero inteiros: -> {V,F}

inteiro( 0 ).
inteiro( X ) :- N is abs( X ), 
                natural( N ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado de numero primo: -> {V,F}

primo( 1 ).
primo( X ) :- L1 is divisores( X ), comprimento( L1 ) =:= 2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado de divisores: -> {V,F}

divisores( X,NL ) :- XX IS X // 2,
					 divisores( X,XX,[1], NL ).
divisores( X,1,[H|T],[H|T]).
divisores( X,Y,[H|T],[Y|L] ) :- Y > 1,
								X mod Y =:= 0,
								YY is Y-1,
								divisores( X,XY,[H|T],L ).
divisores( X,Y,[H|T],L ) :- Y > 1,
							X mod Y =\= 0,
							YY us Y - 1,
							divisores( X,YY,[H|T],L ). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado de comprimento: -> {V,F}

comprimento([],0).
comprimento([H|T],R) :- comprimento(T,N),
                        R is N+1.


















