library(shiny)
fatalities_10_read <- read.table("fatalities_10.csv", header=TRUE, 
  	sep=",")
injuries_10_read <- read.table("injuries_10.csv", header=TRUE, 
  	sep=",")
damages_10_read <- read.table("damages_10.csv", header=TRUE, 
  	sep=",")
crops_damages_10_read <- read.table("crops_damages_10.csv", header=TRUE, 
  	sep=",")
# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

    # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "fatalities_10" = fatalities_10_read,
           "injuries_10" = injuries_10_read,
           "damages_10" = damages_10_read,
		   "crops_damages_10"=crops_damages_10_read)
  })
##
##  output$distPlot <- renderPlot({
##
##    # generate an rnorm distribution and plot it
##    dist <- rnorm(input$obs)
##    hist(dist)
##  })
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })

  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })

output$distPlot <- renderPlot({
  dataset <- datasetInput()
  
  barplot(c(as.matrix(dataset[2])), las = 3, names.arg = c(as.matrix(dataset[1])),
          main = "Top 10 Greatest Fatalities' events", ylab = "fatalities in number")
  
})

})
