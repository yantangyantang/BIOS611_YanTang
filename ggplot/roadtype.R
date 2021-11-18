# ggplot

library(tidyverse)
library(ggplot2)
library(broom)

#line+dot

da <- read_csv("Crashes_Involving_Cyclists.csv")
#summary (da)
#da <- read_csv("/Users/tangyan/BIOS611_YanTang/Crashes_Involving_Cyclists.csv")
  
ggplot(data = da, 
       mapping = aes(x = Crash_Date_Year, 
                     y = (pedalcyclists)))+
  geom_point(size = 5) + 
  geom_line(colour = "red")
#v
ggplot(data = da
       mapping = aes(x = Crash_Date_Year))+
  geom_histogram(aes(fill=RoadClassification),position="dodge");

#copy
ggplot(data = da %>% filter(killed=="1"), 
       mapping = aes(x = Crash_Date_Year))+
  geom_histogram(aes(fill=TrafficControlType),position="dodge");

ggplot(data = da %>% filter(killed=="0"), 
       mapping = aes(x = Crash_Date_Year))+
  geom_histogram(aes(fill=TrafficControlType),position="dodge");
# 11.17 pie
ggplot(da, aes(x="", y=pedalcyclists, fill=TrafficControlType))+
         geom_bar(width = 1, stat = "identity") +
         coord_polar("y", start=0) +
  scale_fill_brewer(palette="Dark2")
#11.17 pie use this!
ggplot(da, aes(x=factor(1), fill=TrafficControlType))+
  geom_bar(width = 1)+
  coord_polar("y")
       
#11.17 donut
hsize <- 2.5
da <- da %>%
  mutate(x=hsize)

ggplot(da, aes(x=hsize, y = pedalcyclists, fill=TrafficControlType))+
  geom_col() +
  geom_text(aes(label= (pedalcyclists)),
            position = position_stack(vjust = 0.5)) +
  
  coord_polar(theta = "y") +
  xlim(c(0.2, hsize+0.5)) +
  scale_fill_brewer(palette='Set3') +
  scale_color_brewer(palette='Set3') 
  

#11.17 donut customized - why not grouped???

da$fraction = da$TrafficControlType / sum(da$TrafficControlType)
da = da[order(da$fraction), ]
# Compute the cumulative percentages (top of each rectangle)
da$ymax = cumsum(da$fraction)
# Compute the bottom of each rectangle
da$ymin = c(0, head(da$ymax, n=-1))

ggplot(da, aes(fill=TrafficControlType, ymax=ymax, ymin=ymin, xmax=4, xmin=3)) +
  geom_rect(colour="grey30") +
  coord_polar(theta="y") +
  xlim(c(0, 4)) +
  theme_bw() +
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) +
  theme(axis.ticks=element_blank()) +
  labs(title="Traffic Control")

#11.17 donut customized - try diff approach
# not sure what below is

ggplot(da, aes(x=hsize, y = pedalcyclists, fill=TrafficControlType))+
  geom_col() +
  geom_text(aes(label= (pedalcyclists)),
            position = position_stack(vjust = 0.5)) +
  
  coord_polar(theta = "y") +
  xlim(c(0.2, hsize+0.5)) +
  scale_fill_brewer(palette='Set3') +
  scale_color_brewer(palette='Set3')

y = OBJECTID,
       mapping = aes(x = Crash_Date_Year))
  geom_histogram(aes(fill=TrafficControlType),position="dodge");

ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

# approach 2
ggplot(Crashes_Involving_Cyclists.csv, 
       aes(Crash_Date_Year, pedalcyclists)) +
  geom_pont(size = 5) +
  geom_line(color = "red")

#
da <- read_csv("Crashes_Involving_Cyclists.csv")
da %>% ggplot(aes()) 10'30'

