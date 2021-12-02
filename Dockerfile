FROM rocker/verse
MAINTAINER Yan Tang <yyan1@unc.edu>
RUN R -e "install.packages('shiny')" 
#RUN R -e "devtools::install_github(\"rstudio/leaflet\")"
RUN R -r "install.packages(\"leaflet\")";
RUN R -r "install.packages(\"tinytex\"); tinytex::install_tinytex(dir=\"/opt/tinytex\")"
RUN R -r "install.tackages(\"leaflet.extras\")"
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install pandas && \
	pip3 install seaborn && \
	pip3 install datetime && \
	pip3 install folium && \
	pip3 install matplotlib.pyplot && \ 
	pip3 install numpy && \
	pip3 install os