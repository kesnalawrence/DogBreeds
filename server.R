library(shiny)
library(shinyBS)

function(input, output, session) {
  
  session$onSessionEnded(stopApp)
  
  hide(id = "loading-content", anim = TRUE, animType = "fade")    
  show("app-content")
  
  
         df_breeds = read_csv(file='Dogs.csv') %>%
          rename(LifeSpan=`Life Span`, OtherDogs=`Other Dogs`)
         
         breeds=reactive({
           df_breeds %>%
             filter(Weight  >= input$weightSlider[1] & Weight <= input$weightSlider[2])
         })
        # numMin=reactiveValues({breeds() %>% select(Weight) %>% min})
         #numMax=reactiveValues({breeds() %>% select(Weight) %>% max})
         
         output$uiSizeSlider= renderUI({
          sliderInput(inputId = 'weightSlider', label = 'Weight',min = 0, max = 120,round = TRUE, value = c(0,100))
           #sliderInput(inputId = 'sizeSlider', label = 'Size',min = 0, max = 100,round = TRUE, value = c(0,100))
         })
         
          output$breedQuad=renderPlot({
    
    breeds() %>%
      ggplot(aes_string(x=input$xDim, y=input$yDim, color=input$colorDim))+
      geom_point(aes_string(size=input$sizeDim))+
      scale_color_viridis(option = 'D',direction = -1)+
      geom_vline(xintercept=3.5)+
      geom_hline(yintercept=3.5)+
      geom_label_repel(data=breeds(),aes(label=Breed),size=5)+
      labs( x=input$xDim, y=input$yDim)+
      theme_minimal()+
      theme(line = element_blank())+
      scale_size(range = c(3,8))
  },height=800)
          
          output$Dataset = renderDataTable(expr = {breeds()})
          
          
  
}