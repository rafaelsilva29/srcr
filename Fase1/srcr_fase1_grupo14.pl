%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3ºAno

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% TRABALHO PRÁTICO: EXERCÍCIO 01    2018/2019

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declarações iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

:- op( 900,xfy,'::' ).
:- dynamic utente/4.
:- dynamic servico/4.
:- dynamic consulta/4.

solucoes(T,Q,S) :- findall(T,Q,S).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%----------------------- Base de Conhecimento  - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Utente ----------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Utente: #idUt, Nome, Idade, Cidade -> {V,F}

utente(1, jose, 22, braga).
utente(2, rafael, 22, chaves).
utente(3, afonso, 22, braga).
utente(4, duarte, 23, braga).
utente(5, luis, 34, porto).
utente(6, manuela, 25, faro).
utente(7, maria, 34, algarve).
utente(8, sofia, 43, lisboa).
utente(9, daniel, 56, aveiro).
utente(10, rui, 21, barcelos).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Serviço ---------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Serviço: #idServ, Descrição, Instituição, Cidade -> {V,F}

servico(1, ortopedia, hospitalBraga, braga).
servico(2, cardiologia, hospitalBraga, braga).
servico(3, clinicaGeral, hospitalBraga, braga).
servico(4, psiquiatria, hospitalBraga, braga).
servico(5, oftalmologia, hospitalPorto, porto).
servico(6, cardiologia, hospitalPorto, porto).
servico(7, ortopedia, hospitalPorto, porto).
servico(8, otorrinolaringologia, hospitalPorto, porto).
servico(9, cirugia, hospitalLisboa, lisboa).
servico(10, podologia, hospitalLisboa, lisboa).
servico(11, ortopedia, hospitalLisboa, lisboa).
servico(12, cardiologia, hospitalLisboa, lisboa).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%-------- Consulta --------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Consulta: Data, #idUt, #idServ, Custo -> {V,F}

consulta(23-02-2016, 1, 3, 23).
consulta(23-02-2016, 2, 4, 42).
consulta(20-01-2017, 4, 5, 54).
consulta(02-09-2014, 9, 2, 21).
consulta(31-01-2012, 10, 9, 34).
consulta(29-11-2014, 2, 8, 12).
consulta(20-05-2018, 5, 12, 55).
consulta(19-03-2017, 4, 7, 33).
consulta(21-02-2012, 5, 8, 12).
consulta(13-03-2018, 4, 10, 90).
consulta(31-03-2014, 9, 12, 39).
consulta(05-08-2014, 6, 2, 54).
consulta(09-10-2013, 3, 3, 54).
consulta(21-04-2018, 2, 11, 35).
consulta(26-04-2010, 9, 2, 29).
consulta(30-01-2012, 3, 7, 43).
consulta(18-02-2016, 5, 6, 67).
consulta(15-05-2016, 8, 5, 65).
consulta(03-12-2016, 9, 8, 24).
consulta(07-11-2016, 10, 9, 42).
consulta(25-12-2016, 4, 1, 25).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Predicados Solicitados - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------- 1. Registar utentes, serviços e consultas   -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Faz a insercao de conhecimento
% Extensão do predicado que permite a evolucao do conhecimento: Termo -> {V,F}


evolucao( Termo ) :-
  solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ), 
      teste( Lista ).

insercao( Termo) :-
        assert( Termo ).
insercao( Termo) :-
        retract( Termo ),!,fail.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------- 2. Remover utentes, serviços e consultas  -  -  -  -  -   - 
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Faz a removoção de conhecimento
% Extensão do predicado que permite a involucao do conhecimento: Termo -> {V,F}

involucao( Termo ) :-
    solucoes( Invariante, -Termo::Invariante, Lista ),
      remocao( Termo ),
        teste( Lista ).

remocao( Termo ):-
        retract( Termo ).
remocao( Termo ):-
        assert( Termo ),!,fail.

%--------------------------------- - - - - - - - - - -  -  -  -  -  -
%----- 3. Identificar as instituições prestadoras de serviços -  -  -
% Serviço: #idServ, Descrição, Instituição, Cidade -> {V,F}
%--------------------------------- - - - - - - - - - -  -  -  -  -  -

