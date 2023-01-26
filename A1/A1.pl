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

opposite(1, 0).		% The opposite of east is west
opposite(0, 1) :-
	!.

unsafe(state(right(Lr1,Lr2,Lr3,Wr1,Wr2,Wr3),left(Ll1,Ll2,Ll3,Wl1,Wl2,Wl3))):- % Unsafe state
    ((Wr1+Wr2+Wr3)>0;(Lr1+Lr2+Lr3)>(Wr1+Wr2+Wr3)),((Wl1+Wl2+Wl3)>0;(Ll1+Ll2+Ll3)>(Wl1+Wl2+Wl3)).

# Lion 1 and 2
move(state(right(Lr1a,Lr2a,Lr3,Wr1,Wr2,Wr3),left(Ll1a,Ll2a,Ll3,Wl1,Wl2,Wl3)),state(right(Lr1b,Lr2b,Lr3,Wr1,Wr2,Wr3),left(Ll1b,Ll2b,Ll3,Wl1,Wl2,Wl3))):-
    opposite(Lr1a,Lr1b),
    opposite(Lr2a,Lr2b),
    opposite(Ll1a,Ll1b),
    opposite(Ll2a,Ll2b).

# Lion 1
move(state(right(Lr1a,Lr2,Lr3,Wr1,Wr2,Wr3),left(Ll1a,Ll2,Ll3,Wl1,Wl2,Wl3)),state(right(Lr1b,Lr2,Lr3,Wr1,Wr2,Wr3),left(Ll1b,Ll2,Ll3,Wl1,Wl2,Wl3))):-
    opposite(Lr1a,Lr1b),
    opposite(Ll1a,Ll1b).

# Lion 2
move(state(right(Lr1,Lr2a,Lr3,Wr1,Wr2,Wr3),left(Ll1,Ll2a,Ll3,Wl1,Wl2,Wl3)),state(right(Lr1,Lr2b,Lr3,Wr1,Wr2,Wr3),left(Ll1,Ll2b,Ll3,Wl1,Wl2,Wl3))):-
    opposite(Lr2a,Lr2b),
    opposite(Ll2a,Ll2b).    

#Lion 3
move(state(right(Lr1,Lr2,Lr3a,Wr1,Wr2,Wr3),left(Ll1,Ll2,Ll3a,Wl1,Wl2,Wl3)),state(right(Lr1,Lr2,Lr3b,Wr1,Wr2,Wr3),left(Ll1,Ll2,Ll3b,Wl1,Wl2,Wl3))):-
    opposite(Lr3a,Lr3b),
    opposite(Ll3a,Ll3b). 

#Wildebeest 1
move(state(right(Lr1,Lr2,Lr3,Wr1a,Wr2,Wr3),left(Ll1,Ll2,Ll3,Wl1a,Wl2,Wl3)),state(right(Lr1,Lr2,Lr3,Wr1b,Wr2,Wr3),left(Ll1,Ll2,Ll3,Wl1b,Wl2,Wl3))):-
    opposite(Wr1a,Wr1b),
    opposite(Wl1a,Wl1b).  

#Wildebeest 2
move(state(right(Lr1,Lr2,Lr3,Wr1,Wr2a,Wr3),left(Ll1,Ll2,Ll3,Wl1,Wl2a,Wl3)),state(right(Lr1,Lr2,Lr3,Wr1,Wr2b,Wr3),left(Ll1,Ll2,Ll3,Wl1,Wl2b,Wl3))):-
    opposite(Wr2a,Wr2b),
    opposite(Wl2a,Wl2b).  

#Wildebeest 3
move(state(right(Lr1,Lr2,Lr3,Wr1,Wr2a,Wr3),left(Ll1,Ll2,Ll3,Wl1,Wl2a,Wl3)),state(right(Lr1,Lr2,Lr3,Wr1,Wr2b,Wr3),left(Ll1,Ll2,Ll3,Wl1,Wl2b,Wl3))):-
    opposite(Wr2a,Wr2b),
    opposite(Wl2a,Wl2b).  

