import pyodbc
import pandas as pd
from Functions import StateRep, Reward, NewQvalue

conn = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-TJNK3RM;DATABASE=OrdersDB;Trusted_Connection=yes;')
cursor = conn.cursor()

#Importing data from the database
TimeMPS = pd.read_sql("SELECT TimeMPS From TimeMPS", conn)
TimeShipment = pd.read_sql("SELECT TimeShipment From TimeShip", conn)
StateTable = pd.read_sql("SELECT * From StateTable", conn)
Actions = pd.read_sql("SELECT Station From Go1", conn)

for i in range(TimeShipment.shape[0]):
    Qdf = pd.read_csv(r'E:\pfe\Qtable.csv')
    Action = Actions.at[i, 'Station']
    StateTup = StateRep(StateTable, i)  # will return a tuple with (QueueDiff, UtilDiff)
    TimeBetween = TimeShipment.at[i, 'TimeShipment'] - TimeMPS.at[i, 'TimeMPS']
    R = Reward(StateTup, Action, TimeBetween, i)
    column = Qdf.loc[:, '{}'.format(StateTup)]
    MaxQForState = column.max()  # calculating the maximum Q value for this state
    # update table
    if Qdf.at[Action, '{}'.format(StateTup)] == 0:
        Q = R + 0.9 * MaxQForState
    else:
        oldQ = Qdf.at[Action, '{}'.format(StateTup)]
        Q = NewQvalue(R, oldQ, MaxQForState)
    Qdf.at[Action, '{}'.format(StateTup)] = Q
    print('Q value:', Qdf.at[Action, '{}'.format(StateTup)])
    Qdf.to_csv('E:\pfe\Qtable.csv', index=False)
conn.close()

