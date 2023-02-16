import pyodbc
import pandas as pd
from Functions import Q_table, StateRepS2, Reward, Qvalue, maxQ

Qdf = pd.read_csv(r'E:\pfe\Qtable2.csv')

conn = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-TJNK3RM;DATABASE=OrdersDB;Trusted_Connection=yes;')
cursor = conn.cursor()

Statistics = pd.read_sql("SELECT * From Statistics2", conn)
StateTable = pd.read_sql("SELECT * From StateTable2", conn)

StateTup = StateRepS2(StateTable, -1)
column = Qdf.loc[:,'{}'.format(StateTup)]
print('column: \n', column)

Action = column.argmax()
print('Action:', Action)

cursor.execute("INSERT INTO Go2 (Station) VALUES ({})".format(Action))

cursor.commit()

conn.close()