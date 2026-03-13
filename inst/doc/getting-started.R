## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ----install------------------------------------------------------------------
# # From CRAN
# install.packages("glasstabs")
# 
# # From GitHub
# pak::pak("YOUR_GITHUB_USERNAME/glasstabs")
# 
# # From source
# devtools::install_local("path/to/glasstabs")

## ----use----------------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# ui <- fluidPage(
#   useGlassTabs(),   # <-- this is all you need
#   # ... rest of your UI
# )

## ----tab-panels---------------------------------------------------------------
# glassTabPanel("overview", "Overview", selected = TRUE,
#   h3("Welcome"),
#   p("This is the overview pane.")
# )

## ----tabs-ui------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassTabsUI("nav",
#     glassTabPanel("overview", "Overview", selected = TRUE,
#       shiny::h3("Welcome"),
#       shiny::p("Start here.")
#     ),
#     glassTabPanel("analysis", "Analysis",
#       shiny::h3("Analysis"),
#       shiny::p("Your charts go here.")
#     ),
#     glassTabPanel("settings", "Settings",
#       shiny::h3("Settings"),
#       shiny::p("Configuration options.")
#     )
#   )
# )

## ----tabs-server--------------------------------------------------------------
# server <- function(input, output, session) {
#   observe({
#     req(input[["nav-active_tab"]])
#     message("User is on: ", input[["nav-active_tab"]])
#   })
# }
# 
# shinyApp(ui, server)

## ----ms-basic-----------------------------------------------------------------
# choices <- c(Alpha = "alpha", Beta = "beta", Gamma = "gamma", Delta = "delta")
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("category", choices),
#   verbatimTextOutput("selected")
# )

## ----ms-server----------------------------------------------------------------
# server <- function(input, output, session) {
#   output$selected <- renderPrint(input$category)
# }
# 
# shinyApp(ui, server)

## ----ms-helper----------------------------------------------------------------
# server <- function(input, output, session) {
#   ms <- glassMultiSelectValue(input, "category")
# 
#   observe({
#     message("Selected: ", paste(ms$selected(), collapse = ", "))
#     message("Style: ", ms$style())
#   })
# }

## ----ms-update----------------------------------------------------------------
# server <- function(input, output, session) {
#   observeEvent(input$reset, {
#     updateGlassMultiSelect(
#       session,
#       "category",
#       selected = character(0)
#     )
#   })
# }

## ----gs-basic-----------------------------------------------------------------
# choices <- c(
#   North = "north",
#   South = "south",
#   East  = "east",
#   West  = "west"
# )
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassSelect("region", choices, clearable = TRUE),
#   verbatimTextOutput("selected")
# )

## ----gs-server----------------------------------------------------------------
# server <- function(input, output, session) {
#   output$selected <- renderPrint(input$region)
# }
# 
# shinyApp(ui, server)

## ----gs-update----------------------------------------------------------------
# server <- function(input, output, session) {
#   observeEvent(input$pick_south, {
#     updateGlassSelect(
#       session,
#       "region",
#       selected = "south"
#     )
#   })
# }

## ----together-----------------------------------------------------------------
# choices <- c(North = "north", South = "south", East = "east", West = "west")
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassTabsUI("main",
#     extra_ui = glassMultiSelect(
#       inputId             = "region",
#       choices             = choices,
#       show_style_switcher = FALSE
#     ),
#     glassTabPanel("summary", "Summary", selected = TRUE,
#       shiny::h3("Summary"),
#       glassFilterTags("region"),        # tag pills appear here
#       shiny::uiOutput("summary_text")
#     ),
#     glassTabPanel("detail", "Detail",
#       shiny::h3("Detail"),
#       glassFilterTags("region"),        # same filter, second pane
#       shiny::tableOutput("detail_table")
#     )
#   )
# )
# 
# server <- function(input, output, session) {
# 
#   selected_regions <- reactive({
#     input$region %||% unique(unname(choices))
#   })
# 
#   output$summary_text <- renderUI({
#     shiny::p("Showing data for: ",
#              shiny::strong(paste(selected_regions(), collapse = ", ")))
#   })
# 
#   output$detail_table <- renderTable({
#     data.frame(Region = selected_regions())
#   })
# }
# 
# shinyApp(ui, server)

## ----themes-------------------------------------------------------------------
# # Built-in light preset
# glassTabsUI("nav",    theme = "light", ...)
# glassMultiSelect("f", theme = "light", ...)
# 
# # Custom — one field each
# glassTabsUI("nav",
#   theme = glass_tab_theme(halo_bg = "rgba(251,191,36,0.15)"),
#   ...
# )
# 
# glassMultiSelect("f", choices,
#   theme = glass_select_theme(accent_color = "#f59e0b")
# )

## ----bs4dash------------------------------------------------------------------
# library(bs4Dash)
# library(glasstabs)
# 
# choices <- c(Alpha = "alpha", Beta = "beta", Gamma = "gamma")
# 
# ui <- bs4DashPage(
#   header  = bs4DashNavbar(title = "My App"),
#   sidebar = bs4DashSidebar(disable = TRUE),
#   body    = bs4DashBody(
#     useGlassTabs(),
#     bs4Card(
#       title = "Analysis", width = 12,
#       glassTabsUI("dash",
#         wrap = FALSE,
#         theme = "light",
#         extra_ui = glassMultiSelect(
#           "f",
#           choices,
#           theme = "light",
#           show_style_switcher = FALSE
#         ),
#         glassTabPanel("a", "Overview", selected = TRUE,
#           shiny::p("Overview content.")
#         ),
#         glassTabPanel("b", "Detail",
#           shiny::p("Detail content.")
#         )
#       )
#     )
#   )
# )
# 
# server <- function(input, output, session) {}
# shinyApp(ui, server)

