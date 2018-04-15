library(shiny)
library(tidyverse)
library(viridis)
library(ggrepel)



function(input, output, session) {
  
  session$onSessionEnded(stopApp)
  
  hide(id = "loading-content", anim = TRUE, animType = "fade")    
  show("app-content")
  
  
         df_breeds = read_csv(file='Dogs.csv') %>%
          rename(LifeSpan=`Life Span`, OtherDogs=`Other Dogs`)
         
          output$breedQuad=renderPlot({
    
    df_breeds %>%
      ggplot(aes_string(x=input$xDim, y=input$yDim, color=input$colorDim))+
      geom_point(aes_string(size=input$sizeDim))+
      scale_color_viridis(option = 'D',direction = -1)+
      geom_vline(xintercept=3.5)+
      geom_hline(yintercept=3.5)+
      geom_label_repel(data=df_breeds,aes(label=Breed),size=5)+
      labs( x=input$xDim, y=input$yDim)+
      theme_minimal()+
      theme(line = element_blank())+
      scale_size(range = c(3,8))
  },height=800)
  
}