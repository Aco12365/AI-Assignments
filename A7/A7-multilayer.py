from cgi import print_form
import math
w1 = 0.75
w2 = 0.5
w3 = -0.6

x1 = [1.0,9.4,2.5,8.0,0.5,7.9,7.0,2.8,1.3,7.8]
x2 = [1.0,6.4,2.1,7.7,2.2,8.4,7.0,0.8,3.0,6.1]
x3 = 1
counter = 0
desired = [1,-1,1,-1,1,-1,-1,1,1,-1]

delta1 = None

c = 0.2


while delta1 != 0.00 or counter == len(x1):
    print(f"starting training part {counter + 1}")
    net1 = w1 * x1[counter] + w2 * x2[counter] + w3 * x3
    print(f"net: {net1}")
    print(f"debug: { math.exp(-1*net1)}")
    fnet1 = 1/( 1+ math.e**(-1*net1))
    print(f"fnet: {fnet1}")
    fdashnet1 = fnet1 * (1-fnet1)
    print(f"f'net: {fdashnet1}")
    delta1 = (desired[counter] - fnet1) *(fdashnet1)
    print(f"delta at part {counter + 1}: {delta1}")
    w1 = w1 + c*delta1 + fnet1
    w2 = w2 + c*delta1 + fnet1
    w3 = w3 + c*delta1 + fnet1
    print(f"New weights include:")
    print(f"w1: {w1}")
    print(f"w2: {w2}")
    print(f"w3: {w3}\n")
    counter = counter + 1
    


