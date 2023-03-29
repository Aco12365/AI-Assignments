from cgi import print_form
import math
from types import NoneType

w1 = 0.75
w2 = 0.5
w3 = -0.6

x1 = [1.0,9.4,2.5,8.0,0.5,7.9,7.0,2.8,1.2,7.8]
x2 = [1.0,6.4,2.1,7.7,2.2,8.4,7.0,0.8,3.0,6.1]
x3 = 1
counter = 0
desired = [1,-1,1,-1,1,-1,-1,1,1,-1]

delta = None
delta1 = None
delta2 = None
delta3 = None

c = 0.2
check = 0
checkcount = 0
Iteration_count = 0

while check != 1:
    checkcount = 0
    for i in range(0,len(x1)-1):
        net = w1 * x1[i] + w2 * x2[i] + w3 * x3
        print(f"net: {net}\n")

        if net > 0:
            fnet = 1
        elif net < 0:
            fnet = -1

        print(f"fnet: {fnet}")
        delta1 = c * (desired[i] - fnet) * x1[i]
        delta2 = c * (desired[i] - fnet) * x2[i]
        delta3 = c * (desired[i] - fnet) * x3
        print(f"delta1: {delta1}")
        print(f"delta2: {delta2}")
        print(f"delta3: {delta3}\n")

        w1 = w1 + delta1
        w2 = w2 + delta2
        w3 = w3  + delta3

   
        print(f"New weights include:")


        if delta1 == 0 and delta2 == 0 and delta3 == 0:
            checkcount = checkcount + 1
        print(f"checkcount: {checkcount}\n")   
    if checkcount == 9:
        check = 1
    Iteration_count = Iteration_count + 1

    print(f"Iteration Count: {Iteration_count}\n")
    print(f"w1: {w1}")
    print(f"w2: {w2}")
    print(f"w3: {w3}\n")