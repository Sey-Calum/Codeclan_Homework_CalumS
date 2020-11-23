library(tidyverse)
library(CodeClanData)
library(readr)
library(ggplot2)
library(dplyr)
library(shiny)
library(shinythemes)

game_sales <- game_sales

ui <- fluidPage(
  
  titlePanel("Game Scores"),
  
  #Creating a tab with "Score", "Publisher Sales" "Genre Sales" on the side bar.
  #this gave me a lot of issue and still don't know if it's even possible.
  
  # In the following code I've compared the Critic Score vs User Score to see the difference.
  # Shown which developer has the highest sales.
  # Shown which Genre has the highest sales.
  
  sidebarLayout(
    sidebarPanel(
      tabsetPanel(
        verticalLayout(
            tabPanel("Score",
                   "Publisher Sales",
                   "Genre Sales")
          
        )
      )
    )
  ),
  
  #Comparison of the "Critic_Score" vs "User_Score"
  
    mainPanel(
      fluidRow(
      tabsetPanel(
        tabPanel(
          column(12,
            plotOutput("critic_score"),
            plotOutput("user_score"))
          
        ),
        
        #Developer Sales with selection of the Game Name
        
        column(12,
          plotOutput("publisher_sales")),
        column(5,
                selectInput("name",
                            "Score",
                             choices = sort(unique(game_sales$name))
          )
        ),
        
        #Genre Sales with selection of a Game Name
        
        column(12,
               plotOutput("genre_sales")) ,
               selectInput("name",
                          "Score",
                          choices = sort(unique(game_sales$name))
               )
        )
      )
      )
)
  

          
  
  server <- function(input, output) {
    
    #Critic Score
    
    output$critic_score <- renderPlot({
      plot <- ggplot(overall_score) +
        filter()
        aes(x= name, y = critic_score) +
        geom_col()
    })
    
    #User Score
    
    output$user_score <- renderPlot({
      game_sales %>% 
        mutate(user_score_10 = sum(user_score) * 10)
          plot <- ggplot(overall_score) +
            aes(x= name, y = user_score) +
              geom_col()
    })
    
    #Developer Sales
    
    output$publisher_sales <- renderPlot({
      plot <- ggplot(overall_score) +
        aes(x= devloper, y = sales) +
        geom_col() 
    })
    
    #Genre Sales
    
    output$genre_sales <- renderPlot({
      plot <- ggplot(overall_score) +
        aes(x= "genre", y = "score") +
        geom_col()
    })
      
}
    
shinyApp(ui, server)