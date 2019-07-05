%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).    % I
filho( jose,manuel ).  % II
filho( carlos,jose ).  % III

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( paulo,filipe ). % IV
pai( paulo,maria ).  % V
pai( P,F ) :- filho( F,P ). % XII

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( antonio,nadia ). % VI
avo( A,N ) :- pai( A,X ) , filho( X,N ). % XIII

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado neto: Neto,Avo -> {V,F}

neto( nuno,ana ). % VII
neto( N,A ) :- avo( A,N ). % XIV

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado genero: Nome,Sexo -> {V,F}

genero( joao,masculino ). % VIII
genero( jose,masculino ). % IX
genero( maria,feminino ). % X
genero( joana,feminino ). % XI

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F} % XV

descendente( D,A ) :- filho( D,A ).
descendente( D,A ) :- neto( D,A ).
descendente( D,A ) :-
    				filho( D,X ),
    				descendente( X,A ).
descendente( D,A ) :-
    				neto( D,X ),
    				descendente( X,A ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F} % XVI
% ProLog não é como Haskell, que é fortemente tipado.

grau( D,A,1 ) :- filho( D,A ).
grau( D,A,2 ) :- neto ( D,A ).
grau( D,A,G ) :- filho( D,X ),
				 grau( X,A,N ),
				 G is N+1.
grau( D,A,G ) :- neto( D,X ),
				 grau( X,A,N ),
				 G is N+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo( A,N ) :- avo( A,X ) , pai( X,N ). % XVIII

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavo: Trisavo,Trisneto -> {V,F}

trisavo( A,N ) :- bisavo( A,X ) , pai( X,N ). % XIX

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado Tetraneto,Tetravo -> {V,F}

tetraneto( N,A ) :- bisavo( A,X ) , bisavo( X,N ). % XX











