import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

plt.rcParams['figure.figsize'] = [10, 5]

Crash = pd.read_csv('Crashes_Involving_Cyclists.csv')
#Crash.head()
pd.reset_option("max_columns", 55)
Crash.head()
#excluding 2015 & 2021 data
Crash_cleaned = Crash[(Crash['Crash_Date_Year'] != 2015) & (Crash['Crash_Date_Year'] != 2021)]

sns.displot(x='Crash_Date_Month', hue='LocationRelationToRoad', multiple="stack", alpha=0.5, aspect = 1.5, data=Crash_cleaned)
plt.xticks(rotation=45)

plt.savefig("figures/location_to_road", bbox_inches = "tight")