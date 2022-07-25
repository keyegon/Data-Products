library(shiny)

fields <- c("name","age","height","weight", "gender", "Education", "Religion")
ui <- fluidPage(
  
  # Application title
  titlePanel(" Alupe Health Center, Patient Record Database"),
  
  # Sidebar with reactive inputs
  sidebarLayout(
    sidebarPanel(
      textInput("name","Your Name"),
      selectInput("age","Age bracket",c("18-25","25-45","above 45")),
      textInput("weight","Please enter your weight in kg"),
      textInput("height","Please enter your height in cm"),
      textInput("gender","Please enter your Gender M/F"),
      textInput("Education","Please enter your highest level of education"),
      textInput("Religion","Please enter your religious affiliation"),
      actionButton("save","Add")
      
    ),
    
    # a table of reactive outputs
    mainPanel(
      mainPanel(
                DT::dataTableOutput("responses", width = 500), tags$hr()
        
      )
    )
  )
)