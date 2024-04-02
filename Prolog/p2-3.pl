%a. Merge two sorted lists with removing the double value
%Mathematical model
%
%mergeLists(l1 l2 l3...ln,p1 p2 p3...pm)=l1l2....ln,if m=0
%                                       =p1p2...pm,if n=0
%                   ={l1}  mergeLists(l2l3...ln,p1p2...pm),if l1<p1
%                   ={p1} U mergeLists(l1l2..lnn,p2...pm),if l1>.p1
%                   =mergeLists(l2...ln,p1p2...pn),if l1=p1
% mergeLists(l1l2...ln,p1p2...pm,r1r2...rx-Result)
%mergeLists(i,i,o)

mergeLists([],P,P).
mergeLists(L,[],L).
mergeLists([H1|T1],[H2|T2],[H1|R]):-
    H1<H2,
    mergeLists(T1,[H2|T2],R).
mergeLists([H1|T1],[H2|T2],[H2|R]):-
    H1>H2,
    mergeLists([H1|T1],T2,R).
mergeLists([H1|T1],[H2|T2],R):-
    H1=:=H2,
    mergeLists([H1|T1],T2,R).

%b. For a heterogeneous list, formed from integer numbers and list of numbers, merge all sublists with removing
%the double values.
%
%hetList(l1l2...ln)=[],if n=0
%                  =mergeLists(l1,hetList(l2..ln)),if l1 is a list
%                  =hetList(l2...ln),otherwise
%
%hetList(l1l2...ln,R)
%hetList(i,o)

hetList([],[]).
hetList([H|T],R1):-
    is_list(H),
    hetList(T,R),
    mergeLists(H,R,R1).
hetList([_|T],R):-  %if the element is not a list
    hetList(T,R).