# Lion 1 and 3
move(state(right(Lr1a,Lr2,Lr3a,Wr1,Wr2,Wr3),left(Ll1a,Ll2,Ll3a,Wl1,Wl2,Wl3)),state(right(Lr1b,Lr2,Lr3b,Wr1,Wr2,Wr3),left(Ll1b,Ll2,Ll3b,Wl1,Wl2,Wl3))):-
    opposite(Lr1a,Lr1b),
    opposite(Lr3a,Lr3b),
    opposite(Ll1a,Ll1b),
    opposite(Ll3a,Ll3b).

# Lion 1 and Wildebeest 1
move(state(right(Lr1a,Lr2,Lr3,Wr1a,Wr2,Wr3),left(Ll1a,Ll2,Ll3,Wl1a,Wl2,Wl3)),state(right(Lr1b,Lr2,Lr3,Wr1b,Wr2,Wr3),left(Ll1b,Ll2,Ll3,Wl1b,Wl2,Wl3))):-
    opposite(Lr1a,Lr1b),
    opposite(Wr1a,Wr1b),
    opposite(Ll1a,Ll1b),
    opposite(Wl1a,Wl1b).

# Lion 1 and Wildebeest 2
move(state(right(Lr1a,Lr2,Lr3,Wr1,Wr2a,Wr3),left(Ll1a,Ll2,Ll3,Wl1,Wl2a,Wl3)),state(right(Lr1b,Lr2,Lr3,Wr1,Wr2b,Wr3),left(Ll1b,Ll2,Ll3,Wl1,Wl2b,Wl3))):-
    opposite(Lr1a,Lr1b),
    opposite(Wr2a,Wr2b),
    opposite(Ll1a,Ll1b),
    opposite(Wl2a,Wl2b).

# Lion 1 and Wildebeest 3
move(state(right(Lr1a,Lr2,Lr3,Wr1,Wr2,Wr3a),left(Ll1a,Ll2,Ll3,Wl1,Wl2,Wl3a)),state(right(Lr1b,Lr2,Lr3,Wr1,Wr2,Wr3b),left(Ll1b,Ll2,Ll3,Wl1,Wl2,Wl3b))):-
    opposite(Lr1a,Lr1b),
    opposite(Wr3a,Wr3b),
    opposite(Ll1a,Ll1b),
    opposite(Wl3a,Wl3b).

# Lion 2 and Lion 3
move(state(right(Lr1,Lr2a,Lr3a,Wr1,Wr2,Wr3),left(Ll1,Ll2a,Ll3a,Wl1,Wl2,Wl3)),state(right(Lr1,Lr2b,Lr3b,Wr1,Wr2,Wr3),left(Ll1,Ll2b,Ll3b,Wl1,Wl2,Wl3))):-
    opposite(Lr3a,Lr3b),
    opposite(Lr2a,Lr2b),
    opposite(Ll3a,Ll3b),
    opposite(Ll2a,Ll2b).

# Lion 2 and Wildebeest 1
move(state(right(Lr1,Lr2a,Lr3,Wr1a,Wr2,Wr3),left(Ll1,Ll2a,Ll3,Wl1a,Wl2,Wl3)),state(right(Lr1,Lr2b,Lr3,Wr1b,Wr2,Wr3),left(Ll1,Ll2b,Ll3,Wl1b,Wl2,Wl3))):-
    opposite(Lr2a,Lr2b),
    opposite(Wr1a,Wr1b),
    opposite(Ll2a,Ll2b),
    opposite(Wl1a,Wl1b).

# Lion 2 and Wildebeest 2
move(state(right(Lr1,Lr2a,Lr3,Wr1,Wr2a,Wr3),left(Ll1,Ll2a,Ll3,Wl1,Wl2a,Wl3)),state(right(Lr1,Lr2b,Lr3,Wr1,Wr2b,Wr3),left(Ll1,Ll2b,Ll3,Wl1,Wl2b,Wl3))):-
    opposite(Lr2a,Lr2b),
    opposite(Wr2a,Wr2b),
    opposite(Ll2a,Ll2b),
    opposite(Wl2a,Wl2b).

