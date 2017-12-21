parent(pam,bob).
parent(tom,bob).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(tom,liz).

male(bob).
male(tom).
male(jim).

female(pam).
female(liz).
female(ann).
female(pat).

grandparent(X,Z) :- parent(X,Y),parent(Y,Z).

sister(X,Y) :- parent(Z,X),parent(Z,Y),female(X),X\=Y.

mother(X,Y) :- parent(X,Y),female(X).

pred(X,Y) :- parent(X,Y).
pred(X,Y) :- parent(X,Z),pred(Z,Y).

member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

concat([],L,L).
concat([H|T1],L2,[H|T3]) :-
    concat(T1,L2,T3).

delElm(H,[H|T],T).
delElm(X,[H|T1],[H|T2]) :-
    delElm(X,T1,T2).

insert(X,List,BiggerList) :-
    delElm(X,BiggerList,List).
/*
 * NFA
 */
initial(s1).
final(s3).
transition(s1,a,s1).
transition(s1,b,s1).
transition(s1,a,s2).
transition(s2,b,s3).
transition(s3,b,s4).
epslon(s2,s4).
epslon(s3,s4).

accept(S,[]) :- final(S).
accept(S1,[H|T]) :- transition(S1,H,S2),accept(S2,T).
accept(S1,S) :- epslon(S1,S2),accept(S2,S).



