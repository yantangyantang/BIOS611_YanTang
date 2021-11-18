FROM rocker/verse
RUN R -e "install.packages('shiny')" 
#RUN R -e "devtools::install_github(\"rstudio/leaflet\")"
RUN R -r "install.packages(\"leaflet\")";
RUN R -r "install.packages(\"tinytex\"); tinytex::install_tinytex(dir=\"/opt/tinytex\")"
RUN R -r "install.tackages(\"leaflet.extras\")"