%compute the number of occurences of an element e in a list
%count(l1l2...ln,x)=0,if n=0
%                  =count(l2...kn,x),n>=1,x=\=l1
%                  =1+count(l2...ln,x),if n>=1 and x=l1
%
%count(l1l2...ln,x,Res)
%count(i,i,o),count(i,i,i)

count([],_,0).
count([H|T],X,C):-
    X\=H,
    count(T,X,NC),
    C is NC.
count([H|T],X,C):-
    X=H,
    count(T,X,NC),
    C is NC+1.

%count(l1l2...
