#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(dplyr)
library(tidytext)
library(reshape2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    theme = shinytheme("cerulean"),
    style='padding-left: 5em; padding-top: 5em; padding-bottom: 5em;',
    
    br(),
    
    # Submission Details
    titlePanel("Team 3 - A1 Speech To Text Corpus Presentation"),
    h3("Text Analytics DAT 5317"),
    h3("18 February 2020"),
    br(),
    br(),
    
    # Context
    h3("Context", style = "font-weight: bold;"),
    p("Our founding team believes that if you're serious about your money, it shouldn't be in the form of a cheap plastic card.", 
      style = "font-size: 1.4em;"),
    br(),
    p("We asked participants the following 5 questions to understand their spending habits,", 
      style = "font-size: 1.4em;"),
    br(),
    tags$ol(
        tags$li("How do you spend your salary?", style = "font-size: 1.4em;"), 
        tags$li("How many bank accounts do you have?", style = "font-size: 1.4em;"), 
        tags$li("A credit card helps you pay for stuff. That's it. What other features would you like to see in a Credit Card?", style = "font-size: 1.4em;"),
        tags$li("What are your entertainment expenses?", style = "font-size: 1.4em;"), 
        tags$li("Would you open an account with us?", style = "font-size: 1.4em;")
    ),
    br(),
    
    # Problem solving methodology
    h3("Problem Solving Methodology", style = "font-weight: bold;"),
    p("We used the following methodology to derive insights from our unstructured survey data,", 
      style = "font-size: 1.4em;"),
    br(),

    tags$ol(
        tags$li("Conduct the survey using Apple's Voice Assistant and a JS Speech-To-Text application", style = "font-size: 1.4em;"), 
        tags$li("...", style = "font-size: 1.4em;")
        
    ),
    br(),
    
    # Insights
    h3("Insights", style = "font-weight: bold;"),
    p("The following insights were derived from the analytical procedure above.", 
      style = "font-size: 1.4em;"),
    br(),
    br(),
    
    # Question 1 Insight
    p("Most students surveyed tend to spend their money on food, rent, entertainment and shopping.", 
      style = "font-size: 1.4em; font-weight: bold"),
    
    br(),
    
    # Sidebar layout with slider in the sidebard, and plot on the main panels
    sidebarLayout(
        sidebarPanel(
            sliderInput("words_q1",
                        "Number of words:",
                        min = 1,
                        max = 30,
                        value = 30)
        ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("question_1")
        )
    ),
    
    # Question 2 Insight
    p("When speaking about their bank accounts, they generally responsed with a slightly negative sentiment.", 
      style = "font-size: 1.4em; font-weight: bold"),
    
    br(),
    
    # Sidebar layout with slider in the sidebard, and plot on the main panels
    sidebarLayout(
        sidebarPanel(
            sliderInput("words_q2",
                        "Number of words:",
                        min = 1,
                        max = 30,
                        value = 30)
        ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("question_2")
        )
    )
    
    
    
    
    
    
))
