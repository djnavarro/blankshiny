# load packages
library(shiny)   # the shiny package
library(shinyjs) # shinyjs is handy
library(rdrop2)  # needed to save data to dropbox

# structure of the application
source("study.R")      # information specific to the study 
source("saveData.R")   # how should we save the responses?
source("makeUI.R")     # construct the user interface
source("makeServer.R") # construct the server function

# create the shiny app
shinyApp(ui, server)
