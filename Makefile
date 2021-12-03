.PHONY: clean
.RECIPEPREFIX=>

crashes_vs_time.png: trend.py Crashes_Involving_Cyclists.csv
> python3 trend.py

report.html: Crashes_Involving_Cyclists.csv crashes_vs_time.png
> jupyter nbconvert --to html yyan1_to_submit.ipynb