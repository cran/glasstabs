## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ----basic--------------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# fruits <- c(
#   Apple  = "apple",
#   Banana = "banana",
#   Cherry = "cherry",
#   Mango  = "mango"
# )
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassSelect("pick", fruits),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   output$out <- renderPrint(input$pick)
# }
# 
# shinyApp(ui, server)

## ----initial------------------------------------------------------------------
# # No selection (default)
# glassSelect("f", fruits)
# 
# # Pre-select one value
# glassSelect("f", fruits, selected = "banana")

## ----label--------------------------------------------------------------------
# glassSelect("f", fruits, label = "Choose a fruit")

## ----styles-------------------------------------------------------------------
# glassSelect("f1", fruits, check_style = "checkbox")
# glassSelect("f2", fruits, check_style = "check-only")
# glassSelect("f3", fruits, check_style = "filled")

## ----search-clear-------------------------------------------------------------
# glassSelect(
#   "f",
#   fruits,
#   searchable = TRUE,
#   clearable = TRUE
# )

## ----no-search----------------------------------------------------------------
# glassSelect(
#   "f",
#   fruits,
#   searchable = FALSE
# )

## ----include-all--------------------------------------------------------------
# glassSelect(
#   "f",
#   fruits,
#   include_all = TRUE,
#   all_choice_label = "All fruits",
#   all_choice_value = "__all__"
# )

## ----server-direct------------------------------------------------------------
# server <- function(input, output, session) {
#   observe({
#   message("Selected: ", if (is.null(input$pick)) "NULL" else input$pick)
# })
# }

## ----server-helper------------------------------------------------------------
# server <- function(input, output, session) {
#   pick <- glassSelectValue(input, "pick")
# 
#   observe({
#     print(pick())
#   })
# }

## ----style selection----------------------------------------------------------
# observeEvent(input$filled, {
#   updateGlassSelect(
#     session,
#     "pick",
#     check_style = "filled"
#   )
# })

## ----updates------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   actionButton("subset", "Keep first 2 fruits"),
#   actionButton("banana", "Select banana"),
#   actionButton("clear", "Clear"),
#   actionButton("filled", "Use filled style"),
#   glassSelect("pick", fruits, clearable = TRUE),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   output$out <- renderPrint(input$pick)
# 
#   observeEvent(input$subset, {
#     updateGlassSelect(
#       session,
#       "pick",
#       choices = fruits[1:2]
#     )
#   })
# 
#   observeEvent(input$banana, {
#     updateGlassSelect(
#       session,
#       "pick",
#       selected = "banana"
#     )
#   })
# 
#   observeEvent(input$clear, {
#     updateGlassSelect(
#       session,
#       "pick",
#       selected = character(0)
#     )
#   })
# }
# 
# shinyApp(ui, server)

## ----presets------------------------------------------------------------------
# glassSelect("f", fruits, theme = "dark")
# glassSelect("f", fruits, theme = "light")

## ----custom-theme-------------------------------------------------------------
# glassSelect(
#   "f",
#   fruits,
#   theme = glass_select_theme(
#     mode = "dark",
#     accent_color = "#f59e0b"
#   )
# )
# 
# glassSelect(
#   "f",
#   fruits,
#   theme = glass_select_theme(
#     bg_color = "#1a0a2e",
#     border_color = "#a855f7",
#     text_color = "#ede9fe",
#     accent_color = "#a855f7"
#   )
# )
# 
# 
# #other themes
# glassSelect(
#   "f",
#   fruits,
#   theme = glass_select_theme(
#     mode = "light",
#     accent_color = "#2563eb"
#   )
# )
# 
# #more themes
# glassSelect(
#   "f",
#   fruits,
#   theme = glass_select_theme(
#     mode = "light",
#     bg_color = "#ffffff",
#     border_color = "rgba(0,0,0,0.15)",
#     text_color = "#111111",
#     accent_color = "#111111",
#     label_color = "#111111"
#   )
# )

## ----standalone---------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassSelect("region", c(North = "North", South = "South", East = "East")),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   output$out <- renderPrint(input$region)
# }
# 
# shinyApp(ui, server)

