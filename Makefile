.PHONY: clean
.PHONY: shiny
.RECIPEPREFIX=>

clean:
> rm -f figures/*

figures/trend.png:\
 script/trend.py\
 source_data/Crashes_Involving_Cyclists.csv
> mkdir -p figures
> python3 script/trend.py

figures/traffic_control_type.png:\
 script/traffic_control_type.py\
 source_data/Crashes_Involving_Cyclists.csv
> mkdir -p figures
> python3 script/traffic_control_type.py

figures/contribution_of_control_types.png:\
 script/contribution_of_control_types.py\
 source_data/Crashes_Involving_Cyclists.csv
> mkdir -p figures
> python3 script/contribution_of_control_types.py

figures/injury_level.png:\
 script/injury_level.py\
 source_data/Crashes_Involving_Cyclists.csv
> mkdir -p figures
> python3 script/injury_level.py

figures/location_to_road.png:\
 script/location_to_road.py\
 source_data/Crashes_Involving_Cyclists.csv
> mkdir -p figures
> python3 script/location_to_road.py

figures/crash_vs_time.png:\
 script/crash_vs_time.py\
 source_data/Crashes_Involving_Cyclists.csv
> mkdir -p figures
> python3 script/crash_vs_time.py

report.html:\
 source_data/Crashes_Involving_Cyclists.csv\
 figures/trend.png\
 figures/traffic_control_type.png\
 figures/contribution_of_control_types.png\
 figures/injury_level.png\
 figures/location_to_road.png\
 figures/crash_vs_time.png
> jupyter nbconvert --to html yyan1_to_submit.ipynb

#shiny
shiny: shiny/app.R Crashes_Involving_Cyclists.csv
> Rscript shiny/app.R