# Query compiler for Formula 1

## Created by:
- [Manuel Ignacio Cota Casas A01637477](https://github.com/mannynacc)
- [Aldo Alejandro Degollado Padilla A01638391](https://github.com/Diplex09)
- [Luis Alonso Martínez García A01636255](https://github.com/AlonsoMtzG)
- [Abraham Mendoza Pérez A01274857](https://github.com/Abraham935)
- [Diego Mojarro Tapia A01638460](https://github.com/dmojarrot)
- [César Alexis Sahagún Navarro A01637885](https://github.com/alexissahagun1)

## Description
A compiler created with Lex and Yacc to read queries and translate them into Python code to look for data in a .csv file with Pandas.

## Usage
Run make to compile both Lex and Yacc files.
Run program as:
```
./f1 > code.py
````

To save Python code into a file.

### Input: 
Search in results.csv where points are more than 10 and laps are less than 40

### Output:
```
import pandas as pd
df = pd.read_csv('results.csv')
print(df[(df['points'] > 10) & (df['laps'] < 40)])
```
