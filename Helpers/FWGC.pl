/*
A farmer with his goat, wolf and cabbage come to a river that they wish to cross. 
There is a boat, but it only has room for two, and the farmer is the only one that can row. 
If the goat and cabbage get in the boat at the same time, the cabbage gets eaten.
Similarly, if the wolf and goat are together without the farmer, the goat is eaten. 
Devise a series of crossings of the river so that all concerned make it across safely.
*/

% How to run?
% go(state(east,east,east,east),state(west,west,west,west)).

% CLAUSES

member(X,[X|_]).
member(X,[_|L]):-
	member(X,L).

opposite(east, west).		% The opposite of east is west
opposite(west, east) :-
	!.

unsafe(state(F,X,X,_)) :-	% It is unsafe if the farmer is on:
	opposite(F,X).			% the opposite side of the wolf and goat
unsafe(state(F,_,X,X)) :-
	opposite(F,X).			% the opposite side of the goat and cabbage

move(state(X,X,G,C),state(Y,Y,G,C)):-
	opposite(X,Y). /* FARMER + WOLF    */
move(state(X,W,X,C),state(Y,W,Y,C)):-
	opposite(X,Y). /* FARMER + GOAT    */
move(state(X,W,G,X),state(Y,W,G,Y)):-
	opposite(X,Y). /* FARMER + CABBAGE */
move(state(X,W,G,C),state(Y,W,G,C)):-
	opposite(X,Y). /* ONLY FARMER	  */
	
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

