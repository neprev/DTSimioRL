import pyodbc
import pandas as pd
from Functions import Q_table, StateRep, Reward, Qvalue, maxQ, NewQvalue, StateRepS2



conn = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-TJNK3RM;DATABASE=OrdersDB;Trusted_Connection=yes;')
cursor = conn.cursor()

TimeMPS = pd.read_sql("SELECT TimeMPS From TimeMPS", conn)
TimeShipment = pd.read_sql("SELECT TimeShipment From TimeShip", conn)
#Statistics = pd.read_sql("SELECT TimeBetween4 From Statistics1", conn)
StateTable = pd.read_sql("SELECT * From StateTable", conn)
Actions = pd.read_sql("SELECT Station From Go1", conn)
#print(Statistics)
#print('number:',TimeShipment.shape[0])
for i in range(TimeShipment.shape[0]):
    Qdf = pd.read_csv(r'E:\pfe\Qtable2.csv')
    Action = Actions.at[i,'Station']
    StateTup2 = StateRepS2(StateTable, i) # will return a tuple with (QueueDiff, UtilDiff), which looks like one of the states in the Dataframe
    TimeBetween = TimeShipment.at[i,'TimeShipment'] - TimeMPS.at[i,'TimeMPS']
    R = Reward(StateTup2, Action, TimeBetween, i)
    print('reward:', R)
    #Q = Qvalue(R, Qdf, Action)
    #print('Qvalue', Q)
    column = Qdf.loc[:,'{}'.format(StateTup2)]
    MaxQForState = column.max()  # calculating the maximum Q value for this state  # OK
    #update table
    if Qdf.at[Action, '{}'.format(StateTup2)] == 0:
        Q = R + 0.9 * MaxQForState
        print('First time Q')
    else:
        oldQ = Qdf.at[Action, '{}'.format(StateTup2)]
        Q = NewQvalue(R, oldQ, MaxQForState)
        print('Updated Q')
    Qdf.at[Action, '{}'.format(StateTup2)] = Q
    print('Q value:' , Qdf.at[Action, '{}'.format(StateTup2)])
    #repeat

    Qdf.to_csv('E:\pfe\Qtable2.csv', index=False)


conn.close()
