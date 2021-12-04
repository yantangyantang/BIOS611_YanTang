import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np


Crash = pd.read_csv('Crashes_Involving_Cyclists.csv')
#Crash.head()
pd.reset_option("max_columns", 55)
Crash.head()
#excluding 2015 & 2021 data
Crash_cleaned = Crash[(Crash['Crash_Date_Year'] != 2015) & (Crash['Crash_Date_Year'] != 2021)]
# Crash_cleaned.head()

#injury analysis - pie chart
  
# Creating dataset
Injury_Level = ['killed', 'type_a_injury', 'type_b_injury', 
        'type_c_injury', 'injury unknown', 'no_injury']
  
data_injury = [3, 19, 128, 94, 12, 194]
  
  
# Creating explode data
explode = (0.1, 0.0, 0.2, 0.3, 0.0, 0.0)
  
# Creating color parameters
colors = ( "red", "orchid", "yellow",
          "coral", "beige", "turquoise")
  
# Wedge properties
wp = { 'linewidth' : 1, 'edgecolor' : "green" }
  
# Creating autocpt arguments
def func(pct, allvalues):
    absolute = int(pct / 100.*np.sum(allvalues))
    return "{:.1f}%".format(pct, absolute)
  
# Creating plot
fig, ax = plt.subplots(figsize =(10, 7))
wedges, texts, autotexts = ax.pie(data_injury, 
                                  autopct = lambda pct: func(pct, data_injury),
                                  explode = explode, 
                                  labels = Injury_Level,
                                  shadow = True,
                                  colors = colors,
                                  startangle = 90,
                                  wedgeprops = wp,
                                  textprops = dict(color ="black"))
  
# Adding legend
ax.legend(wedges, Injury_Level,
          title ="Injury Level",
          loc ="center right",
          bbox_to_anchor =(1, 0, 0.5, 1))
  
plt.setp(autotexts, size = 8, weight ="bold")
ax.set_title("Injury Analysis")

# show plot
plt.show()

plt.savefig("injury_level", bbox_inches = "tight")