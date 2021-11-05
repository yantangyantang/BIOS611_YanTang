library(leaflet)
library(shiny)
library(tidyverse)
library(readr)
library(shinydashboard)
library(dplyr)
library(rgdal)

df <- read_csv("Crashes_Involving_Cyclists.csv");


ui <- fluidPage(
  sliderInput(inputId = "Crash_Date_Year",
              label = "Year Range",
              value=2015,
              min = min(df["Crash_Date_Year"]),
              max = max(df["Crash_Date_Year"]),
              sep = ""),
  plotOutput(outputId = "plot")
)

server <- function(input, output){
  
  output$plot = renderPlot({
    ggplot(df %>% filter(Crash_Date_Year == input$Crash_Date_Year),
           aes(X,Y)) + geom_point();
    
  })
}
shinyApp(ui = ui, server = server)
