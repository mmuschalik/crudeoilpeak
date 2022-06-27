import pandas as pd
import sys


df1 = pd.read_csv(sys.argv[1], index_col="SETTLEMENTDATE")
df2 = pd.read_csv(sys.argv[2], index_col="SETTLEMENTDATE")

df3 = pd.concat([df1,df2], axis=0)
df3 = df3[~df3.index.duplicated(keep='first')]

ts = pd.to_datetime(df3.index, format='%Y-%m-%d %H:%M:%S').strftime('%Y-%W')

for i, x in df3.groupby(ts):
   x.to_csv('{}_{}.csv'.format(sys.argv[2], i), index=True)