library(tidyverse)

raw_data <- read_csv("Crashes_Involving_Cyclists.csv");

## Clean the data to produce Cleandata/CyclistCrash.csv

clean_data <- raw_data;

write_csv(clean_data, "Cleandata/CyclistCrash.csv");
