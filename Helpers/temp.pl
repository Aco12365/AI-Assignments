/*
As a wildfire rages through the grasslands, three lions and three wildebeest flee for their lives. 
To escape the inferno, they must cross over to the left bank of a crocodile-infested river. 
The boat can carry up to two animals at a time and it needs at least one lion or wildebeest on the boot 
to cross the river. lions can never outnumber the wildebeest on either side of the river. If the lions 
ever outnumbered the wildebeest on either side of the river, even for a moment, the lions would eat the 
wildebeest. Can you help them figure out how to get across on the one raft available without losing any
lives? 
*/

member(X,[X|_]).
member(X,[_|L]):-
	member(X,L).

opposite(right, left).		% The opposite of Right is Left
opposite(left, right) :-    % The opposite of Left is Right
	!.

unsafe(state(_,L1,W1,L2,W2)):-
    (W1>0,L1>W1);(W2>0,L2>W2).

move(state(right,L1,W1,L2,W2),state(left,A,B,C,D)):- % move 1 lion and 1 wildebeest
    (L1 > 0, W1 > 0),
    A is L1 - 1,
    B is W1 - 1,
    C is L2 + 1,
    D is W2 + 1.

path(S,G,L,L1) :-
	move(S,S1),
	not( unsafe(S1) ),
	not( member(S1,L) ),
	path(S1, G, [S1|L], L1).	
	%!.						% comment this line to get more than one solution
path(G,G,T,T) :-
	!.
	
go(S,G):-
  	path(S,G,[S],L),
	write("a solution is: "),
	write(L).
go(_,_).