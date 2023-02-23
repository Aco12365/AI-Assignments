% reference - https://www.educba.com/prolog-reverse-list/

member(X,[X|_]).
member(X,[_|L]):-
	member(X,L).

list_reverse([],[]).
list_reverse([_First|_Rest],_Reversed):-
list_reverse(rest,_ReversedRest).

unsafe([X,Y]):-
    X < 1;
    X > 5;
    Y < 1;
    Y > 9.
    
unsafe([X,Y]):-
    (X=2,Y=2);
    (X=2,Y=4);
    (X=2,Y=5);
    (X=1,Y=8);
    (X=3,Y=4);
    (X=3,Y=7);
    (X=3,Y=9);
    (X=4,Y=4);
    (X=4,Y=7);
    (X=4,Y=9);
    (X=5,Y=2).

move([X,Y1],[X,Y2]):-
    Y2 is Y1 + 1.

move([X1,Y],[X2,Y]):-
    X2 is X1 + 1.

move([X,Y1],[X,Y2]):-
    Y2 is Y1 - 1.

move([X1,Y],[X2,Y]):-
    X2 is X1 - 1.

path(S,G,L,L1) :- % DFS that goes though all possible moves
	move(S,S1),
	not( unsafe(S1) ),
	not( member(S1,L) ),
    % write(S1),nl,
	path(S1, G, [S1|L], L1).	
	%!.						% comment this line to get more than one solution
path(G,G,T,T) :-
	!.
	
go(S,G):-
  	path(S,G,[S],L),
	write("a solution is: "),
	write(L).
go(_,_).