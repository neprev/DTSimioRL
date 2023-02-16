import pyodbc
import pandas as pd
from Functions import Q_table, StateRep, Reward, Qvalue, maxQ
from random import randint

conn = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-TJNK3RM;DATABASE=OrdersDB;Trusted_Connection=yes;')
cursor = conn.cursor()

j=0
while j < 1000:
    maxBuffer = 4  # fixing the maximum number accepted in the input buffer of each station
    OrderTypes = 3  # fixing the number of OrderTypes
    StationsNumber = 2  # fixing the number of assembly stations
    UtilizationDisc = 100 // 25  # we discretize the utilization rate to intervals of length 25%

    Qdf = Q_table(maxBuffer, UtilizationDisc, StationsNumber)  # initializing Q-table to our parameters and filling it with all 0s

    StateTable = pd.read_sql("SELECT * From StateTable;", conn)
    i = 0
    StateTup = StateRep(StateTable, i)
    column = Qdf[StateTup]

    MaxQForState = column.max() # calculating the maximum Q value for this state
    Action = column.idxmax() # gives the index of the maximum Q value for the current state

    if Action == 0:
        cursor.execute("INSERT INTO Go (Station) VALUES (Input@Assembly1)")
    else:
        cursor.execute("INSERT INTO Go (Station) VALUES (Input@Assembly2)")
    cursor.commit()

    Statistics = pd.read_sql("SELECT * From Statistics1", conn)

    #Statistic = Statistics.iloc[[i]][0] #getting the statistic of the current row

    R = Reward(StateTup, Action, Statistics)

    Q = Qvalue(R, Qdf, Action)

    #update table is this Q value exceeds the old Q value
    if Q > MaxQForState:
        Qdf.at[Action, StateTup] = Q

    #repeat
    j+=1

# close database connection
conn.close()
