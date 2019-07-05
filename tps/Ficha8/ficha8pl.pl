%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic jogo/3.

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
% Extensao do Predicado Jogo: #idJogo, Arbitro, Ajudas de Custo



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% i) -> Conhecimento Perfeito

jogo( 1,AlmeidaAntunes,500 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% ii) -> Conhecimento Imperfeito Incerto

jogo( 2,BaltazarBorges,xpto1 ).

execao( jogo( I,A,C ) ) :- 
	jogo( I,A,xpto1 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% iii) -> Conhecimento Imperfeito Incerto

execao( jogo( 3,CostaCarvalho,500 ) ).
execao( jogo( 3,CostaCarvalho,2000 ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% iv) -> Conhecimento Imperfeito Incerto

jogo( 4,DuarteDurao,xpto2 ).

execao( jogo( I,A,Ajudas ) ) :-
	Ajudas >= 250, Ajudas =< 750. % ->

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% v) -> Conhecimento Imperfeito Interdito

jogo( 5,EdgarEsteves,xpto3 ).

execao( jogo( I,A,C ) ) :-
	jogo( I,A,xpto3 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% v) -> Invariante, Interdicao

nulo( xpto3 ).
+jogo( I,A,C ) :: ( solucoes( (I,A,Cs),jogo( 5,EdgarEsteves,Cs ),nao(nulo(Cs)),S ), 
						comprimento( S,N ), N==0 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% vi) -> Conhecimento Imperfeito Incerto

jogo( 6,FranciscoFranca,250 ).

execao( jogo( 6,FranciscoFranca,Ajudas ) ) :-
	Ajudas > 5000.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% vii) -> Conhecimento Perfeito, Imperfeito, Impreciso

-jogo( 7,GuerraGodinho,2500 ).

jogo( 7,GuerraGodinho,xpto5 ).

execao( jogo( I,A,C ) ) :- 
	jogo( I,A,xpto5 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% viii) ->  ??????

jogo( 8,HelderHeitor,1000 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% ix) -> Conhecimento Imperfeito Incerto

execao( jogo( 9,IvoInocencio,3000 ) ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Predicados Auxiliares

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).


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



















