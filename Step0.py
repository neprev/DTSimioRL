from Functions import Q_table, StateRep, Reward, Qvalue, maxQ
import pandas

maxBuffer = 4
StationsNumber = 2
UtilizationDisc = 100 // 25
gamma = 0.9
alpha = 0.3


#OrderTypes = 3  # fixing the number of OrderTypes
Qdf = Q_table(maxBuffer, UtilizationDisc, StationsNumber)  # initializing Q-table to our parameters and filling it with all 0s


Qdf.to_csv(r'E:\pfe\Qtable.csv', index=False)
