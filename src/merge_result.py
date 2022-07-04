import pandas as pd
import sys

state=sys.argv[2]

df1 = pd.read_csv(sys.argv[1], index_col="SETTLEMENTDATE")
df2 = pd.read_csv(state, index_col="SETTLEMENTDATE")

df3 = pd.concat([df1,df2], axis=0)
df3 = df3[~df3.index.duplicated(keep='first')]

ts = pd.to_datetime(df3.index, format='%Y-%m-%d %H:%M:%S').strftime('%Y-%W')

for i, x in df3.groupby(ts):
   x.to_csv('{}_{}.csv'.format(state, i), index=True)

df3['WF'] = df3.filter(regex='WF').sum(axis=1)
df3['DATE'] = pd.to_datetime(df3.index, format='%Y-%m-%d %H:%M:%S').strftime('%Y-%m-%d %a')
df4 = df3.groupby('DATE')["WF"].sum().to_frame().rename(columns={"WF": state})
df4.to_csv('wf_{}.csv'.format(state), index=True)

