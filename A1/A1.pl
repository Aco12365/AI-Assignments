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

move(state(right(Lr1a,Lr2a,Lr3,Wr1,Wr2,Wr3),left(Ll1a,Ll2a,Ll3,Wl1,Wl2,Wl3)),state(right(Lr1b,Lr2b,Lr3,Wr1,Wr2,Wr3),left(Ll1b,Ll2b,Ll3,Wl1,Wl2,Wl3))):-
    opposite(Lr1a,Lr1b),
    opposite(Lr2a,Lr2b),
    opposite(Ll1a,Ll1b),
    opposite(Ll2a,Ll2b).

move(state(right(Lr1a,Lr2,Lr3,Wr1,Wr2,Wr3),left(Ll1a,Ll2,Ll3,Wl1,Wl2,Wl3)),state(right(Lr1b,Lr2,Lr3,Wr1,Wr2,Wr3),left(Ll1b,Ll2,Ll3,Wl1,Wl2,Wl3))):-
    opposite(Lr1a,Lr1b),
    opposite(Ll1a,Ll1b).
    


