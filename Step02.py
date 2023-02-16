from Functions import Q_table2, StateRep, Reward, Qvalue, maxQ
import pandas

maxBuffer = 4  # fixing the maximum number accepted in the input buffer of each station
OrderTypes = 3  # fixing the number of OrderTypes
StationsNumber = 2  # fixing the number of assembly stations
UtilizationDisc = 100 // 25  # we discretize the utilization rate to intervals of length 25%

Qdf = Q_table2(maxBuffer, UtilizationDisc, StationsNumber)  # initializing Q-table to our parameters and filling it with all 0s
print(Qdf)

Qdf.to_csv(r'E:\pfe\Qtable2.csv', index=False)