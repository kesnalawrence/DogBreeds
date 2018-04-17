
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
  tabsetPanel(type='tabs',
              tabPanel(title='Plot',
                      fluidRow(width=12,
           column(width = 2,
                  selectInput(inputId = "yDim",label = "Dimension Y", choices = c('Training','Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'),selected = 'Grooming' ),
                  bsTooltip(id = "yDim", title = "This is the dimension for the Y/vertical axis",
                            "top", options = list(container = "body"))
           ),
           
           column(width = 2,
                  selectInput(inputId = "xDim",label = "Dimension X", choices = c('Training', 'Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'),selected = 'Training' ),
                  bsTooltip(id = "xDim", title = "This is the dimension for the X/horizontal axis",
                            "top", options = list(container = "body"))
           ),
           
           column(width = 2,
                  selectInput(inputId = "colorDim",label = "Dimension Color", choices = c('Training', 'Exercise', 'LifeSpan', 'Weight', 'Height', 'Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'), selected = 'Affection' ),
                  bsTooltip(id = "colorDim", title = "This dimension colors the bubbles based on the selected value",
                            "top", options = list(container = "body"))
           ),
           
           column(width = 2,
                  selectInput(inputId = "sizeDim",label = "Dimension Size", choices = c('Training', 'Exercise', 'LifeSpan', 'Weight', 'Height', 'Affection', 'Playfulness', 'Children','OtherDogs', 'Grooming'),selected = 'Exercise' ),
                  bsTooltip(id = "sizeDim", title = "This dimension sizes the bubbles based on the selected value",
                            "top", options = list(container = "body"))
           ),
           column(width = 4,
                 uiOutput('uiSizeSlider'),
                 bsTooltip(id = "uiSizeSlider", title = "Use this to filter dogs based on their weight",
                           "top", options = list(container = "body")))
  ),
  

  fluidRow(width=12,
           column(width = 12,
                  plotOutput(outputId = "breedQuad") %>% withSpinner(),
                      bsPopover(id='breedQuad', title="Bubble Chart", content = "A bubble chart compares items based on an X/Y coordinates for main features and secondary feature are compared based on size and color.", placement='bottom', trigger='hover')
           )
           )
  ),
           tabPanel(title='Data',
                    dataTableOutput("Dataset") %>% withSpinner()
           )
  )
  )
    
  

