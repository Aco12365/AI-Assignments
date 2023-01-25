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



unsafe(state(Lr,Wr,Ll,Wl)):- % Unsafe state
    (Wr>0;Lr>=Wr),(Wl>0;Ll>Wl).

move(state(Lr,Wr,Ll,Wl),state(Lr-1,Wr-,L2,W2)):-







