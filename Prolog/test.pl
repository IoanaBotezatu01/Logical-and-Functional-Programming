%max(a,b)=a,a>b
%        =b,a<b
%max(i,i,o)(i,i,i)

max(A,B,A):-
    A>=B.
max(A,B,B):-
    A<B.

%maxList(l1...ln)=l1,n=1
%                =max(l1,maxList(l2...ln),otherwise
%(i,o)
maxList([],[]).
maxList([H],H).
maxList([H|T],R):-
    maxList(T,R1),
    max(H,R1,R).

%posMax(l1...ln,m,pos)=[],n=0
%                     =pos U posMax(l2...ln,m,pos+1),l1=m
%                     =posMax(l1....ln,m,pos+1),otherwise
%(i,i,i,o)(i,i,i,i)

posMax([],_,_,[]).
posMax([H|T],M,Pos,[Pos|R]):-
    H=:=M,
    P1 is Pos+1,
    posMax(T,M,P1,R).
posMax([H|T],M,Pos,R):-
    H=\=M,
    P1 is Pos+1,
    posMax(T,M,P1,R).

%main(l1...ln)=pos(l1...ln,maxList(l1...ln),1)
%(i,o),(i,i)

main(L,R):-
    maxList(L,R1),
    posMax(L,R1,1,R).
