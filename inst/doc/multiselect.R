## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ----basic--------------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# fruits <- c(Apple = "apple",
#             Banana = "banana",
#             Cherry = "cherry",
#             Mango  = "mango",
#             Peach  = "peach")
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("pick", fruits),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   output$out <- renderPrint(input$pick)
# }
# 
# if (interactive()) shinyApp(ui, server)

## ----initial------------------------------------------------------------------
# # All selected (default)
# glassMultiSelect("f", fruits)
# 
# # Subset pre-selected
# glassMultiSelect("f", fruits, selected = c("apple", "cherry"))
# 
# # Nothing pre-selected
# glassMultiSelect("f", fruits, selected = character(0))

## ----styles-------------------------------------------------------------------
# # Bordered box + animated tick (default)
# glassMultiSelect("f", fruits, check_style = "checkbox")
# 
# # Tick only — minimal, no box border
# glassMultiSelect("f", fruits, check_style = "check-only")
# 
# # Solid coloured box — each option gets its own hue
# glassMultiSelect("f", fruits, check_style = "filled")

## ----hide-switcher------------------------------------------------------------
# glassMultiSelect("f", fruits,
#   check_style         = "check-only",
#   show_style_switcher = FALSE          # lock the style silently
# )

## ----hues---------------------------------------------------------------------
# glassMultiSelect("f", fruits,
#   check_style = "filled",
#   hues = c(apple = 0, banana = 50, cherry = 340, mango = 30, peach = 20)
# )

## ----shape--------------------------------------------------------------------
# # Rounded (default)
# glassMultiSelect("filters_rounded", fruits, shape = "rounded")
# 
# # Square - matches selectizeInput()
# glassMultiSelect("filters_square", fruits, shape = "square")

## ----shape-comparison---------------------------------------------------------
# fluidRow(
#   column(
#     6,
#     selectizeInput(
#       "native_filters", "Native", choices = fruits, multiple = TRUE
#     )
#   ),
#   column(
#     6,
#     glassMultiSelect(
#       "glass_filters",
#       fruits,
#       label = "glasstabs",
#       shape = "square",
#       width = "100%"
#     )
#   )
# )

## ----ms-parity----------------------------------------------------------------
# # Fixed / fluid width
# glassMultiSelect("filters_w", fruits, width = "100%")
# 
# # Grouped choices (selectInput()-style named list)
# glassMultiSelect("food", list(
#   Fruit = c(Apple = "apple", Banana = "banana"),
#   Veg   = c(Carrot = "carrot", Pea = "pea")
# ))
# 
# # Disable the whole widget, or specific options
# glassMultiSelect("filters_d", fruits, disabled = TRUE)
# glassMultiSelect("filters_dc", fruits, disabled_choices = "banana")

## ----lifecycle----------------------------------------------------------------
# observeEvent(input$change_layout, {
#   closeGlassMultiSelect(session, "pick")
# })

## ----chrome-------------------------------------------------------------------
# glassMultiSelect("f", fruits,
#   show_style_switcher = FALSE,   # hide the Check / Box / Fill row
#   show_select_all     = FALSE,   # hide the "Select all" row
#   show_clear_all      = FALSE    # hide the "Clear all" footer link
# )

## ----filter-tags--------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("cat", fruits, show_style_switcher = FALSE),
#   glassFilterTags("cat")    # can be placed anywhere, even in a different tab pane
# )

## ----server-------------------------------------------------------------------
# server <- function(input, output, session) {
# 
#   # Direct access
#   observe({
#     message("Selected: ", paste(input$pick, collapse = ", "))
#     message("Style: ",    input$pick_style)
#   })
# }

## ----server-helper------------------------------------------------------------
# server <- function(input, output, session) {
#   ms <- glassMultiSelectValue(input, "pick")
# 
#   observe({
#     message("Selected: ", paste(ms$selected(), collapse = ", "))
#     message("Style: ", ms$style())
#   })
# }

