
gasTank = input("Is there gas in the gas tank?\n")

if gasTank == 'yes': 
    carburettor = input("is there gas in the carburettor?\n")
    if carburettor == 'yes':
        print("The engine is getting gas\n")
        turnover = input("will the engine turnover?\n")
        if turnover == 'yes':
            print("The problem is the spark plugs\n")
        else:
            lights = input("Do the lights come on?\n")
            if lights == 'yes':
                print("The problem is the starter motor\n")
            else:
                print("The problem is the battery or cables\n")
    else:
        print("The engine is not getting gas\n")
else:
    print('there is no gas\n')
