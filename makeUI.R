ui <- fluidPage( 
  fluidRow( # the page has one row...
    column( # ... and the row has one column
      
      # information about the column
      width = 8,         # specify the column width (between 1 and 12)
      align = "center",  # how to align content inside the column
      
      # study-specific objects (see the "study.R" file)
      myContent,  # content area
      myResponse, # response area
      myAction,   # action button
      
      # hidden thank you message
      hidden(p(id="thankYou", "All done! Thanks")),
      
      # force the ui to use shinyjs
      shinyjs::useShinyjs()
      
    )
  )
)