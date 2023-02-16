import pandas as pd


def initialize_Q(maxBuffer, UtilizationDisc, StationsNumber):
    Q_Dict = dict()
    for QueueDiff in range(-maxBuffer, maxBuffer + 1):
        for UtilDiff in range(-UtilizationDisc, UtilizationDisc + 1):
            for Action in range(StationsNumber):
                Q_Dict[((QueueDiff, UtilDiff), Action)] = 0
    return Q_Dict


maxBuffer = 4
OrderTypes = 3
StationsNumber = 2
UtilizationDisc = 100 // 25


Q_Dict = initialize_Q(maxBuffer, UtilizationDisc, StationsNumber)

print(Q_Dict)

