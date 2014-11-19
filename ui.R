library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Top 10 Greatest Damages"),
  # Sidebar with a slider input for number of observations
  sidebarPanel(
   selectInput("dataset", "Choose a dataset:", 
                choices = c("fatalities_10", "injuries_10", "damages_10","crops_damages_10")),  
    numericInput("obs", "Number of observations to view:", 10, min = 1, max = 10)
				
##    sliderInput("obs", 
##                "Number of observations:", 
##                min = 1,
##                max = 1000, 
##                value = 500)
  ),

  # Show a plot of the generated distribution
  mainPanel(
##    plotOutput("distPlot")
    ##verbatimTextOutput("summary"),

h3("Synopsis"),
p("  Storms and other severe weather events can cause both public health and economic problems for communities and municipalities. Many severe events can result in fatalities, injuries, and property damage, and preventing such outcomes to the extent possible is a key concern.
"),
p("This project involves presenting data proceding for having explored the U.S. National Oceanic and Atmospheric Administration's (NOAA) storm database. This database tracks characteristics of major storms and weather events in the United States, including when and where they occur, as well as estimates of any fatalities, injuries, and property damage.
"),
p("The data presented in this proyect is the top 10 fatalities, injuries, damages and crop_damages from the entire data set Storm Data at https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2

There is also some documentation of the database available. Here you will find how some of the variables are constructed/defined.

National Weather Service Storm Data Documentation

National Climatic Data Center Storm Events FAQ
"),
    tableOutput("view"),
    
    plotOutput("distPlot")

  )
))