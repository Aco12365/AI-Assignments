% reference - https://www.swi-prolog.org/pldoc/man?predicate=reverse/2

member(X,[X|_]).
member(X,[_|L]):-
	member(X,L).

% list reversal - Code recieved from www.swi-prolog.org
reverse(Xs, Ys) :- reverse(Xs, [], Ys, Ys).
reverse([], Ys, Ys, []).
reverse([X|Xs], Rs, Ys, [_|Bound]) :- reverse(Xs, [X|Rs], Ys, Bound).

% Unsafe state where we define the max size or borders of the maze.
unsafe([X,Y]):-
    X < 1; 
    X > 5;
    Y < 1;
    Y > 9.

% Unsafe state where we define all the barriers withen the maze
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

% Define all possible moves 
move([X,Y1],[X,Y2]):- % Move foward 
    Y2 is Y1 + 1.

move([X1,Y],[X2,Y]):- % Move upwards
    X2 is X1 + 1.

move([X,Y1],[X,Y2]):- % Move backwards
    Y2 is Y1 - 1.

move([X1,Y],[X2,Y]):- % Move downwards
    X2 is X1 - 1.

path(S,G,L,L1) :- % DFS that goes though all possible moves
	move(S,S1),
	not( unsafe(S1) ),
	not( member(S1,L) ),
	path(S1, G, [S1|L], L1).	
	%!.						% comment this line to get more than one solution
path(G,G,T,T) :-
	!.
	
solve(From,To, _ ):-
  	path(From,To,[From],L),
    reverse(L,Path),
	write("a solution is: "),
	write(Path). 
solve(_,_,_).