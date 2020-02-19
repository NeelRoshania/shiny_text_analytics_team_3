#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(wordcloud)

# read data
frequencies_tokens_nostop <- read.csv("C:/Users/nrosh/Desktop/Hult/2020/Dual Degree/SPR - DAT-5317 Text Analytics/Team Projects/Simulation/shiny/shiny_text_analytics_team_3/data/frequencies_tokens_nostop.csv")
frequencies_tokens_nostop_2 <- read.csv("C:/Users/nrosh/Desktop/Hult/2020/Dual Degree/SPR - DAT-5317 Text Analytics/Team Projects/Simulation/shiny/shiny_text_analytics_team_3/data/frequencies_tokens_nostop_2.csv")
frequencies_tokens_nostop_3 <- read.csv("C:/Users/nrosh/Desktop/Hult/2020/Dual Degree/SPR - DAT-5317 Text Analytics/Team Projects/Simulation/shiny/shiny_text_analytics_team_3/data/frequencies_tokens_nostop_3.csv")
frequencies_tokens_nostop_4 <- read.csv("C:/Users/nrosh/Desktop/Hult/2020/Dual Degree/SPR - DAT-5317 Text Analytics/Team Projects/Simulation/shiny/shiny_text_analytics_team_3/data/frequencies_tokens_nostop_4.csv")
frequencies_tokens_nostop_5 <- read.csv("C:/Users/nrosh/Desktop/Hult/2020/Dual Degree/SPR - DAT-5317 Text Analytics/Team Projects/Simulation/shiny/shiny_text_analytics_team_3/data/frequencies_tokens_nostop_5.csv")



# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$question_1 <- renderPlot({
        frequencies_tokens_nostop %>%
            with(wordcloud(word, n, max.words = input$words_q1))

    })
    
    
    output$question_2 <- renderPlot({
        frequencies_tokens_nostop_2 %>%
            inner_join(get_sentiments("nrc")) %>%
            dplyr::count(word, sentiment, sort=TRUE) %>%
            acast(word ~sentiment, value.var="n", fill=0) %>%
            comparison.cloud(colors = c("grey20", "gray80"),
                             max.words=input$words_q2,
                             scale = c(0.9, 0.9),      # Control size of image
                             # fixed.asp=TRUE,           # Fixed aspect ratio
                             title.size=1              # Size of title script
            )
        
    })

})
