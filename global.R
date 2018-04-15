library(shiny)
library(tidyverse)
library(viridis)
library(ggrepel)
library(shinyjs)

appCSS <- "
#loading-content {
position: absolute;
background: #000000;
opacity: 0.9;
z-index: 100;
left: 0;
right: 0;
height: 100%;
text-align: center;
color: #FFFFFF;
}
"