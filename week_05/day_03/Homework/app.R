library(shiny)
library(tidyverse)
library(shinythemes)

#I've not done anything that will look pleasant in the final Dashboard for this homework.
#Instead I've been finding out what the limitations of the widgets and tabs are.
#So you will find a the code has just been buried deeper and deeper into some of the tabs


olympics_overall_medals <- read_csv("data/olympics_overall_medals.csv")

all_teams <- unique(olympics_overall_medals$team)

ui <- fluidPage(
    theme = shinytheme("cyborg"),
    
    titlePanel(tags$i("Olympic Medals")),
    
    navlistPanel(
        tabPanel(tags$a("Vertical Layout"), verticalLayout("Season",
                   "Team",
                   tags$h5("Medal"),
                   "Count")),
        
        tabPanel("Warning", actionButton(inputId = "medal",
                                       label = "DO NOT PRESS!!!!!",)),
        
        tabPanel(tags$h4("I'm a bit larger than the rest"), "Don't judge me"),
        
        tabPanel("Link to Something Usless, Probably", tags$a("Usless, but click me anyways",
                 href = "https://theuselessweb.com/")),
        
        tabPanel("Line Graph... I Hope.", "it didn't work")
        ),

    
# can you make a https link into a button? I couldn't fit actionButton into the line
    
    sidebarLayout(
        sidebarPanel(
            radioButtons("season",
                         "Which Olympics are you interested in? The Summer or Winter Olympics?",
                         choices = c("Summer", "Winter", "Neither")
            ),
            
            selectInput("team",
                        "Which Team?",
                        choices = all_teams
            )
        ),
        
        mainPanel(
            plotOutput("medal_plot")
        )
    )
)

server <- function(input, output) {
    
    output$medal_plot <- renderPlot({
        olympics_overall_medals %>%
            filter(team == input$team) %>%
            filter(season == input$season) %>%
            ggplot() +
            aes(x = medal, y = count, fill = medal) +
            geom_col()
    })
}

shinyApp(ui = ui, server = server)
