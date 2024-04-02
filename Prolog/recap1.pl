%a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers.
%
%gcd(a,b)=0,a=0
%        =0,b=0
%        =a,a=b
%        =gcd(a-b,b),a>b
%        =gcd(a,b-a),b>a
%gcd(i,i,o)
gcd(0,B,B).
gcd(A,0,A).
gcd(A,B,R):-
    A>=B,
    A1 is A-B,
    gcd(A1,B,R).
gcd(A,B,R):-
    A<B,
    B1 is B-A,
    gcd(A,B1,R).



%lcm(a,b)=a*b/gcd(a,b)

lcm(A,B,R):-
    gcd(A,B,R1),
    R is A*B/R1.

%lcmList(l1....ln)=l1,n=1
%                 =lcm(l1,lcmList(l2...ln)
%lcmList(i,o)

lcmList([E],E).
lcmList([H|T],R):-
    lcmList(T,R1),
    lcm(H,R1,R).

%b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, … element in a list.
%
%pow2(n)=1,n=0
%       =2*pow2(n-1)
%pow2(i,o)
%
pow2(0,1).
pow2(N,R):-
    N1 is  N-1,
    pow2(N1,R1),
    R is R1*2.

%addVal(l1...ln,val,pos,index,Res)=0,n=0
%                                 =l1 U v U
%                                 addVal(l2...ln,val,pos*2,index+1,res),
%                                 pos=index
%                                 =L1 U
%                                 (addval(l2...ln,pos,index+1,res),oth.
%
%addVal(i,i,i,i,o)

addVal([],_,_,_,[]).
addVal([H|T],V,P,I,[H,V|R]):-
    P=:=I,
    P1 is P*2,
    I1 is I+1,
    addVal(T,V,P1,I1,R).
addVal([H|T],V,P,I,[H|R]):-
    P=\=I,
    I1 is I+1,
    addVal(T,V,P,I1,R).

%4!!!!
%
%. Write a predicate to determine the difference of two sets.
%
%isInSet(a,l1...ln)=0,n=0
%                  =1,a=l1
%                  =isinset(a,l2...ln),a!=l1
%isInSet(i,i,o)
isInSet(_,[],0).
isInSet(A,[H|_],1):-
    A=:=H.
isInSet(A,[H|T],R):-
    A=\=H,
    isInSet(A,T,R).





%
%diff(l1...ln,p1...pm)=l1...ln,m=0
%                     =[],n=0
%                     =l1 U diff(l2...ln,p1...pm),isinset(l1,p1...pm)=0
%                     =diff(l2...ln,p1...pm),isinset(l1,p1...pm)=1
%diff(i,i,o)
%
diff([],[_|_],[]).
diff([],[],[]).
diff([H|T],[],[H|R]):-
    diff(T,[],R).
diff([H1|T1],[H2|T2],[H1|R]):-
    isInSet(H1,[H2|T2],R1),
    R1=:=0,
    diff(T1,[H2|T2],R).
diff([H1|T1],[H2|T2],R):-
    isInSet(H1,[H2|T2],R1),
    R1=:=1,
    diff(T1,[H2|T2],R).

%b. Write a predicate to add value 1 after every even element from a list.
%
%add1(l1...ln)=[],n=0
%             =l1 U {1} U add1(l2...ln),l1%2==0
%             =l1 U add1(l2..ln),l1%2=1
%add1(i,0)

add1([],[]).
add1([H|T],[H,1|R]):-
    H1 is H mod 2,
    H1=:=0,
    add1(T,R).
add1([H|T],[H|R]):-
    H1 is H mod 2,
    H1=\=0,
    add1(T,R).

%12!!!!
%a.Write a predicate to substitute in a list a value with all the elements of another list.
%
%move(p1...pm,R)=[],m=0
%               =p1 U move(p2...pm),otherwise
%
move([],[]).
move([H|T],[H|R]):-
    move(T,R).


%
%subs(l1...ln,val,p1...pm)=[],n=0
%                         =p1...pm U subs(l2..ln,val,p1...pm),l1=val
%                         =l1 U subs(l2...ln,val,p1...pm),otherwise
%subs(i,i,i,o),(i,i,i,i)

subs([],_,_,[]).
subs([H1|T1],V,[H2|T2],[R1|R]):-
    H1=:=V,
    move([H2|T2],R1),
    subs(T1,V,[H2|T2],R).
subs([H1|T1],V,[H2|T2],[H1|R]):-
    H1=\=V,
    subs(T1,V,[H2|T2],R).

%b. Remove the n-th element of a list.
%remove(l1...ln,pos,index)=[],n=0
%                 =l1 U remove(l2...ln,pos,index),pos!=index
%                 =remove(l2...ln,pos,index),pos=index
%remove(i,i,i,o),(i,i,i,i)

remove([],_,_,[]).
remove([H|T],P,I,[H|R]):-
    P=\=I,
    I1 is I +1,
    remove(T,P,I1,R).
remove([_|T],P,I,R):-
    P=:=I,
    I1 is I+1,
    remove(T,P,I1,R).

select([],_,_,[]).
select([H|T],P,I,[H|R]):-
    P=:=I,
    I1 is I +1,
    select(T,P,I1,R).
select([_|T],P,I,R):-
    P=\=I,
    I1 is I+1,
    select(T,P,I1,R).


gcdList([E],E).
gcdList([H|T],R):-
    gcdList(T,R1),
    gcd(H,R1,R).

%inlocuieste numerele neprime dintr o lista cu divizorii lor
%
%prim(n,d)=0,n=0,1
%         =0,n>2,n%2=0
%         =0,n%d==0=>prim(n,d+1)
%         =1,d>=n
%
%prim(i,i,o)(i,i,i)

prim(1,_,0).
prim(0,_,0).
prim(N,_,0):-
    N>2,
    N mod 2=:=0.
prim(N,D,1):-
    D>=N.
prim(N,D,0):-
    D<N,
    N1 is N mod D,
    N1=:=0.
prim(N,D,R):-
    D1 is D+1,
    prim(N,D1,R).

%replace(l1...ln)=[],n=0
%                =l1 U replace (l2...ln),prim(l1)=true
%                =d1...dn U replace(l2...ln), prim(l1)=false
%replace(i,0),(i,i)

replace([],[]).
replace([H|T],[H|R]):-
    prim(H,3,R1),
    R1=:=1,
    replace(T,R).
replace([1],[1]).
replace([H|T],[L|R]):-
    prim(H,3,R1),
    R1=:=0,
    getDivisors(H,2,L),
    replace(T,R).

%getDivisors(n,d,R)=[],d>n
%                  =[n/d],n%d==0
%                  =getDivisors(n,d+1,r),otherwise
%(i,i,o),(i,i,i)

getDivisors(N,D,[]):-
    D>=N.
getDivisors(N,D,[D|R]):-
    R1 is N mod D,
    R1=:=0,
    D1 is D+1,
    getDivisors(N,D1,R).
getDivisors(N,D,R):-
    R1 is N mod D,
    R1=\=0,
    D1 is D+1,
    getDivisors(N,D1,R).
