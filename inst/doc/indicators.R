## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## -----------------------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# demo_tabs <- function(id, indicator) {
#   glassTabsUI(
#     id,
#     glassTabPanel("overview", "Overview", p("Overview content")),
#     glassTabPanel("data",     "Data",     p("Data content")),
#     glassTabPanel("settings", "Settings", p("Settings content")),
#     indicator = indicator,
#     compact   = TRUE
#   )
# }
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   tags$head(tags$style("body{background:#0f172a;color:#e2e8f0;}")),
#   h4("indicator = \"glass\""),     demo_tabs("g",  "glass"),
#   h4("indicator = \"solid\""),     demo_tabs("s",  "solid"),
#   h4("indicator = \"underline\""), demo_tabs("u",  "underline")
# )
# 
# server <- function(input, output, session) {}
# shinyApp(ui, server)

## -----------------------------------------------------------------------------
# amber <- glass_tab_theme(
#   halo_bg     = "rgba(251, 191, 36, 0.18)",
#   halo_border = "rgba(251, 191, 36, 0.65)"
# )
# 
# glassTabsUI("amber_demo",
#   glassTabPanel("a", "Alpha", p("...")),
#   glassTabPanel("b", "Beta",  p("...")),
#   indicator = "underline",   # amber bar
#   theme     = amber
# )

## -----------------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassTabsUI(
#     "side",
#     glassTabPanel("inbox",   "Inbox",   p("Inbox content")),
#     glassTabPanel("sent",    "Sent",    p("Sent content")),
#     glassTabPanel("archive", "Archive", p("Archive content")),
#     orientation = "vertical",
#     indicator   = "underline"
#   )
# )

## -----------------------------------------------------------------------------
# library(bslib)
# 
# ui <- page_fluid(
#   theme = bs_theme(version = 5),
#   useGlassTabs(),
#   input_dark_mode(id = "mode"),
#   glassTabsUI(
#     "auto_demo",
#     glassTabPanel("a", "Alpha", p("Toggle dark mode above - the tabs follow.")),
#     glassTabPanel("b", "Beta",  p("No server code needed.")),
#     theme = "auto"
#   )
# )
# 
# server <- function(input, output, session) {}
# shinyApp(ui, server)

## -----------------------------------------------------------------------------
# glassTabsUI("bs4",
#   glassTabPanel("a", "Alpha", p("...")),
#   theme = "light",
#   dark_selector = "body.dark-mode"
# )

## ----complete-app-------------------------------------------------------------
# library(shiny)
# library(bslib)
# library(glasstabs)
# 
# ui <- page_fluid(
#   theme = bs_theme(version = 5),
#   useGlassTabs(),
#   input_dark_mode(id = "mode"),
#   glassTabsUI(
#     "workflow",
#     glassTabPanel("inbox", "Inbox", selected = TRUE, p("New work")),
#     glassTabPanel("review", "Review", p("Items awaiting review")),
#     glassTabPanel("done", "Done", p("Completed work")),
#     orientation = "vertical",
#     indicator = "solid",
#     tab_align = "left",
#     theme = "auto"
#   )
# )
# 
# server <- function(input, output, session) {}
# 
# if (interactive()) {
#   shinyApp(ui, server)
# }

