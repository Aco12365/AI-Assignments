


Correct_Number_Count((X,Y,Z),A):-
A is If(Contains((B,C,D),X),0,1) + If(Contains((B,C,D),Y),0,1) + If(Contains((B,C,D),Z),0,1).

Correct_Number_Place((X,Y,Z),A):-
A is IF(X=B,0,1) + IF(Y=C,0,1) + IF(Z=D,0,1)


Correct_Number_Count((4,3,8),0)
Correct_Number_Place((4,3,8),0)

Correct_Number_Count((4,8,0),0)
Correct_Number_Place((4,8,0),0)


Correct_Number_Count((7,8,2),1)
Correct_Number_Place((7,8,2),1)

Correct_Number_Count((7,1,6),1)
Correct_Number_Place((7,1,6),0)

Correct_Number_Count((2,0,7),2)
Correct_Number_Place((2,0,7),0)