# Lion 2 and Wildebeest 3
move(state(right(Lr1,Lr2a,Lr3,Wr1,Wr2,Wr3a),left(Ll1,Ll2a,Ll3,Wl1,Wl2,Wl3a)),state(right(Lr1,Lr2b,Lr3,Wr1,Wr2,Wr3b),left(Ll1,Ll2b,Ll3,Wl1,Wl2,Wl3b))):-
    opposite(Lr2a,Lr2b),
    opposite(Wr3a,Wr3b),
    opposite(Ll2a,Ll2b),
    opposite(Wl3a,Wl3b).


# Lion 3 and Wildebeest 1
move(state(right(Lr1,Lr2,Lr3a,Wr1a,Wr2,Wr3),left(Ll1,Ll2,Ll3a,Wl1a,Wl2,Wl3)),state(right(Lr1,Lr2,Lr3b,Wr1b,Wr2,Wr3),left(Ll1,Ll2,Ll3b,Wl1b,Wl2,Wl3))):-
    opposite(Lr3a,Lr3b),
    opposite(Wr1a,Wr1b),
    opposite(Ll3a,Ll3b),
    opposite(Wl1a,Wl1b).

# Lion 3 and Wildebeest 2
move(state(right(Lr1,Lr2,Lr3a,Wr1,Wr2a,Wr3),left(Ll1,Ll2,Ll3a,Wl1,Wl2a,Wl3)),state(right(Lr1,Lr2,Lr3b,Wr1,Wr2b,Wr3),left(Ll1,Ll2,Ll3b,Wl1,Wl2b,Wl3))):-
    opposite(Lr3a,Lr3b),
    opposite(Wr2a,Wr2b),
    opposite(Ll3a,Ll3b),
    opposite(Wl2a,Wl2b).

# Lion 3 and Wildebeest 3
move(state(right(Lr1,Lr2,Lr3a,Wr1,Wr2,Wr3a),left(Ll1,Ll2,Ll3a,Wl1,Wl2,Wl3a)),state(right(Lr1,Lr2b,Lr3b,Wr1,Wr2,Wr3b),left(Ll1,Ll2,Ll3b,Wl1,Wl2,Wl3b))):-
    opposite(Lr3a,Lr3b),
    opposite(Wr3a,Wr3b),
    opposite(Ll3a,Ll3b),
    opposite(Wl3a,Wl3b).

# Wildebeest 1 and Wildebeest 2
move(state(right(Lr1,Lr2,Lr3,Wr1a,Wr2a,Wr3),left(Ll1,Ll2,Ll3,Wl1a,Wl2a,Wl3)),state(right(Lr1,Lr2,Lr3,Wr1b,Wr2b,Wr3),left(Ll1,Ll2,Ll3,Wl1b,Wl2b,Wl3))):-
    opposite(Wr1a,Wr1b),
    opposite(Wr2a,Wr2b),
    opposite(Wl1a,Wl1b),
    opposite(Wl2a,Wl2b).

# Wildebeest 1 and Wildebeest 3
move(state(right(Lr1,Lr2,Lr3,Wr1a,Wr2,Wr3a),left(Ll1,Ll2,Ll3,Wl1a,Wl2,Wl3a)),state(right(Lr1,Lr2b,Lr3,Wr1b,Wr2,Wr3b),left(Ll1,Ll2,Ll3,Wl1b,Wl2,Wl3b))):-
    opposite(Wr1a,Wr1b),
    opposite(Wr3a,Wr3b),
    opposite(Ll3a,Ll3b),
    opposite(Wl3a,Wl3b).

# Wildebeest 2 and Wildebeest 3
move(state(right(Lr1,Lr2,Lr3,Wr1a,Wr2,Wr3a),left(Ll1,Ll2,Ll3,Wl1a,Wl2,Wl3a)),state(right(Lr1,Lr2b,Lr3,Wr1b,Wr2,Wr3b),left(Ll1,Ll2,Ll3,Wl1b,Wl2,Wl3b))):-
    opposite(Wr2a,Wr2b),
    opposite(Wr3a,Wr3b),
    opposite(Wl2a,Wl2b),
    opposite(Wl3a,Wl3b).