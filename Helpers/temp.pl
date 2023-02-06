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
unsafe(state(_,L1,W1,L2,W2)):-
    L1<0;
    L2<0;
    W1<0;
    W2<0.

move(state(right,L1,W1,L2,W2),state(left,A,B,C,D)):- % move 1 lion and 1 wildebeast from right to left side of bank  CHECK
    (L1 > 0, W1 > 0),
    A is L1 - 1,
    B is W1 - 1,
    C is L2 + 1,
    D is W2 + 1.

move(state(left,L1,W1,L2,W2), state(right,A,B,C,D)):- % move 1 lion and 1 wildabeast from left to right side of bank CHECK
    (L2 > 0, W2 > 0),
    A is L1 + 1,
    B is W1 + 1,
    C is L2 - 1,
    D is W2 - 1.

move(state(right,L1,W1,L2,W2),state(left,A,W1,C,W2)):- % move 1 lion from right to left side of bank CHECK
    (L1 > 0),
    A is L1 - 1,
    C is L2 + 1.

move(state(right,L1,W1,L2,W2),state(left,A,W1,C,W2)):- % move 2 lions from right to left side of bank CHECK
    (L1 > 1),
    A is L1 - 2,
    C is L2 + 2.

move(state(right,L1,W1,L2,W2),state(left,L1,B,L2,D)):- % move 1 wildebeast from right to left side of bank CHECK
    (W1 > 0),
    B is W1 - 1,
    D is W2 + 1.

move(state(right,L1,W1,L2,W2),state(left,L1,B,L2,D)):- % move 2 wildebeest from right to left side of bank CHECK
    (W1 > 1),
    B is W1 - 2,
    D is W2 + 2.

move(state(left,L1,W1,L2,W2),state(right,A,W1,C,W2)):- % move 1 lion from left to right side of bank CHECK
    (L2 > 0),
    A is L1 + 1,
    C is L2 - 1.

move(state(left,L1,W1,L2,W2),state(right,A,W1,C,W2)):- % move 2 lion from left to right side of bank CHECK
    (L2 > 1),
    A is L1 + 2,
    C is L2 - 2.

move(state(left,L1,W1,L2,W2),state(right,L1,B,L2,D)):- % move 1 wildabeast from left to right side of bank CHECK
    (W1 > 0),
    B is W1 + 1,
    D is W2 - 1.

move(state(left,L1,W1,L2,W2),state(right,L1,B,L2,D)):- % move 2 wildabeast from left to right side of bank CHECK
    (W1 > 1),
    B is W1 + 2,
    D is W2 - 2.

path(S,G,L,L1) :-
	move(S,S1),
	not( unsafe(S1) ),
	not( member(S1,L) ),
    write(S1),nl,
	path(S1, G, [S1|L], L1).	
	%!.						% comment this line to get more than one solution
path(G,G,T,T) :-
	!.
	
go(S,G):-
  	path(S,G,[S],L),
	write("a solution is: "),
	write(L).
go(_,_).