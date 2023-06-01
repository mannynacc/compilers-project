import pandas as pd
df = pd.read_csv('../reto/data_f1/results.csv')
print(df[(df['points'] > 10) & (df["laps"] <= 40)])