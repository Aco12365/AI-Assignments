% Define the initial state as a list of integers: [lions_left, wildebeest_left, lions_right, wildebeest_right]
state([3,3,0,0]).

% Define the goal state
goal([0,0,3,3]).

% Define the transition function
transition([L1, W1, L2, W2], [L1-L, W1-W, L2+L, W2+W]) :-
    L1 >= L, W1 >= W, % only cross if there are enough lions and wildebeest
    L + W >= 1, % at least one lion or wildebeest must be on the boat
    L + W =< 2, % the boat can only hold two animals
    L1 - L + W1 - W >= 0, % lions can never outnumber wildebeest on either side of the river
    L2 + L + W2 + W =< 3. % at most three lions and three wildebeest on either side of the river

% Define the depth-first search function
depthfirst([G|_], G, _).
depthfirst([S|R], G, Visited) :-
    findall(T, transition(S, T), Ts),
    append(R, Ts, NewR),
    depthfirst(NewR, G, [S|Visited]).

% Define the solution function
solution(Moves) :-
    state(S), goal(G),
    depthfirst([S], G, Moves).