% Identifica instituições prestadoras de Serviços
% Extensao do predicado listarInstituicoes: ListaDeResultados -> {V,F}

listarInstituicoes( L ) :-
solucoes( Instituicao,servico(X,Y,Instituicao,W),R ),
diferentes(R,L).

%--------------------------------- - - - - - - - - - - -  -  -  -  -  -
%----- 4. Identificar utentes por critérios de seleção -  -  -  -  -  -
%----------------- > Nome
%----------------- > Idade
%----------------- > Cidade
%----------------- > IdUtente
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes pelo Nome
% Extensao do predicado listarUtenteNome: Nome, ListaDeResultados -> {V,F}

listarUtenteNome(Nome,R):-
solucoes((X,Nome,Z,W),utente(X,Nome,Z,W),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes pela Idade
% Extensao do predicado listarUtenteIdade: Idade, ListaDeResultados -> {V,F}

listarUtenteIdade(Idade,R):-
solucoes((X,Y,Idade,W),utente(X,Y,Idade,W),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes pela Cidade
% Extensao do predicado listarUtenteCidade: Cidade, ListaDeResultados -> {V,F}

listarUtenteCidade(Cidade,R):-
solucoes((X,Y,Z,Cidade),utente(X,Y,Z,Cidade),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes por Nome e Idade
% Extensao do predicado listarUtenteNomeIdade: Nome, Idade, ListaDeResultados -> {V,F}

listarUtenteNomeIdade(Nome,Idade,R):-
solucoes((X,Nome,Idade,W),utente(X,Nome,Idade,W),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes por Nome e Cidade
% Extensao do predicado listarUtenteNomeCidade: Nome, Cidade, ListaDeResultados -> {V,F}

listarUtenteNomeCidade(Nome,Cidade,R):-
solucoes((X,Nome,Z,Cidade),utente(X,Nome,Z,Cidade),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes por idade e cidade
% Extensao do predicado listarUtenteIdadeCidade: Idade, Cidade, ListaDeResultados -> {V,F}

listarUtenteIdadeCidade(Idade,Cidade,R):-
solucoes((X,Y,Idade,Cidade),utente(X,Y,Idade,Cidade),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes por nome, idade e cidade
% Extensao do predicado listarUtenteNomeIdadeCidade: Nome, Idade, Cidade, ListaDeResultados -> {V,F}

listarUtenteNomeIdadeCidade(Nome,Idade,Cidade,R):-
solucoes((X,Nome,Idade,Cidade),utente(X,Nome,Idade,Cidade),R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identifica utentes por id
% Extensao do predicado listarUtenteID: IdUtente,ListaDeResultados -> {V,F}

listarUtenteIdUtente(IdUtente,R):-
solucoes((IdUtente,N,I,C),utente(IdUtente,N,I,C),R).

%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -
%-- 5. Identificar serviços realizados por critérios de seleção 
%----------------- > Instituicao
%----------------- > Cidade
%----------------- > Data
%----------------- > Custo
%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Lista os servicos realizados por instituição
% Extensao do predicado servicosPorInstituicao: Instituicao, ListaDeResultados -> {V,F} 

servicosPorInstituicao( I,R ):-
    solucoes(( ID,D,I,C ), servico( ID,D,I,C ), R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Lista os servicos realizados por cidade
% Extensao do predicado servicosPorCidade: Cidade, ListaDeResultados -> {V,F} 

servicosPorCidade( C,R ):-
    solucoes(( ID,D,I,C ), servico( ID,D,I,C ), R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Lista os servicos realizados por data
% Extensao do predicado servicosPorData: Data, ListaDeResultados -> {V,F} 

servicosPorData( D,R ):-
    solucoes(IdS, consulta(D,IdU,IdS,C ), S),
    servicosPorDataRec(S,R).

servicosPorDataRec([],[]).
servicosPorDataRec([H|T],R):-
    solucoes(( H,D,I,C ),servico( H,D,I,C ), L1),
    servicosPorDataRec(T,L2),
    concatenar(L1,L2,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Lista os servicos realizados por custo
% Extensao do predicado servicosPorCusto: Custo, ListaDeResultados -> {V,F}

servicosPorCusto( C,R ):-
solucoes(IdS, consulta(D,IdU,IdS,C ), S),
servicosPorCustoRec(S,R).

servicosPorCustoRec([],[]).
servicosPorCustoRec([H|T],R):-
solucoes(( H,D,I,Cid ),servico( H,D,I,Cid ), L1),
servicosPorCustoRec(T,L2),
concatenar(L1,L2,R).

%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -
%-- 6. Identificar os utentes de um serviço/instituição
%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece os utentes de uma instituição
% Extensao do predicado utentesDeInstituicao: P,U -> {V,F} 

utentesDeInstituicao(P,U) :- 
  solucoes(ID,servico(ID,DE,P,CI),NL),
  diferentes(NL,OUT),
  utInsAux(OUT,U).

utInsAux([],[]).
utInsAux([H|T],S) :-
 	solucoes((H,Y,W,Z),utente(H,Y,W,Z),NL),
 	concatenar(N,NL,S),
 	utInsAux(T,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece os Ids das instituições que disponibilizam um dado serviço
% Extensao do predicado instituicaoServico: Serviço,Instituição -> {V,F} 

instituicaoServico(S,I) :-
  solucoes(ID, servico(ID,S,INS,CI), I).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece os Ids dos utentes de um serviço
% Extensao do predicado utentesEspecialidade: I,S -> {V,F} 

utentesServico(S,U) :-
	instituicaoServico(S,P),
	utentesHospital(P,UT),
	diferentes(UT,OUT),
	utenServAux(OUT,U).

utenServAux([],[]).
utenServAux([ID|T],S) :-
    solucoes((ID,NO,I,CI),utente(ID,NO,I,CI),NL),
    concatenar(N,NL,S),
    utenServAux(T,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - 
% Fornece a lista dos Ids dos utentes que receberam cuidados dos hospitais cujos Ids estão contidos no Input
% Extensao do predicado utentesHospital: ListaInstituição,ListaUtentes -> {V,F} 

utentesHospital([],[]).
utentesHospital([H|T],S) :-
	solucoes(X,consulta(A,X,H,D),NL),
	concatenar(N,NL,S),
  utentesHospital(T,N).

%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -
%-- 7. Identificar serviços realizados por critérios de seleção
%----------------- > Utente
%----------------- > Instituicao
%----------------- > Cidade
%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Dado um ID de utente, indica a lista dos serviços que já realizou
% Extensao do predicado servicosRealizadosUtente : Utente,Servicos -> {V,F} 

servicosRealizadosUtente( Utente,Servico ):-
  	solucoes(IdS, consulta(Data,Utente,IdS,Custo), Consultas),
  	servicosRUtenteAux(Consultas,Servico).

servicosRUtenteAux( [],[] ).
servicosRUtenteAux([ID|T],R):-
	solucoes((ID,Descricao,Instituicao,Cidade), servico(ID,Descricao,Instituicao,Cidade), L1),
	servicosRUtenteAux(T,L2),
	concatenar(L1,L2,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece a lista dos serviços realizados por instituição
% Extensao do predicado servicosRealizadosInstituicao : Instituicao ,R -> {V,F} 

servicosRealizadosInstituicao( Instituicao,R ):-
  solucoes(ID, servico(ID,Descricao,Instituicao,Cidade), S),
  servicosRealizadosInstituicaoAuxConsulta(S,R1),
  servicosRealizadosInstituicaoAuxServico(R1,R).

servicosRealizadosInstituicaoAuxConsulta( [],[] ).
servicosRealizadosInstituicaoAuxConsulta([H|T],R):-
  solucoes(H, consulta(D,I,H,C), L1),
  servicosRealizadosInstituicaoAuxConsulta(T,L2),
  concatenar(L1,L2,R).

servicosRealizadosInstituicaoAuxServico([],[]).
servicosRealizadosInstituicaoAuxServico([H|T],R):-
  solucoes((H,D,I,C), servico(H,D,I,C), L1),
  servicosRealizadosInstituicaoAuxServico(T,L2),
  concatenar(L1,L2,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece a lista dos serviços realizados por cidade
% Extensao do predicado servicosRealizadosCidade : Cidade ,R -> {V,F} 

servicosRealizadosCidade( C,R ):-
  solucoes(IdS, consulta(D,U,IdS,Custo), S),
  diferentes(S,S1),
  servicosRCidadeAux(C,S1,R).

servicosRCidadeAux( C,[],[] ).
servicosRCidadeAux( C, [H|T], R):-
  solucoes((H,D,I,C), servico(H,D,I,C), L1),
  servicosRCidadeAux(C,T,L2),
  concatenar(L1,L2,R).

%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -   -    -    -
%-- 8. Calcular o custo total dos cuidados de saúde por critérios de seleção
%----------------- > Utente
%----------------- > Servico
%----------------- > Instituicao
%----------------- > Data
%--------------------------------- - - - - - - - - - - -  -  -  -  -  -   -   -   -    -    -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Custo total associado a um utente
% Extensao do predicado custoUtente: IdUtente,R -> {V,F}        

custoUtente(I,R) :-
  solucoes(C,consulta(D,I,IdS,C),L),
  somaC(L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Custo total associado a um serviço
% Extensao do predicado custoServico: Servico,R -> {V,F}   

custoServico( S,R ):-
  solucoes(C,consulta(D,I,S,C),L),
  somaC(L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Custo total associado a uma instituição
% Extensao do predicado custoInstituicao: Instituicao,R -> {V,F}        

custoInstituicao(I,R) :-
  solucoes(ID,servico(ID,D,I,Cid),L),
  custoInstituicaoAux(L,Y),
  somaC(Y,R).

custoInstituicaoAux( [],[] ).
custoInstituicaoAux([H|T],R):-
  solucoes(C,consulta(D,I,H,C),L1),
  custoInstituicaoAux(T,L2),
  concatenar(L1,L2,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Custo total associado a uma data
% Extensao do predicado custoData: Data,R -> {V,F} 

custoData(D,R):-
  solucoes(C,consulta(D,I,IdS,C),L),
  somaC(L,R).

%--------------------------------- - - - - - - - - - - -  -  -  -  -  -
%--------------------------------- - - - - - - - - - - -  -  -  -  -  -
%------------------- Novas Funcionalidades - - - - - - -  -  -  -  -  -
%--------------------------------- - - - - - - - - - - -  -  -  -  -  -
%--------------------------------- - - - - - - - - - - -  -  -  -  -  -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Média de idade de todos os utentes
% Extensao do predicado mediaIdadesUtentes: R -> {V,F}

mediaIdadeUtentes( R ) :-
        solucoes( I,utente(_,_,I,_),S ),
        media( S,R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Dá a media de idades correspondentes aos utentes com a morada dada
% Extensao do predicado mediaIdades_morada: Morada,R -> {V,F}

mediaIdadePorMorada( M,R ) :-
        solucoes( ID, utente(_,_,ID,M),S ),
        media( S,R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Dá o numero de servicos correspondente a uma instituiçao
% Extensao do predicado servicosNporInstituicao: Instituicao,R -> {V,F}

servicosNPorInstituicao( I,R ) :-
        solucoes( I, servico(_,_,I,_),S ),
        comprimento( S,R ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece o número de utentes por instituição
% Extensao do predicado nUtentesInstituicao: Instituicao,R -> {V,F}

utentesNPorInstituicao( I,R ) :-
        utentesDeInstituicao( I,L ),
        comprimento( L,R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece o número de consultas por instituicao
% Extensao do predicado consultasNPorInstituicao Instituicao,R -> {V,F}

consultasNPorInstituicao( I,R ) :-
        solucoes( ID, servico(ID,_,I,_),S ),
        consultasPorServico( S,L ),
        comprimento( L,R ).

consultasPorServico( [],[] ).
consultasPorServico( [H|T],R ) :-
        solucoes((A,B,H,C), consulta(A,B,H,C),L1 ),
        consultasPorServico( T,L2 ),
        concatenar( L1,L2,R ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Fornece o número de consultas por especialidade
% Extensao do predicado consultasNPorEspecialidade Especialidade,Resultado -> {V,F}
% Serviço: #idServ, Descrição, Instituição, Cidade -> {V,F}
% Consulta: Data, #idUt, #idServ, Custo -> {V,F}

consultasNPorEspecialidade( E,R ) :-
        solucoes( ID, servico(ID,E,I,C),S ),
        consultasPorIDsServico( S,L ),
        comprimento( L,R ).


consultasPorIDsServico( [],[] ).
consultasPorIDsServico( [H|T],R ) :-
        solucoes((D,B,H,C), consulta(D,B,H,C),L1 ),
        consultasPorIDsServico( T,L2 ),
        concatenar( L1,L2,R ).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Invariantes  - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Utente --- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercão de numero de utente repetido

+utente( ID,_,_,_ ) :: (solucoes( (ID), (utente( ID,_,_,_ )),S ),
                        comprimento( S,N ), 
                          N == 1 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a remoção de utente caso exista consulta associado

-utente( ID,_,_,_ ) :: (solucoes( (ID), consulta( _,ID,_,_ ),S ),
                        comprimento( S,N ),
                           N == 0 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Serviço -- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a inserçao de número de serviço repetido

+servico( ID,_,_,_ ) :: (solucoes( (ID), (servico( ID,_,_,_ )),S ),
                        comprimento( S,N ), 
                          N == 1 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a remoção de serviço caso exista consulta associado

-servico( ID,_,_,_ ) :: (solucoes( (ID), consulta( _,_,ID,_ ),S ),
                         comprimento( S,N ),
                           N == 0 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Consulta - - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de consulta repetido

+consulta( X,Y,Z,W ) :: (solucoes( (X,Y,Z,W),(consulta( X,Y,Z,W )),S ),
                          comprimento( S,N ), 
                            N == 1 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de custo negativo em consulta

+consulta( _,_,_,C ) :: (solucoes( (C),consulta( _,_,_,C ),S ),
                            naoNegativo( S )).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de consulta com utente inexistente

+consulta( _,ID,_,_,_ ) :: (solucoes( (ID),(utente(ID,_,_,_ )),S ),
                            contem( ID,S )).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de consulta com servico inexistente

+consulta( _,_,ID,_,_ ) :: (solucoes( (ID),(servico( ID,_,_,_ )),S ),
                              contem( ID,S )).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%---------------------- Predicados Auxiliares  - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% remove os elementos repetidos de uma lista
% Extensao do predicado diferentes: L1, L2 -> {V,F}

diferentes( [],[] ).
diferentes( [X|L],[X|NL] ) :- removerElemento( L,X,TL ), diferentes( TL,NL ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% remove um elemento de uma lista
% Extensao do predicado removerElemento: L1, Y, L2 -> {V,F}

removerElemento( [],_,[] ).
removerElemento( [X|L],X,NL ) :- removerElemento( L,X,NL ).
removerElemento( [X|L],Y,[X|NL] ) :- X \== Y, removerElemento( L,Y,NL ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Soma os elementos de uma lista
% Extensao do predicado somaC : LN,R -> {V,F}

somaC([X],X).
somaC([X|L],R):- somaC(L,RL), R is X+RL.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% concatena duas listas
% Extensao do predicado concatenar: L1,L2,L3 -> {V,F}  

concatenar( [],L,L ).
concatenar( [H|T],L2,[H|L] ) :- concatenar(T,L2,L).

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
% Verifica se todos os elementos da lista são não negativos
% Extensao do predicado naoNegativo: L -> {V,F}  

naoNegativo([]).
naoNegativo([H|T]) :- H>=0, naoNegativo(T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Verifica se contem um elemento numa dado lista
% Extensão do predicado contem: H,[H|T] -> {V, F}

contem(H, [H|T]).
contem(X, [H|T]) :- contem(X, T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Faz a media de uma lista
% Extensao do predicado media: L,R -> {V,F}

media([H|T],S) :- somaC([H|T],S1), comprimento([H|T],S2), S is S1/S2.
