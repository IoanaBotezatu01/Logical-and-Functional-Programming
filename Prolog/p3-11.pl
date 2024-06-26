%11.“Colouring” a map. n countries are given;
%write a predicate to determine all possibilities of
%colouring n countries with m colours,
%such that two adjacent countries not having the same colour.


% getNumbers(N, M, K)
% (i, i)
% getNumbers(N, M) =N,N=<M
%                  =getNumbers(N+1,M)
getNumbers(N, M, K):-
    N =< M,
    K = N.
getNumbers(N, M, K):-
    N < M,
    N1 is N+1,
    getNumbers(N1, M, K).

% colors(M,R)
% (i, o)
% colors(M) = getNumbers(1, M),get all the colors=>all the numbers from
% 1 to m

colors(M,R) :-
    getNumbers(1, M, R).

% combination(N,M,L,R)
% (i, i, i, o) (i, i, i, i)
% combination(N, M, l1l2...ln) =
% = l1l2...ln, if n = 0
% = {colors(l1)}(U)combination(N, M-1, l2...ln)

combination(0, _, L, L).
combination(N, M, T, R) :-
    colors(M, H),
    N1 is N-1,
    combination(N1, M, [H|T], R).

% check(L, C-check, P-prev. number/color,initially 0 => not in 1,M
% (i, i, i)

% check(l1l2..ln, C, P) =
% = true if n=0 and C=0
% = check(l2l3..ln, C, H) if H!=P
% = check(l2l3..ln, 1, H) if H==P

check([], 0, _).
check([H|T], _, P):-
    H is P,
    CN is 1,
    check(T, CN, H).
check([H|T], C, P) :-
    \+ H is P,
    check(T, C, H).

% getlast(L-list, R-element number)
% (i, o) (i, i)

% getlast(l1l2..ln) =
% = l1 if n=1
% = getlast(l2..ln)

getlast([T], T).
getlast([_|T], R):-
    getlast(T, R).

% solution(N-number, M-number, R-result list)
% (i, i, o)

% solution(N, M) =
% = combination(N, M, []), if check(combination(N, M, []), 0, 0)=true and getlast(combination(N, M, [])\{R1})!=combination(N, M, [])[1] (this is a check for the first elem != last elem)

solution(N, M, R) :-
    combination(N, M, [], R),
    check(R, 0, 0),
    getlast(R, HR),
    HR \= R.

colorMap(N, M, R) :-
    findall(P, solution(N, M, P), R).
