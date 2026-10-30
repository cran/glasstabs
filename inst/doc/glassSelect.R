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
# if (interactive()) shinyApp(ui, server)

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

## ----shape--------------------------------------------------------------------
# # Rounded (default)
# glassSelect("region_rounded", fruits, shape = "rounded")
# 
# # Square - matches selectizeInput()
# glassSelect("region_square", fruits, shape = "square")

## ----shape-comparison---------------------------------------------------------
# fluidRow(
#   column(
#     6,
#     selectizeInput("native_region", "Native", choices = fruits)
#   ),
#   column(
#     6,
#     glassSelect(
#       "glass_region",
#       fruits,
#       label = "glasstabs",
#       shape = "square",
#       width = "100%"
#     )
#   )
# )

## ----parity-------------------------------------------------------------------
# # Fixed / fluid width
# glassSelect("region_w", fruits, width = "240px")
# 
# # Grouped choices (selectInput()-style named list)
# glassSelect("food", list(
#   Fruit = c(Apple = "apple", Banana = "banana"),
#   Veg   = c(Carrot = "carrot", Pea = "pea")
# ))
# 
# # Disable the whole widget, or specific options
# glassSelect("region_d", fruits, disabled = TRUE)
# glassSelect("region_dc", fruits, disabled_choices = "banana")

## ----long-labels--------------------------------------------------------------
# long_industries <- c(
#   "Renewable energy generation, storage, and grid-scale distribution networks" = "energy",
#   Healthcare = "healthcare"
# )
# 
# glassSelect(
#   "industry",
#   long_industries,
#   selected = "energy",
#   width = "240px",
#   overflow_tooltip = "auto"
# )

## ----lifecycle----------------------------------------------------------------
# observeEvent(input$change_layout, {
#   closeGlassSelect(session, "pick")
# })

## ----open-state---------------------------------------------------------------
# observe({
#   message("Dropdown open: ", isTRUE(input$pick_open))
# })

## ----search-clear-------------------------------------------------------------
# glassSelect(
#   "f",
#   fruits,
#   searchable = TRUE,
#   clearable = TRUE
# )

## ----automatic-search---------------------------------------------------------
# glassSelect(
#   "category",
#   c(Alpha = "alpha", Beta = "beta", Gamma = "gamma", Delta = "delta", Epsilon = "epsilon"),
#   searchable = "auto",
#   search_threshold = 6
# )

## ----update-automatic-search--------------------------------------------------
# updateGlassSelect(
#   session,
#   "category",
#   searchable = "auto",
#   search_threshold = 5
# )

## ----presentation-options-----------------------------------------------------
# glassSelect(
#   "f",
#   fruits,
#   theme = "auto",
#   dark_selector = "body.app-dark",
#   tongue = FALSE,
#   label_bold = TRUE,
#   label_size = "14px",
#   search_focus_ring = FALSE
# )

## ----no-search----------------------------------------------------------------
# glassSelect(
#   "f",
#   fruits,
#   searchable = FALSE
# )

## ----server-search------------------------------------------------------------
# many_choices <- stats::setNames(
#   sprintf("value-%04d", 1:2000),
#   sprintf("Choice %04d", 1:2000)
# )
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassSelect(
#     "pick",
#     many_choices,
#     selected = "value-1500",
#     clearable = TRUE,
#     server = TRUE,
#     server_limit = 30
#   ),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   glassSelectServer("pick", many_choices, session = session, limit = 30)
#   output$out <- renderPrint(input$pick)
# }
# 
# if (interactive()) shinyApp(ui, server)

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
# if (interactive()) shinyApp(ui, server)

## ----presets------------------------------------------------------------------
# glassSelect("f", fruits, theme = "dark")
# glassSelect("f", fruits, theme = "light")
# glassSelect("f", fruits, theme = "auto")

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
# if (interactive()) shinyApp(ui, server)

