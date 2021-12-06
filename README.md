# Project Overview
This repository contains all data and codes used for the final project of [BIOS 611 Introduction to Data Science](https://github.com/Vincent-Toups/datasci611)

# Summary
Dataset https://data-ral.opendata.arcgis.com/datasets/crashes-involving-cyclists/explore?location=35.797886%2C-78.624284%2C10.72 is about the trafic accidents involving cyclists in the city of Raleigh.

# Using This Project
*Attention: You will use [Docker](https://www.docker.com/)  to run this repository.

**Step 1:**
Fork and clone this repository to your local environment (if you don't know to do it, read [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo) for more instructions)

**Step 2:**
Build the docker image by using following:

    docker build . -t yyan1


**Step 3:**

To run Jupyter Notebook, enter the following command:


    docker run -p 8787:8787     -p 8080:8080     -v `pwd`:/home/rstudio      -e PASSWORD=bios611       -it yyan1 sudo -H -u rstudio /bin/bash      -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8787"
      
        
Copy the second url link that the terminal returns, paste it to a browser and navigate to the page.


# Shiny App

Due to loading issue of package 'rgdal', please run Shiny outside DockerContainer 


# Makefile

To use the Makefile included in this repository to build components of the project, run the following code in the terminal within Jupyter Notebook.

Clean the folders:

    make clean
    

Make the final report (for some reason, latex is not working, so html format is used for the final report.):

    make report.html 
 


