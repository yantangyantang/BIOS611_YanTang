FROM rocker/verse
RUN R -e "install.packages('shiny')" 
#RUN R -e "devtools::install_github(\"rstudio/leaflet\")"
RUN R -r "install.packages(\"leaflet\")";
