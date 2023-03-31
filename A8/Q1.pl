% reference - https://www.swi-prolog.org/pldoc/man?predicate=reverse/2

member(X,[X|_]).
member(X,[_|L]):-
	member(X,L).


position([X,Y],Pos):-
    (X=1,Y=1,Pos is 1);
    (X=1,Y=2,Pos is 2);
    (X=1,Y=3,Pos is 3);
    (X=2,Y=1,Pos is 4);
    (X=2,Y=2,Pos is 5);
    (X=2,Y=3,Pos is 6);
    (X=3,Y=1,Pos is 7);
    (X=3,Y=2,Pos is 8);
    (X=3,Y=3,Pos is 9);
    (Pos is -1).

cordinate(Pos,[X,Y]):-
    (Pos = 1, X is 1, Y is 1);
    (Pos = 2, X is 1, Y is 2);
    (Pos = 3, X is 1, Y is 3);
    (Pos = 4, X is 2, Y is 1);
    (Pos = 5, X is 2, Y is 2);
    (Pos = 6, X is 2, Y is 3);
    (Pos = 7, X is 3, Y is 1);
    (Pos = 8, X is 3, Y is 2);
    (Pos = 9, X is 3, Y is 3);
    (X is -1, Y is -1).

unsafe(Curr):-
    Curr = -1.

% Define all possible moves 
move(Curr,Next):- % Move down twice and right once
    cordinate(Curr,[X,Y]),
    X2 is X + 1,
    Y2 is Y + 2,
    position([X2,Y2],Next).

move(Curr,Next):- % Move down once and right twice
    cordinate(Curr,[X,Y]),
    X2 is X + 2,
    Y2 is Y + 1,
    position([X2,Y2],Next).

move(Curr,Next):- % Move up twice and left once
    cordinate(Curr,[X,Y]),
    X2 is X - 1,
    Y2 is Y - 2,
    position([X2,Y2],Next).

move(Curr,Next):- % Move up once and left twice
    cordinate(Curr,[X,Y]),
    X2 is X - 2,
    Y2 is Y - 1,
    position([X2,Y2],Next).

move(Curr,Next):- % Move down twice and left once
    cordinate(Curr,[X,Y]),
    X2 is X - 1,
    Y2 is Y + 2,
    position([X2,Y2],Next).

move(Curr,Next):- % Move down once and left twice
    cordinate(Curr,[X,Y]),
    X2 is X - 2,
    Y2 is Y + 1,
    position([X2,Y2],Next).

move(Curr,Next):- % Move up twice and right once
    cordinate(Curr,[X,Y]),
    X2 is X + 1,
    Y2 is Y - 2,
    position([X2,Y2],Next).

move(Curr,Next):- % Move up once and right twice
    cordinate(Curr,[X,Y]),
    X2 is X + 2,
    Y2 is Y - 1,
    position([X2,Y2],Next).

path(S,G,L,L1) :- % DFS that goes though all possible moves
	move(S,S1),
	not( unsafe(S1) ),
	not( member(S1,L) ),
	path(S1, G, [S1|L], L1).	
	%!.						% comment this line to get more than one solution
path(G,G,T,T) :-
	!.
	
solve(From,To):-
  	path(From,To,[From],L),
    reverse(L,Path),
	write("a solution is: "),
	write(Path). 
solve(_,_).