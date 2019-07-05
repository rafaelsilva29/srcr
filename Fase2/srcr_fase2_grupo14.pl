%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3ºAno

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% TRABALHO PRÁTICO: EXERCÍCIO 02    2018/2019

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declarações iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

:- op( 900,xfy,'::' ).
:- dynamic utente/4.
:- dynamic prestador/4.
:- dynamic cuidado/4.
:- dynamic excecao/1.
:- dynamic nulo/1.
:- dynamic '-'/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Código comentado - - - -  -  -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Prestador: #idPrest, Nome, Especialidade, Instituição -> {V,F,D}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado utente: ID,N,I,M -> {V,F,D}
% Utente: #idUt, Nome, Idade, Morada -> {V,F,D}

-utente( ID,N,I,M ) :-
    nao( utente( ID,N,I,M ) ),
    nao( excecao( utente( ID,N,I,M ) ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado prestador: ID,N,E,I -> {V,F,D}
% Prestador: #idPrest, Nome, Especialidade, Instituição -> {V,F,D}

-prestador( ID,N,E,I ) :-
    nao( prestador( ID,N,E,I ) ),
    nao( excecao( prestador( ID,N,E,I ) ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado cuidado: D,IDU,IDP,D,C -> {V,F,D}
% Cuidado: Data, #idUt, #idPrest, Descrição, Custo -> {V,F}

-cuidado( D,IDU,IDP,D,C ) :-
    nao( cuidado( D,IDU,IDP,D,C ) ),
    nao( excecao( cuidado( D,IDU,IDP,D,C ) ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a evolucao do conhecimento imperfeito incerto: Termo -> {V,F}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Utente

evolucaoDesconhecidoUtente( utente( ID,N,I,M ) ) :-
    evolucao( utente( ID,N,I,M ) ),
    assert( (excecao( utente( A,B,C,D ) ) :-
                    utente( A,N,C,D  ))
           ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Prestador

evolucaoDesconhecidoPrestador( prestador( ID,N,E,I ) ) :-
    evolucao( prestador( ID,N,E,I ) ),
    assert( (excecao( prestador( A,B,C,D) ) :-
                    prestador( A,N,C,D))
           ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Cuidado

evolucaoDesconhecidoCuidado( cuidado( D,IDU,IDP,D,C ) ) :-
    evolucao( cuidado(D,IDU,IDP,D,C) ),
    assert( (excecao( cuidado( A,B,C,D,E ) ) :-
                    cuidado( A,IDU,C,D,E ))
           ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-- 1. Representar conhecimento positivo e negativo
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Utentes -> Conhecimento Positivo
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

utente( 1 , jose , 22 , braga ).
utente( 2 , rafael , 22 , chaves ).
utente( 3 , afonso , 22 , braga ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Utentes -> Conhecimento Negativo
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

-utente( 4 , duarte , 23 , braga ).
-utente( 5 , luis , 34 , porto ).
-utente( 6 , manuela , 25 ,faro ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Prestador -> Conhecimento Positivo
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

prestador( 1 , manuel , medicinafamiliar , hospitalBraga ).
prestador( 2 , andre , cardiologia , hospitalBraga ).
prestador( 3 , francisco , cardiologia , hospitalBraga ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Prestador -> Conhecimento Negativo
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

-prestador( 4 , afonso , psiquiatria , hospitalBraga ).
-prestador( 5 , duarte , oftalmologia , hospitalPorto ).
-prestador( 6 , manuela , cardiologia , hospitalPorto ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Cuidado -> Conhecimento Positivo
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

cuidado( 31-01-2012 , 10 , 9 , consulta , 34).
cuidado( 23-02-2016 , 1 , 1 , consulta_de_avaliacao ,19).
cuidado( 23-02-2016 , 2 , 4 , consulta_Rotina  , 42).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Cuidado-> Conhecimento Negativo
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

-cuidado( 20-01-2017 , 4 , 5 , consulta_Rotina , 54).
-cuidado( 02-09-2014 , 9 , 2 , consulta_Rotina ,  21).
-cuidado( 23-02-2016 , 2 , 1 , eletrocardiograna ,29).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-- 2. Representar casos de conhecimento imperfeito, pela utilização 
%----- de valores nulos de todos os tipos estudados
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Utentes -> Conhecimento Imperfeito Incerto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

utente( 7 , desconhecido01 , 34 , algarve ).

excecao( utente( ID , N , I , M ) ) :-
	utente( ID , desconhecido01 , I , M ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Utentes ->  Conhecimento Imperfeito Impreciso
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

excecao( utente( 8 , maria , 43 , lisboa ) ).
excecao( utente( 8 , sofia , 43 , lisboa ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Utentes ->  Conhecimento Imperfeito Interdito
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

utente( 9, proibido01 , 56 , aveiro ).

excecao( utente( ID,N,I,M ) ) :-
	utente( ID,proibido01,I,M ).

nulo( proibido01 ).

+utente( ID,N,I,M ) ::
    (solucoes( (	ID , Nome , I , M ),
    (utente( 9 , Nome , 56 , aveiro ),
    nao( nulo( Nome ) ) ), S ),
    comprimento( S , N ),
    N==0).

utente( 10,rui,21,proibido02 ).

excecao( utente( ID , N , I, M ) ) :-
	utente( ID , N , I , proibido02 ).

nulo( proibido02 ).

+utente( ID , N , I ,M ) ::
    (solucoes( ( ID , N , I , Morada ),
    (utente( 10 , rui , 21 , Morada),
    nao( nulo( Morada ) )) , S ),
    comprimento( S , N ),
    N==0 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Prestadores -> Conhecimento Imperfeito Incerto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

prestador( 7 , desconhecido02 , ortopedia , hospitalPorto ).

excecao( prestador( ID , N , E , I ) ) :-
	prestador( ID , desconhecido02 , E , I ).

prestador( 8,sofia,desconhecido03,hospitalPorto ).

excecao( prestador( ID , N , E , I ) ) :-
	prestador( ID , sofia , desconhecido03 , hospitalPorto ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Prestadores -> Conhecimento Imperfeito Impreciso
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

excecao( prestador( 9 , roberto , cirugia , hospitalLisboa ) ).
excecao( prestador( 10 , paulo , podologia , hospitalLisboa ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Prestadores -> Conhecimento Imperfeito Interdito
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

prestador( 11 , proibido03 , ortopedia , hospitalLisboa ).

excecao( prestador( ID , N , E , I ) ) :-
	prestador( ID , proibido03 , E , I ).

nulo( proibido03 ).

+prestador( ID , Nome , E ,I ) ::
    (solucoes(( ID , Nome , E , I ),
    (prestador( 11 , Nome , ortopedia , hospitalLisboa),
    nao( nulo( Nome ) )), S ),
    comprimento( S , N ),
    N==0 ).

prestador( 12 , luisa , proibido04 , hospitalLisboa ).

excecao( prestador( ID , N , E , I ) ) :-
	prestador( ID , proibido04 , E , I ).

nulo( proibido04 ).

+prestador( ID , N , E , I ) ::
    (solucoes(( ID , N , Especialidade , I ),
    ( prestador( 12 , luisa , Especialidade , hospitalLisboa ),
    nao( nulo( Especialidade ) )), S ),
    comprimento( S , N ),
    N==0 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Cuidado -> Conhecimento Imperfeito Incerto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

cuidado( 10-5-2018 , desconhecido03 , 2 , eletrocardiograma , 47 ).

excecao( cuidado( Data , IdUT, IdPrest ,Descri , Custo ) ) :-
    cuidado( Data , desconhecido03 , IdPrest , Descri , Custo ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Cuidado -> Conhecimento Imperfeito Impreciso
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

excecao( cuidado( 2018 , 1 , 3 , chek-Up-completo , 150 ) ).

excecao( cuidado( 2018 , 2 , 3 , chek-Up-completo , 150 ) ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Cuidado -> Conhecimento Imperfeito Interdito
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

cuidado( 2018 , proibido03 , 1 , gripe , 500 ).

excecao( cuidado( Data , IdUT , IdPrest , Descri , Custo ) ):-
    cuidado( Data , proibido03 , IdPrest , Descri , Custo ).

nulo(proibido03).

+cuidado( Data , IdUT , IdPrest , Descri , Custo ) ::
    (solucoes(( Data , IdUT , IdPrest , Descri , Custo ),( cuidado(2018 , IdUT , 1 , gripe , 500),
    nao( nulo( IdUt ) ) ) , S ),
    comprimento( S , N ),
    N==0 ).

cuidado( 2018,3,1,gripe,proibido06).

excecao( cuidado( Data,IdUT,IdPrest,Descri,Custo)) :-
    cuidado( Data , IdUT , IdPrest , Descri , proibido06 ).

nulo( proibido06 ).

+cuidado( Data , IdUT , IdPrest , Descri , Custo ) ::
    (solucoes(( Data , IdUT , IdPrest , Descri , Custo ),
    (cuidado( 2018 , 3 , 1 , gripe , Custo ),
    nao( nulo( Custo ) ) ), S ),
    comprimento( S , N ),
    N==0 ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Invariantes  - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------- Conhecimento Perfeito Positivo e Desconhecido  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Não permitir adicionar quando se tem o conhecimento perfeito negativo oposto

+utente( ID , N , I , M ) :: nao( -utente( ID , N , I , M ) ).

+prestador( ID , N , E , I ) :: nao( -prestador( ID , N , E , I ) ).

+cuidado( D , IDU , IDP , D , C ) :: nao( -cuidado( D , IDU , IDP , D , C ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------- Conhecimento Perfeito Negativo - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Não permitir adicionar se houver o conhecimento positivo perfeito oposto

+(-T) :: nao( T ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Não permitir adicionar conhecimento negativo repetido

+(-T) :: (solucoes( T, (-T) , S ),
        comprimento( S , N ),
        N < 2 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Impossível adicionar excecoes a conhecimento perfeito positivo

+excecao( Termo ) :: nao( Termo ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Nao permitir adicionar conhecimento perfeito positivo repetido, 
% removendo conhecimento desconhecido, se este existir

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Utente

+utente( ID , N , I , M ) :: verificaPerfeitaEvoUtente( ID , N , I , M ).

verificaPerfeitaEvoUtente( ID , N , I , M ) :-
    solucoes( utente( ID , B , I , M ),
    utente( ID , B , I , M) , S ),
    removeDesconhecidoUtente( S ).

verificaPerfeitaEvoUtente( ID , N , I , M ) :-
    solucoes( ( ID , N , I , M ),
    utente( ID , N , I , M ) , S ),
    comprimento( S , N ),
    N==1.

removeDesconhecidoUtente( [ utente( ID , N , I ,M )] ) :-
    demo(utente( ID , e ,I , M ) , desconhecido ),
    removeTermos( [utente( ID , N , I , M ),
    (excecao( utente( A , B , C , D )) :-
            utente( A , N , C , D ))] ).

removeDesconhecidoUtente( [utente( ID , N , I , M)|L] ) :-
    demo(utente( ID , e , I , M ) , desconhecido ),
    removeTermos( [utente( ID , N , I , M ),
    (excecao( utente( A , B , C , D )) :-
            utente( A , N , C , D ))] ).
    
removeDesconhecidoUtente( [X|L] ) :-
    removeDesconhecidoUtente( L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Prestador

+prestador( ID , N , E , I ) :: verificaPerfeitaEvoPrestador( ID , N , E , I ).

verificaPerfeitaEvoPrestador( ID , N , E , I ) :-
    solucoes( prestador( ID , B , E , I ),
    prestador( ID , B , E , I ) , S),
    removeDesconhecidoPrestador( S ).

verificaPerfeitaEvoPrestador( ID , N , E , I ) :-
    solucoes( ( ID , N , E , I ) , prestador( ID , N , E , I ) , S ),
    comprimento( S , N ),
    N==1.

removeDesconhecidoPrestador( [prestador( ID , N , E , I )] ) :-
    demo(prestador( ID , e , E , I ) , desconhecido ),
    removeTermos( [prestador( ID , N , E , I ),
    (excecao( prestador( A , B , C ,D )):-
                prestador( A , N , C , D ))] ).

removeDesconhecidoPrestador( [prestador( ID , N , E , I )|L] ) :-
    demo( prestador( ID , e , E , I ) , desconhecido ),
    removeTermos( [prestador( ID , N , E , I ) , ( excecao( prestador( A , B ,C ,  D )):-
                prestador( A , N , C , D ))] ).

removeDesconhecidoPrestador( [X|L] ) :-
    removeDesconhecidoPrestador( L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Cuidado

+cuidado( D , IDU , IDP , D , C ) :: verificaPerfeitaEvoCuidado( D , IDU , IDP , D , C ).

verificaPerfeitaEvoCuidado( D , IDU , IDP , D , C ) :-
    solucoes( cuidado( D , B , IDP , D , C), cuidado( D , B , IDP , D , C ) , S ),
    removeDesconhecidoCuidado( S ).

verificaPerfeitaEvoCuidado( D , IDU , IDP , D , C) :-
    solucoes( (D , IDU , IDP , D , C ), cuidado( D , IDU , IDP , D , C ) , S ),
        comprimento( S , N ),
        N==1.

removeDesconhecidoCuidado( [cuidado( D , IDU , IDP , D , C )] ) :-
    demo( cuidado( D , e , IDP , D , C ) , desconhecido ),
    removeTermos( [cuidado( D , IDU , IDP , D , C ) , ( excecao( cuidado( D , IDU , IDP , D , C )):-
                cuidado( A , IDU , C , D , E ))] ).

removeDesconhecidoCuidado( [cuidado( D , IDU , IDP , D , C )|L] ) :-
    demo( cuidado( D , e , IDP , D , C ) , desconhecido ),
    removeTermos( [cuidado( D , IDU , IDP , D , C ) , (excecao( cuidado( A , B , C , D , E )):-
                cuidado( A , IDU , C , D , E ))] ).

removeDesconhecidoCuidado( [X|L] ) :-
    removeDesconhecidoCuidado( L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------- Conhecimento Imperfeito Impreciso  - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Apenas deixar adicionar conhecimento positivo se este pertence ao 
%conjunto de conhecimento impreciso e remover o conhecimento impreciso

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Utente

+utente( ID , N , I , M ) :: ( solucoes( B, excecao( utente( ID , B , I , M )) , S ),
                        contem( N , S ),
                        solucoes( excecao( utente( ID , B , I , M )), excecao( utente( ID , B , I , M)) , S2 ),
                        removeTermos( S2 )
                        ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Prestador

+prestador( ID , N , E , I ) :: ( solucoes( B , excecao( prestador( ID , B , E ,I )) , S ),
                        contem( N , S ),
                        solucoes( excecao( prestador( ID , B , E , I )), excecao( prestador( ID , B , E , I )) ,S2),
                           removeTermos( S2 )
                          ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Cuidado

+cuidado( D , IDU , IDP , D , C ) :: ( solucoes( B, excecao( cuidado( D , B , IDP , D , C )) , S ),
                              contem( IDU , S) ,
                              solucoes( excecao( cuidado( D , B , IDP , D , C )), excecao( cuidado( D , B ,IDP, D , C )) , S2 ),
                              removeTermos( S2 )
                             ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------- Conhecimento Desconhecido - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

+(excecao(T)) :: (solucoes( excecao( T ) , excecao( T ) , S ),
                    comprimento( S , N ),
                    N < 2).

+(excecao(-T)) :: (solucoes( excecao( T ),excecao( -T ) , S ),
                    comprimento( S , N ),
                    N < 2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Predicados Auxiliares  - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado solucoes

solucoes( X,Y,Z ) :-
	solucoes( X,Y,Z ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a evolucao do conhecimento perfeito: Termo -> {V,F}

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado removeTermos: [X|L] -> {V, F}

removeTermos( [] ).
removeTermos( [X] ) :-
    retract(X).
removeTermos( [X|L] ) :-
    retract(X),
    removeTermos( L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado insercao: Termo -> {V, F}

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Calcula o comprimento de uma lista
% Extensao do predicado comprimento: L,R -> {V,F}

comprimento([],0).
comprimento([H|T],R) :- comprimento(T,N), R is N+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Testa todos os elementos da lista
% Extensão do predicado teste: [R|LR] -> {V,F}

teste([]).
teste([I|L]) :- I, teste(L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Verifica se contem um elemento numa dado lista
% Extensão do predicado contem: H,[H|T] -> {V, F}

contem(X,[]).
contem(H, [H|T]).
contem(X, [H|T]) :-
    contem(X, T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%------------------------ Demonstradores - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {verdadeiro, falso, desconhecido}

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao, falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demoCada: [Questao],[Resposta] -> {verdadeiro, falso, desconhecido}

demoCada([], []).
demoCada([Questao|T], R) :-
    demo(Questao, X),
    demoCada(T, B),
    R = [X|B]. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demoConj: [Questao | T], Resposta -> {verdadeiro, falso, desconhecido}

demoConj([], verdadeiro).   			% lista vazia -> verdadeiro

demoConj([Questao|T], verdadeiro) :-    % todos verdadeiros -> verdadeiro
    demo(Questao, verdadeiro),
    demoConj(T, verdadeiro).

demoConj([Questao|T], desconhecido) :-  % se cabeça desconhecido e nao há falsos na tail -> desconhecido
    demo(Questao, desconhecido),
    nao( demoConj(T, falso)).

demoConj([Questao|T], desconhecido) :-  % se cabeça nao é falso e na tail o resultado é desconhecido -> desconhecido 
    nao( demo(Questao, falso)),
    demoConj(T, desconhecido).

demoConj([Questao|T], falso) :-		    % se cabeça for falso -> falso
    demo(Questao, falso).

demoConj([Questao|T], falso) :- 		% se tail tiver falsos -> falso
    demoConj(T, falso).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demoDisj: [Questao | T], Resposta -> {verdadeiro, falso, desconhecido}

demoDisj([], falso).            		% lista vazia -> falso

demoDisj([Questao|T], verdadeiro) :- 	% se a cabeça for verdadeira -> verdadeiro
    demo(Questao, verdadeiro).

demoDisj([Questao|T], verdadeiro) :-	% se a tail tiver resultado verdadeiro -> verdadeiro
    demoDisj(T, verdadeiro).

demoDisj([Questao|T], desconhecido) :-	% se a cabeça for desconhecido e a tail tiver resultado nao verdadeiro -> desconhecido
    demo(Questao, desconhecido),
    nao( demoDisj(T, verdadeiro)).

demoDisj([Questao|T], desconhecido) :-	% se a cabeça nao for verdadeiro e a tail tiver resultado desconhecido -> desconhecido
    nao( demo(Questao, verdadeiro)),
    demoDisj(T, desconhecido).

demoDisj([Questao|T], falso) :- 		% se a cabeça for falso e a tail tiver resultado falso -> falso
    demo(Questao, falso),
    demoDisj(T, falso).
