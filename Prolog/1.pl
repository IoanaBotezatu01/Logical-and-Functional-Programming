%mult(l-list,k-number,R-return list)
%flow model(i,i,o)
mult([],_,[]).
mult([H|T],k,R):-
    mult(T,k,Res2),
    NewH is H*k,
    R=[NewH|Res2].

%insertsE(i-list,E-element,R-result list)
%flow model(i,i,o) (i,i,i)
insertE([],E,[E]).
insertE([H|T],E,[H|TR]):-
    insertE(T,E,TR).

%suma(L-list,S-sum)
%flow model (i,o) (i,i)
suma([],0).
suma([H|T],S):-
    suma(T,TS),
    S is H+ TS.

