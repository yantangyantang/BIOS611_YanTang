import pandas as pd
import matplotlib.pyplot as plt

# plt.rcParams['figure.figsize'] = [10, 5]

Crash = pd.read_csv('Crashes_Involving_Cyclists.csv')
#Crash.head()
pd.reset_option("max_columns", 55)

Crash.head()
#excluding 2015 & 2021 data
Crash_cleaned = Crash[(Crash['Crash_Date_Year'] != 2015) & (Crash['Crash_Date_Year'] != 2021)]

month = ['January','February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

# Creating color parameters
colors = ("#E6DAA6", "tan", "orange",
          "brown", "black")

c = pd.crosstab(Crash_cleaned['Crash_Date_Month'], Crash_cleaned['Crash_Date_Year'])
c = c.reindex(month)
fig = c[[2016, 2017, 2018, 2019, 2020]].plot(color = colors, linewidth =3.0)
plt.legend(loc="center left", bbox_to_anchor=(0.5, 1.15), ncol=3)
# seaborn.lineplot() = 3
fig.set_facecolor('#F0FFFF')


fig.get_figure().savefig("crashes_vs_time.png", bbox_inches='tight')