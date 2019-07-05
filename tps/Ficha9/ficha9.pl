%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida
% Representacao de conhecimento imperfeito

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- dynamic filho/2.
:- dynamic pai/2.
:- dynamic mae/2.
:- dynamic irmao/2.
:- dynamic nascer/4.
:- op( 900,xfy,'::' ).
:- op( 1100,xfy,'??' ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F,D}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

-filho( F,P ) :-
    nao( filho( F,P ) ),
    nao( excecao( filho( F,P ) ) ).).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% -> Extensao do predicado idade: Pessoa,Idade -> {V,F,D}

idade( joao,21 ).

-idade( P,I ) :-
    nao( idade( P,I ) ),
    nao( excecao( idade( P,I ) ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Explicitacao das situacoes de excecao

% A Belem e filha de uma pessoa de que se desconhece a identidade

filho( belem,xpto023 ).
excecao( filho( F,P ) ) :-
    filho( F,xpto023 ).

% A Maria é filha do Faria ou do Garcia

excecao( filho( maria,faria ) ).
excecao( filho( maria,garcia ) ).

% O Julio tem um filho que ninguem pode conhecer

filho( xpto732,julio ).
excecao( filho( F,P ) ) :-
    filho( xpto732,P ).
nulointerdito( xpto732 ).
+filho( F,P ) :: (solucoes( (Fs,P),(filho(Fs,julio),nao(nulointerdito(Fs))),S ),
                  comprimento( S,N ), N == 0 
                  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado evolucao: Termo -> {V,F}

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a involucao do conhecimento





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% -> Invariante Estrutural:  nao permitir a insercao de conhecimento repetido

+pai( P,F ) :: (solucoes( (P,F),(pai( P,F )),S ),
                  comprimento( S,N ), N == 1
                  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% -> Invariante Referencial: nao admitir mais do que 1 pai para um mesmo individuo

+pai( P,F ) :: (solucoes( (Ps),(pai( Ps,F )),S ),
                  comprimento( S,N ), N =< 1
                  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% -> Invariante Estrutural:  nao permitir a insercao de conhecimento repetido

+mae( M,F ) :: (solucoes( (M,F),(pai( M,F )),S ),
                  comprimento( S,N ), N == 1
                  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% -> Invariante Referencial: nao admitir mais do que 1 mãe para um mesmo individuo

+mae( M,F ) :: (solucoes( (Ms),(pai( Ms,F )),S ),
                  comprimento( S,N ), N =< 1
                  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% -> Invariante Referencial: nao admitir mais do que 2 progenitores
%                         para um mesmo individuo

+filho( F,P ) :: (solucoes( (Ps),(filho( F,Ps )),S ),
                  comprimento( S,N ), N =< 2
                  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% -> Extensao do meta-predicado si: Questao,Resposta -> {V,F}
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
% Precicados Auxliares

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).
