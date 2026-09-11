## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ----complete-app-------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassTabsUI(
#     "reports",
#     glassTabPanel("summary", "Summary", selected = TRUE,
#       h3("Summary"), p("A quick view of the current reporting period.")
#     ),
#     glassTabPanel("activity", "Recent activity",
#       h3("Recent activity"), tableOutput("activity_table")
#     ),
#     glassTabPanel("quality", "Data quality",
#       h3("Data quality"), plotOutput("quality_plot")
#     ),
#     glassTabPanel("settings", "Team settings",
#       h3("Team settings"), textInput("team_name", "Team name")
#     ),
#     overflow = "scroll",
#     theme = "auto"
#   )
# )
# 
# server <- function(input, output, session) {
#   output$activity_table <- renderTable(head(mtcars))
#   output$quality_plot <- renderPlot(plot(mtcars$wt, mtcars$mpg))
# }
# 
# shinyApp(ui, server)

## ----overflow-choices---------------------------------------------------------
# glassTabsUI(
#   "wrapped",
#   glassTabPanel("one", "First report", selected = TRUE, p("First")),
#   glassTabPanel("two", "Second report", p("Second")),
#   glassTabPanel("three", "Third report", p("Third")),
#   overflow = "multiline"
# )
# 
# glassTabsUI(
#   "menu",
#   glassTabPanel("one", "First report", selected = TRUE, p("First")),
#   glassTabPanel("two", "Second report", p("Second")),
#   overflow = "menu"
# )

## ----touch--------------------------------------------------------------------
# glassTabsUI(
#   "story",
#   glassTabPanel("opening", "Opening", selected = TRUE, p("The first part.")),
#   glassTabPanel("middle", "Middle", p("The middle part.")),
#   glassTabPanel("ending", "Ending", p("The final part.")),
#   swipe = TRUE
# )

## ----no-swipe-----------------------------------------------------------------
# tags$div(`data-gt-no-swipe` = "", custom_touch_component)

## ----glass-page---------------------------------------------------------------
# ui <- glassPage(
#   title = "Operations",
#   glassTabsUI(
#     "main",
#     glassTabPanel("overview", "Overview", selected = TRUE, overview_ui),
#     glassTabPanel("alerts", "Alerts", alerts_ui),
#     overflow = "scroll",
#     theme = "auto"
#   )
# )

