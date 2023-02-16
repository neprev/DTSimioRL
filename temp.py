import pyodbc
from random import randint
import pandas as pd
conn = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-TJNK3RM;DATABASE=OrdersDB;Trusted_Connection=yes;')
cursor = conn.cursor()

Tableau = pd.read_sql("SELECT * From ArrivalTable", conn)
for i in range(1,len(Tableau)+1):
    rand = randint (0,2)
    print (rand)
    if rand == 0 :
        Order = '2p'
        Mult = 2
    elif rand == 1:
        Order = '4p'
        Mult = 4
    else:
        Order = '6p'
        Mult = 6
    cursor.execute("UPDATE ArrivalTable SET EntityInstanceProperty1 = '{}' WHERE OrderID = {};".format(Order, i))
    cursor.execute("UPDATE ArrivalTable SET Multiplicity = {} WHERE OrderID = {};".format(Mult, i))
cursor.commit()

conn.close()