## ----server-search------------------------------------------------------------
# many_choices <- stats::setNames(
#   sprintf("value-%04d", 1:2000),
#   sprintf("Choice %04d", 1:2000)
# )
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect(
#     "pick",
#     many_choices,
#     server = TRUE,
#     server_limit = 30,
#     show_style_switcher = FALSE
#   ),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   glassMultiSelectServer("pick", many_choices, session = session, limit = 30)
#   output$out <- renderPrint(length(input$pick))
# }
# 
# if (interactive()) shinyApp(ui, server)

## ----updates------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   actionButton("subset", "Keep first 3 fruits"),
#   actionButton("pick2", "Select 2 fruits"),
#   actionButton("clear", "Clear"),
#   actionButton("fill", "Switch to filled style"),
#   glassMultiSelect("pick", fruits),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   output$out <- renderPrint(input$pick)
# 
#   observeEvent(input$subset, {
#     updateGlassMultiSelect(
#       session,
#       "pick",
#       choices = fruits[1:3]
#     )
#   })
# 
#   observeEvent(input$pick2, {
#     updateGlassMultiSelect(
#       session,
#       "pick",
#       selected = c("apple", "cherry")
#     )
#   })
# 
#   observeEvent(input$clear, {
#     updateGlassMultiSelect(
#       session,
#       "pick",
#       selected = character(0)
#     )
#   })
# 
#   observeEvent(input$fill, {
#     updateGlassMultiSelect(
#       session,
#       "pick",
#       check_style = "filled"
#     )
#   })
# }
# 
# if (interactive()) shinyApp(ui, server)

## ----presets------------------------------------------------------------------
# glassMultiSelect("f", fruits, theme = "dark")   # default
# glassMultiSelect("f", fruits, theme = "light")  # white panel, dark text
# glassMultiSelect("f", fruits, theme = "auto")   # follows Bootstrap/bslib color mode

## ----custom-theme-------------------------------------------------------------
# # One field — accent colour only
# glassMultiSelect("f", fruits,
#   theme = glass_select_theme(accent_color = "#f59e0b")
# )
# 
# # Two fields
# glassMultiSelect("f", fruits,
#   theme = glass_select_theme(
#     text_color   = "#1e293b",
#     accent_color = "#2563eb"
#   )
# )
# 
# # All four fields
# glassMultiSelect("f", fruits,
#   theme = glass_select_theme(
#     bg_color     = "#1a0a2e",
#     border_color = "#a855f7",
#     text_color   = "#ede9fe",
#     accent_color = "#a855f7"
#   )
# )

## ----standalone---------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# sales <- data.frame(
#   region  = c("North","North","South","South","East","West"),
#   product = c("Alpha","Beta","Alpha","Gamma","Beta","Alpha"),
#   revenue = c(42000, 31000, 27000, 55000, 38000, 61000)
# )
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("region",  c(North="North", South="South",
#                                 East="East",   West="West"),
#                    show_style_switcher = FALSE),
#   glassMultiSelect("product", c(Alpha="Alpha", Beta="Beta", Gamma="Gamma"),
#                    show_style_switcher = FALSE,
#                    check_style = "check-only"),
#   glassFilterTags("region"),
#   glassFilterTags("product"),
#   tableOutput("tbl")
# )
# 
# server <- function(input, output, session) {
#   filtered <- reactive({
#     sales[sales$region  %in% (input$region  %||% unique(sales$region)) &
#           sales$product %in% (input$product %||% unique(sales$product)), ]
#   })
#   output$tbl <- renderTable(filtered())
# }
# 
# if (interactive()) shinyApp(ui, server)

## ----multi--------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("a", c(X = "x", Y = "y", Z = "z")),
#   glassMultiSelect("b", c(P = "p", Q = "q", R = "r"),
#                    check_style = "filled",
#                    show_style_switcher = FALSE)
# )

