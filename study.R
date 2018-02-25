# ---- user interface objects for the study ----

myContent <- textOutput( 
  outputId = "content"
  )

myResponse <- sliderInput(
  inputId = "response", 
  label = "", 
  min = 0, 
  max = 100, 
  value = c(40, 60)
  )

myAction <- actionButton(
  inputId = "action", 
  label = "submit"
  )

# ---- server content for the study ----

myStimuli <- function() {
  stimuli <- list(
    "Probability that it will rain this week",
    "Probability that humans will be extinct within 1000 years",
    "Probability that you will do honours psychology",
    "Probability that the world ends not with a bang, but with a whimper"
  )
  stimuli <- sample(stimuli) # randomise order
  return(stimuli)
}

processContent <- function(stimulus) {
  return(stimulus)
}

renderContent <- renderText # the output is text format

# ---- what data to record? ----

getTrialData <- function(input, stimulus) {

  trialData <- data.frame(
    trial = input$action,      # the trial number
    question = stimulus,       # what question was posed? 
    lower = input$response[1], # response (lower value)
    upper = input$response[2]  # response (upper value)
  )
  return( trialData )
}

# ---- information needed for saving data ----
 
saveDir <- ""
saveMethod <- "none"