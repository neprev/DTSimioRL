import pyodbc
import numpy as np
import pandas as pd


conn = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-TJNK3RM;DATABASE=OrdersDB;Trusted_Connection=yes;')
cursor = conn.cursor()

def initialize_Q(maxBuffer, UtilizationDisc, StationsNumber):
    return np.zeros([StationsNumber, (maxBuffer * 2) * (UtilizationDisc * 2)])


def Q_table(maxBuffer, UtilizationDisc, StationsNumber):
    Q = np.zeros([StationsNumber, (maxBuffer * 2 + 1) * (UtilizationDisc * 2 + 1)])
    columns = []
    for QueueDiff in range(-maxBuffer, maxBuffer + 1):
        for UtilDiff in range(-UtilizationDisc, UtilizationDisc + 1):
            columns.append((QueueDiff, UtilDiff))
    return pd.DataFrame(Q, columns=columns, index=[0, 1])


def StateRep(StateTable, i):
    StateLine = StateTable.iloc[i]
    QueueDiff = StateLine["NumberQ1"] - StateLine["NumberQ2"]
    UtilDiff = int (StateLine["ScheduledAss1"] // 25 - StateLine["ScheduledAss2"] // 25)
    StateTuple = (QueueDiff, UtilDiff)
    return StateTuple

def StateRepS2(StateTable, i):
    StateLine = StateTable.iloc[i]
    Queue1 = StateLine["NumberQ1"]
    Queue2 = StateLine["NumberQ2"]
    UtilDiff = int (StateLine["ScheduledAss1"] // 25 - StateLine["ScheduledAss2"] // 25)
    StateTuple2 = (Queue1, Queue2, UtilDiff)
    return StateTuple2


def Q_table2(maxBuffer, UtilizationDisc, StationsNumber):
    Q2 = np.zeros([StationsNumber, ((maxBuffer+1) ** 2) * (UtilizationDisc * 2 + 1)])
    columns = []
    for Queue1 in range(0, maxBuffer + 1):
        for Queue2 in range(0, maxBuffer + 1):
            for UtilDiff in range(-UtilizationDisc, UtilizationDisc + 1):
                columns.append((Queue1, Queue2, UtilDiff))
    return pd.DataFrame(Q2, columns=columns,
                        index=[0, 1])

def Q_table3(maxBuffer, StationsNumber):
    Q3 = np.zeros([StationsNumber, (maxBuffer+1) ** 2])
    columns = []
    for Queue1 in range(0, maxBuffer + 1):
        for Queue2 in range(0, maxBuffer + 1):
            columns.append((Queue1, Queue2))
    return pd.DataFrame(Q3, columns=columns,
                        index=[0, 1])


def Reward(stateTuple, action, TimeBetween, i):
    NumberBetween = TimeBetween
    Reward = round(1 / NumberBetween, 2)
    return Reward


def Qvalue(Reward, Qtable, action, gamma=0.9):
    return Reward + gamma * maxQ(Qtable)

def NewQvalue(Reward, Q, maxQ, gamma=0.9, alpha=0.3):
    return (1 - alpha) * Q + alpha * ( Reward + gamma * maxQ)

def maxQ(Qtable):        # returns the maximum Qvalue from the Q table for a certain action
    return Qtable.max().max()

maxBuffer = 4
OrderTypes = 3
StationsNumber = 2
UtilizationDisc = 100 // 25

# Q = initialize_Q(maxBuffer, UtilizationDisc, StationsNumber) #initializing Q-table to all 0s
Qdf = Q_table(maxBuffer, UtilizationDisc, StationsNumber)

