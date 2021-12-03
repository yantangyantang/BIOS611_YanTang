FROM rocker/verse
MAINTAINER Yan Tang <yyan1@unc.edu>
RUN R -e "install.packages('shiny')" 
#RUN R -e "devtools::install_github(\"rstudio/leaflet\")"
RUN R -r "install.packages(\"leaflet\")";
RUN R -r "install.packages(\"tinytex\"); tinytex::install_tinytex(dir=\"/opt/tinytex\")"
RUN R -r "install.tackages(\"leaflet.extras\")"
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install pandas
RUN pip3 install seaborn
RUN pip3 install datetime
RUN pip3 install folium
RUN pip3 install matplotlib
RUN pip3 install numpy
RUN pip3 install astral
RUN apt update && apt install -y\
    texlive-base\
	texlive-binaries\
    texlive-latex-base\
	texlive-latex-recommended\
	texlive-pictures\
    texlive-latex-extra

RUN apt update && apt install -y texlive-xetex