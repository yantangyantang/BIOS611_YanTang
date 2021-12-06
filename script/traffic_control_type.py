import pandas as pd
import matplotlib.pyplot as plt

Crash = pd.read_csv('source_data/Crashes_Involving_Cyclists.csv')
#Crash.head()
pd.reset_option("max_columns", 55)

Crash.head()
#excluding 2015 & 2021 data
Crash_cleaned = Crash[(Crash['Crash_Date_Year'] != 2015) & (Crash['Crash_Date_Year'] != 2021)]
count_controltype=Crash_cleaned['TrafficControlType'].value_counts()

controltype = count_controltype.dropna()

# controltype

figb = controltype.plot.bar(x = 'Traffic Control Type', color=('turquoise'), edgecolor='gold')

plt.xticks(rotation=70)

figb.set_facecolor('lightgrey')

plt.savefig("figures/traffic_control_type", bbox_inches = "tight")