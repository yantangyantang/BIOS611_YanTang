.PHONY: clean

clean:
	rm -rf Cleandata

Cleandata/CyclistCrash.csv: Crashes_Involving_Cyclists.csv clean_data.R
	mkdir -p Cleandata
  Rscript clean_data.R
  
report.pdf: report.rmd
	Rscript build-report.R