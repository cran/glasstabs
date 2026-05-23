## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ----basic--------------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassTabsUI("nav",
#     glassTabPanel("overview", "Overview", selected = TRUE,
#       h3("Overview"),
#       p("This pane is shown first.")
#     ),
#     glassTabPanel("details", "Details",
#       h3("Details"),
#       p("Switch to this tab using the button above.")
#     ),
#     glassTabPanel("settings", "Settings",
#       h3("Settings"),
#       p("A third tab.")
#     )
#   )
# )
# 
# server <- function(input, output, session) {}
# 
# if (interactive()) shinyApp(ui, server)

## ----server-input-------------------------------------------------------------
# server <- function(input, output, session) {
#   observe({
#     req(input[["nav-active_tab"]])
#     message("Active tab: ", input[["nav-active_tab"]])
#   })
# 
#   # Or use the convenience wrapper
#   active <- glassTabsServer("nav")
#   observe(message("Active: ", active()))
# }

## ----extra-ui-----------------------------------------------------------------
# choices <- c(Alpha = "alpha", Beta = "beta", Gamma = "gamma")
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassTabsUI("nav",
#     extra_ui = glassMultiSelect("cat", choices, show_style_switcher = FALSE),
#     glassTabPanel("a", "Tab A", selected = TRUE,
#       p("Content A"),
#       glassFilterTags("cat")   # tag pills synced to the filter
#     ),
#     glassTabPanel("b", "Tab B",
#       p("Content B"),
#       glassFilterTags("cat")
#     )
#   )
# )

## ----theme-presets------------------------------------------------------------
# # Dark (default)
# glassTabsUI("nav", theme = "dark", ...)
# 
# # Light — suits white page backgrounds and bs4Dash cards
# glassTabsUI("nav", theme = "light", ...)

## ----theme-custom-------------------------------------------------------------
# # Change only the halo colour
# glassTabsUI("nav",
#   theme = glass_tab_theme(
#     halo_bg         = "rgba(251,191,36,0.18)",
#     halo_border     = "rgba(251,191,36,0.40)",
#     tab_active_text = "#fef3c7"
#   ),
#   glassTabPanel("a", "Tab", selected = TRUE, p("Content"))
# )

## ----bs4dash------------------------------------------------------------------
# library(bs4Dash)
# library(glasstabs)
# 
# ui <- bs4DashPage(
#   header  = bs4DashNavbar(title = "My App"),
#   sidebar = bs4DashSidebar(disable = TRUE),
#   body    = bs4DashBody(
#     useGlassTabs(),
#     bs4Card(
#       title = "Analysis", width = 12,
#       glassTabsUI("dash",
#         wrap     = FALSE,
#         theme    = "light",
#         extra_ui = glassMultiSelect("f", choices, theme = "light",
#                                     show_style_switcher = FALSE),
#         glassTabPanel("a", "Overview", selected = TRUE, p("Overview content")),
#         glassTabPanel("b", "Details",  p("Detail content"))
#       )
#     )
#   )
# )

## ----multi-instance-----------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),    # only needed once per page
#   glassTabsUI("widget1",
#     glassTabPanel("a", "One-A", selected = TRUE, p("Widget 1, pane A")),
#     glassTabPanel("b", "One-B", p("Widget 1, pane B"))
#   ),
#   glassTabsUI("widget2",
#     glassTabPanel("x", "Two-X", selected = TRUE, p("Widget 2, pane X")),
#     glassTabPanel("y", "Two-Y", p("Widget 2, pane Y"))
#   )
# )
# 
# server <- function(input, output, session) {
#   observe(message("Widget 1 active: ", input[["widget1-active_tab"]]))
#   observe(message("Widget 2 active: ", input[["widget2-active_tab"]]))
# }

