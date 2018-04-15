
library(shiny)


fluidPage(
  
  
  useShinyjs(),
  inlineCSS(appCSS),
  
  # Loading message
  div(
    id = "loading-content",
    h2("Loading...")
  ),

  fluidRow(width=12,
           column(width=12,
                  h2("Dog Breed Comparison"),
                  br()
                  )),
  fluidRow(width=12,
           column(width = 3,
                  selectInput(inputId = "yDim",label = "Dimension Y", choices = c('Training','Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'),selected = 'Grooming' )
           ),
           
           column(width = 3,
                  selectInput(inputId = "xDim",label = "Dimension X", choices = c('Training', 'Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'),selected = 'Training' )
           ),
           
           column(width = 3,
                  selectInput(inputId = "colorDim",label = "Dimension Color", choices = c('Training', 'Exercise', 'LifeSpan', 'Weight', 'Height', 'Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'), selected = 'Affection' )
           ),
           
           column(width = 3,
                  selectInput(inputId = "sizeDim",label = "Dimension Size", choices = c('Training', 'Exercise', 'LifeSpan', 'Weight', 'Height', 'Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'),selected = 'Exercise' )
           )
  ),

  fluidRow(width=12,
           column(width = 12,
                  plotOutput(outputId = "breedQuad") %>% withSpinner()
           )
  )
    
  
)
