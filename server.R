library(shiny)
library(tidyverse)
# Define server logic 
server <- function(input, output,session) {
  
  #create a data frame called responses
  saveData <- function(data) {
    data <- as.data.frame(t(data))
    if (exists("responses")) {
      responses <<- rbind(responses, data)
    } else {
      responses <<- data
    }
  }
  
  loadData <- function() {
    if (exists("responses")) {
      responses
    }
  }
  
  
  # Whenever a field is filled, aggregate all form data
  #formData is a reactive function
  formData <- reactive({
    data <- sapply(fields, function(x) input[[x]])
    data
  })
  
  # When the Save button is clicked, save the form data
  observeEvent(input$save, {
    saveData(formData())
  })
  
  # Show the previous responses
  # (update with current response when save is clicked)
  output$responses <- DT::renderDataTable({
    input$save
    loadData()
  })    
  
}
