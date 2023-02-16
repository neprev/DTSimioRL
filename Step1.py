import pyodbc
import pandas as pd
from Functions import Q_table, StateRepS2, Reward, Qvalue, maxQ
from random import randint


conn = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-TJNK3RM;DATABASE=OrdersDB;Trusted_Connection=yes;')
cursor = conn.cursor()

Action = randint(0, 1)

cursor.execute("INSERT INTO Go1 (Station) VALUES ({})".format(Action))

cursor.commit()

# close database connection
conn.close()
