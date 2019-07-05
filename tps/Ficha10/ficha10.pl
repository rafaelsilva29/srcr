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

%-------------------------------------------------------------------
% Extensao do meta-predicado nao: Questao -> {V,F}

nao(Q):-
  Q,!,fail.
nao(Q).

%-------------------------------------------------------------------
% Extensao do meta-predicado evolucao: Termo -> {V,F}

evolucao(Termo):-
  solucoes(Invariante,+Termo::Invariante,Lista),
  insercao(Termo),
  teste(Lista).

insercao(Termo):-
  assert(Termo).
insercao(Termo):-
  retract(Termo),!,fail.

teste([]).
teste([R|LR]):-
  R,
  teste(LR).

%-------------------------------------------------------------------
% Extensao do meta-predicado involucao: Termo -> {V,F}

involucao(Termo):-
  solucoes(Invariante,-Termo::Invariante,Lista),
  remocao(Termo),
  teste(Lista).

remocao(T):-
  retract(T).

teste([]).
teste([R|LR]):-
  R,
  teste(LR).

%-------------------------------------------------------------------
% Extensao do meta-predicado solucoes: Questao,Resposta -> {V,F}

solucoes(X,Y,Z):-
  findall(X,Y,Z).

%-------------------------------------------------------------------
% Extensao do meta-predicado comprimento: Questao,Resposta -> {V,F}

comprimento(S,N):-
  length(S,N).

%-------------------------------------------------------------------
% Extensão do predicado servico: servico, enfermeira -> {V,F,D}

%------ Conhecimento Perfeito

servico( "Ortopedia","Amelia" ).
servico( "Obstetricia","Ana" ).
servico( "Obstetricia","Maria" ).
servico( "Obstetricia","Mariana" ).
servico( "Geriatria","Sofia" ).
servico( "Geriatria","Susana" ).

%------ Conhecimento Imperfeito Incerto

excecao( servico( xpt007,"Teodora" ) ).

%------ Conhecimento Imperfeito Interdito

excecao( servico( np9,"Zulmira" ) ).
nulo( np9 ).
+servico( S,"Zulmira" ) :- (solucoes((SS,"Zulmira"),(servico(SS,"Zulmira"), nao( nulo( SS ))),L ),
  comprimento( L,C ),
  C==0)

%-------------------------------------------------------------------
% Extensão do predicado atoMedico: ato,enfermeira,utente,data -> {V,F,D}

%------ Conhecimento Perfeito

atoMedico( "Penso","Ana","Joana","sabado" ).
atoMedico( "Gesso","Amelia","Jose","domingo" ).

%------ Conhecimento Imperfeito Incerto

excecao( atoMedico( xpt017,"Mariana","Joaquina","domingo" ) ).

excecao( atoMedico( "Domicilio","Maria", xpt121, xpt251 ) ).

excecao( atoMedico( "Domicilio","Susana",X,"segunda" ) ) :-
                      (X="Joao";X="Jose").

excecao( atoMedico( "Sutura",xpt313,"Josue","segunda" ) ).

excecao( atoMedico( "Sutura",X,"Josefa",Y ) ) :-
                      (X="Maria";X="Mariana"),
                      (Y="terca";Y="sexta").

excecao( atoMedico( "Penso","Ana","Jacinta",X ) ) :-
                      (X="segunda";X="terca";X="quarta";X="quinta";X="sexta").

%-------------------------------------------------------------------
% Impede registos de atos medicos em feriados

feriado( "domingo" ).

+atoMedico( A,M,U,D )::(solucoes((A,M,U,D),(atoMedico(A,M,U,D),feriado(D)),L),
                        comprimento( L,C ),
                        C==0).

%-------------------------------------------------------------------
% Impede remoção de profissionais com atos registados

-servico( S,E ) :: (solucoes( (A),atoMedico(A,E,_,_),L ),
                    comprimento( L,N ),
                    N==0).













