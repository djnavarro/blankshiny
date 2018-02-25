server <- function(input, output) {
  
  # read the stimulus materials
  study <- myStimuli()
  
  # how to handle the end of the current trial?
  observeEvent(
    eventExpr = input$action, # when user clicks the action button
    handlerExpr = endTrial(input, study) # end this trial
  )
  
  # how to generate the next trial?
  output$content <- renderContent(
    expr = processContent( study[[input$action+1]] )
  )
  
}

endTrial <- function(input, study) {

  # before each trial, use shinyjs reset the response object
  reset("response") 
  
  # trial number
  trialNum <- input$action
  
  # get the data for this trial
  trialData <- getTrialData(input, study[[trialNum]]) 
  
  # update data storage
  if(trialNum == 1) {
    responses <<- trialData
  } else {
    responses <<- rbind(responses, trialData)
  }
  
  # end the experiment if needed
  if(trialNum == length(study)) {
    
    # tidy up
    hide("response")
    hide("action")
    hide("content")
    show("thankYou")
    
    # save data 
    saveData(method = saveMethod)
    
  }
}

responses <- data.frame() # initialise the data set