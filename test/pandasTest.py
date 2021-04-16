import pandas as pd


data = []
data.append([11,'hi'])
data.append([17,'xhi'])
data.append([91,'hil'])

df = pd.DataFrame(data, columns = ['age','name'])

print(df)