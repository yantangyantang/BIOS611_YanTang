import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

Crash = pd.read_csv('source_data/Crashes_Involving_Cyclists.csv')
#Crash.head()
pd.reset_option("max_columns", 55)

Crash.head()
#excluding 2015 & 2021 data
Crash_cleaned = Crash[(Crash['Crash_Date_Year'] != 2015) & (Crash['Crash_Date_Year'] != 2021)]

sns.displot(Crash_cleaned, x="TrafficControlType", hue="Crash_Date_Year", kind="ecdf", color = 'dark2')
plt.xticks(rotation=75)

plt.savefig("figures/contribution_of_control_types", bbox_inches = "tight")