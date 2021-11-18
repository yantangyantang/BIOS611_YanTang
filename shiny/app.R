library(leaflet)
library(shiny)
library(tidyverse)
library(readr)
library(shinydashboard)
#new 11.10
library(leaflet.extras)
library(dplyr)
library(rgdal)

df <- read_csv("Crashes_Involving_Cyclists.csv");
df %>% summarize(c_lat=median(LocationLatitude),
                 c_lon=median(LocationLongitude))
#new 11.10
df$killed_type <- ifelse(df$killed <- 1, "fatal",
                    ifelse(df$killed <- 0, "injured",
                           ifelse(df$killed <- NULL, "unkown")))

ui <- fluidPage(
  #new 11.10
  mainPanel(
    leafletOutput(outputId = "mymap"),
    absolutePanel(top = 60, left = 20,
                  checkboxInput("markers", "Fatal/Injured", FALSE),
                  checkboxInput("heat", "Occurence", FALSE))),

  #old
 sliderInput(inputId = "Crash_Date_Year",
              label = "Year Range",
              value=c(2015,2021),
              min = min(df["Crash_Date_Year"]),
              max = max(df["Crash_Date_Year"]),
              sep = ""),
#  plotOutput(outputId = "plot")
)

#newly added
# ui <- dashboardPage(
#  dahsboardHeader(title = "My Dashboard"),
#  dashboardSidebar()
#  dashboardBoday(
#    box(plotOutput("correlation_plot"), width = 8)
#  )
  
#)

# 11.10
server <- function(input, output, session){
  pal <- colorNumeric(
    palette = c('cyan', 'green', 'dark green', 'orange red', 'red', 'dark red'),
    domain = df$pedalcyclists)
    #(how to add count??)
    
  pal2 <- colorFactor(
    palette = c('purple', 'yellow', 'blue'),
    domain = df$killed_type
  )
  #new 11.10 create map
  output$mymap <- renderLeaflet({
    sdf <- df %>% filter(Crash_Date_Year >= input$Crash_Date_Year[1] &
                           Crash_Date_Year <= input$Crash_Date_Year[2]);
    leaflet(sdf) %>%
      setView(lng = -78.6, lat = 35.8, zoom =9) %>%
      addTiles() %>%
      addCircles(data = sdf, lat = ~ LocationLatitude, lng = ~ LocationLongitude, 
                 weight = 10, #popup ~as.character(pedalcyclists),
                 # radious = ~sqrt(pedalcyclists)*50000 before popup
                 #？？label = ~as.character(paste0("Crashes"))
                 color = ~pal(pedalcyclists), fillOpacity = 0.5)
  })
 
  #11.10 checkboxes 
  observe({
    sdf <- df %>% filter(Crash_Date_Year >= input$Crash_Date_Year[1] &
                           Crash_Date_Year <= input$Crash_Date_Year[2]);
    proxy <- leafletProxy("mymap", data = sdf)
    proxy %>% clearMarkers()
    if(input$markers) {
      proxy %>% addCircleMarkers(lat=~LocationLatitude, 
                                 lng=~LocationLongitude)
    }
    else {
      proxy %>% clearMarkers() %>% clearControls()
    }
  })
  observe({
    sdf <- df %>% filter(Crash_Date_Year >= input$Crash_Date_Year[1] &
                           Crash_Date_Year <= input$Crash_Date_Year[2]);
    proxy <- leafletProxy("myamap", data = sdf)
    proxy %>% clearMarkers()
    if (input$heat){
      proxy %>% addHeatmap(lng = ~LocationLongitude, 
                           lat = ~LocationLatitude, 
                           intensity = ~pedalcyclists, #should be added count 
                           blur = 10, max = 0.05, radius = 15)
    }
    else{
      proxy %>% clearHeatmap()
    }
  })
  
#  output$plot = renderPlot({
 #   ggplot(df %>% filter(Crash_Date_Year == input$Crash_Date_Year),
  #         aes(X,Y)) + geom_point();
    
#  })
#}

#newly added
#server <- function(input, output){
#  output$correlation_plot <- renderPlot({
#    plot()
#  })
}
#shinyApp(ui = ui, server = server)

shinyApp(ui, server)
