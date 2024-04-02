%Write a predicate to test if a list is a set
%count(l1 l2 l3 ... ln-List,e-element)=0,if n=0
%                                     =1+count(l2 ...ln,e),if l1=e
%                                     =count(l2 ...ln),otherwise

%count(L-list,E-elem,R-resulted number of occurences)
%count(i,i,o)

count([],_,0).
count([H|T],E,R1):-
    H=:=E,
    count(T,E,R),
    R1 is R +1.
count([H|T],E,R):-
    H=\=E,
    count(T,E,R).

%isSet(l1 l2....ln-List)=true,if n=0
%                       =false, if count(l1 l2...ln,l1)>1
%                       =isSet(l2...ln),otherwise

%isSet(L-list)
%isSet(i)

isSet([]).
isSet([H|T]):-
    count([H|T],H,R),
    R=:=1,
    isSet(T),!.

% b.Write a predicate to remove the fisrt three occurences of an element
% is a list.If the element occurs less than 3 times,all occurences will
% be removed.
%
% removeElem(l1 l2 ...ln-List,E-elem,C-counter)=[],if n=0
%                                    =removeElem(l2...ln,E,counter-1),if
%                                    count l1=E and counter>0
%                                    ={l1}UremoveElem(l2,,,ln,E,counter),
%                                    otherwise

% removeElem(L-list,E-element,C-counter,R-resulted list)
% (i,i,i,0)

removeElem([],_,[]).
removeElem([H|T],E,R):-
    E=:=H,
    removeElem(T,E,R),!.
removeElem([H|T],E,[H|R]):-
    removeElem(T,E,R).
