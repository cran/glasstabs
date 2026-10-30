## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)
library(shiny)
library(glasstabs)

## ----run-native-before--------------------------------------------------------
# library(shiny)
# 
# regions <- c(North = "north", South = "south", East = "east")
# data <- data.frame(
#   region = c("north", "south", "east", "north"),
#   cases = c(12, 8, 5, 3)
# )
# 
# ui <- fluidPage(
#   selectInput(
#     "region",
#     "Region",
#     choices = regions,
#     multiple = TRUE,
#     selected = NULL
#   ),
#   tableOutput("rows")
# )
# 
# server <- function(input, output, session) {
#   output$rows <- renderTable({
#     data[data$region %in% input$region, , drop = FALSE]
#   })
# }
# 
# shinyApp(ui, server)

## ----run-glasstabs-after------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# regions <- c(North = "north", South = "south", East = "east")
# data <- data.frame(
#   region = c("north", "south", "east", "north"),
#   cases = c(12, 8, 5, 3)
# )
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect(
#     "region",
#     choices = regions,
#     label = "Region",
#     selected = character(0),
#     theme = "auto"
#   ),
#   tableOutput("rows")
# )
# 
# server <- function(input, output, session) {
#   output$rows <- renderTable({
#     data[data$region %in% input$region, , drop = FALSE]
#   })
# }
# 
# shinyApp(ui, server)

