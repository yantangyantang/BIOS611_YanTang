.PHONY: clean
.RECIPEPREFIX=>

trend.png: trend.py Crashes_Involving_Cyclists.csv
> python3 trend.py

traffic_control_type.png: traffic_control_type.py Crashes_Involving_Cyclists.csv
> python3 traffic_control_type.py

contribution_of_control_types.png: contribution_of_control_types.py Crashes_Involving_Cyclists.csv
> python3 contribution_of_control_types.py

injury_level.png: injury_level.py Crashes_Involving_Cyclists.csv
> python3 injury_level.py

location_to_road.png: location_to_road.py Crashes_Involving_Cyclists.csv
> python3 location_to_road.py

crash_vs_time.png: crash_vs_time.py Crashes_Involving_Cyclists.csv
> python3 crash_vs_time.py

report.html: Crashes_Involving_Cyclists.csv trend.png
> jupyter nbconvert --to html yyan1_to_submit.ipynb