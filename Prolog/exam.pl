f([],[]).
f([H|T],[H|S]):- f(T,S).
f([H|T],S):- H mod 2=:=0,f(T,S).

% insert(elem, l1l2...ln) =
% = {elem} U l1l2...ln
% = {l1} U insert(l2...ln, elem)

% insert(L:list, E: element, R: result list)
% (i,i,o)


insert(E,L,[E|L]).
insert(E,[H|T],[H|R]):-
    insert(E,T,R).

% perm(l1l2...ln) =
% = [], if n = 0
% = insert(l1, perm(l2...ln)), otherwise

% perm(L:list, R: result list)
% (i,o)

perm([],[]).
perm([H|T],R1):-
    perm(T,R),
    insert(H,R,R1).

% B. Să se scrie un program PROLOG care generează lista permutărilor mulţimii 1..N,
%    cu proprietatea că valoarea absolută a diferenţei între 2 valori consecutive
%    din permutare este >=2.
%    Se vor scrie modelele matematice și modelele de flux pentru predicatele folosite.

% Exemplu- pentru N=4 ⇒ [[3,1,4,2], [2,4,1,3]] (nu neapărat în această ordine)


% createList(n,i) =
% = [], if i = n + 1
% = {i} U createList(n, i + 1), otherwise

% createList(N:number, I:number, R:list)
% (i,i,o)

createList(N,I,[]):-
    I =:= N + 1.
createList(N,I,[I|R]):-
    I1 is I + 1,
    createList(N,I1,R).

% insert(elem, l1l2...ln) =
% = {elem} U l1l2...ln
% = {l1} U insert(elem,l2...ln)

% insert(E:element, L:list, R:list)
% (i,i,o)

insert(E,L,[E|L]).
insert(E,[H|T],[H|R]):-
    insert(E,T,R).

% perm(l1l2...ln) =
% = [], if n = 0
% = insert(l1,perm(l2...ln)), otherwise

% perm(L:list, R:list)
% (i,o)

perm([],[]).
perm([H|T],R1):-
    perm(T,R),
    insert(H,R,R1).

% absDiff(a,b) =
% = a - b, if a > b
% = b - a, otherwise

% absDiff(A:number, B:number, R:number)
% (i,i,o)

absDiff(A,B,R):-
    A > B,
    !,
    R is A - B.
absDiff(A,B,R):-
    R is B - A.

% checkAbsDiff(l1l2...ln) =
% = true, if absDiff(l1,l2) >= 2
% = checkAbsDiff(l2...ln), if absDiff(l1,l2) >= 2
% = false, otherwise

% checkAbsDiff(L:list)
% (i)

checkAbsDiff([H1,H2]):-
    absDiff(H1,H2,R),
    R < 4.
checkAbsDiff([H1,H2|T]):-
    absDiff(H1,H2,R),
    R < 4,
    !,
    checkAbsDiff([H2|T]).

% oneSol(L:list, R:list)
% (i,o)

oneSol(L,R):-
    perm(L,R),
    checkAbsDiff(R).

allSols(L,R):-
    setof(RPartial, oneSol(L,RPartial),R).

f1([],0).
f1([H|T],S):-
        f1(T,S1),
        S1 is S-H.


arr([H|_],1,[H]).
arr([_|T],K,R):-
    arr(T,K,R).
arr([H|T],K,R1):-
    K>1,
    K1 is K-1,
    arr(T,K1,R),
    insert(H,R,R1).

getProd([],1).
getProd([H|T],R1):-
       getProd(T,R),
      R1 is R*H.

checkProd(L,P):-
    getProd(L,R),
    R=:=P.

oneSolArr(L,K,P,R):-
    arr(L,K,R),
    checkProd(R,P).

allSolsArr(L,K,P,R):-
    setof(RPartial,oneSolArr(L,K,P,RPartial),R).

