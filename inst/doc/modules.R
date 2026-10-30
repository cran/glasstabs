## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)
library(shiny)
library(glasstabs)

## ----run-ns-check-------------------------------------------------------------
# ns <- shiny::NS("filters")
# stopifnot(ns("region") == "filters-region")
# stopifnot(ns("status") == "filters-status")

## ----filter-module------------------------------------------------------------
# filterUI <- function(id) {
#   ns <- NS(id)
# 
#   tagList(
#     glassSelect(
#       ns("region"),
#       c(North = "north", South = "south"),
#       label = "Region",
#       selected = "north"
#     ),
# 
#     glassMultiSelect(
#       ns("status"),
#       c(Active = "active", Closed = "closed"),
#       label = "Status",
#       selected = "active",
#       show_style_switcher = FALSE
#     ),
# 
#     actionButton(ns("clear"), "Clear filters")
#   )
# }
# 
# filterServer <- function(id) {
#   moduleServer(id, function(input, output, session) {
# 
#     observeEvent(input$clear, {
#       updateGlassSelect(
#         session, "region",
#         selected = character(0)
#       )
# 
#       updateGlassMultiSelect(
#         session, "status",
#         selected = character(0)
#       )
#     })
# 
#     reactive({
#       list(
#         region = input$region,
#         status = input$status
#       )
#     })
#   })
# }
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   filterUI("filters"),
#   verbatimTextOutput("current")
# )
# 
# server <- function(input, output, session) {
#   filters <- filterServer("filters")
# 
#   output$current <- renderPrint(filters())
# }
# 
# if (interactive()) shinyApp(ui, server)

## ----filter-module-server-----------------------------------------------------
# filterServerWithSearch <- function(id, choices) {
#   moduleServer(id, function(input, output, session) {
#     glassMultiSelectServer("status", choices, session = session)
# 
#     reactive({
#       input$status
#     })
#   })
# }

## ----two-instances------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   filterUI("left"),
#   filterUI("right")
# )
# 
# server <- function(input, output, session) {
#   left <- filterServer("left")
#   right <- filterServer("right")
# }

