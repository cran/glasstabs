## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## -----------------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   # widgets go here
# )

## -----------------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassTabsUI(
#     "main",
#     glassTabPanel("overview", "Overview", selected = TRUE, h3("Overview")),
#     glassTabPanel("details", "Details", h3("Details"))
#   )
# )
# 
# server <- function(input, output, session) {
#   active_tab <- glassTabsServer("main")
# }

## -----------------------------------------------------------------------------
# # UI function
# my_ui <- function(id) {
#   ns <- NS(id)
#   tagList(
#     useGlassTabs(),
#     glassTabsUI(
#       ns("tabs"),                          # ns() wraps the id in the UI
#       glassTabPanel("summary", "Summary", selected = TRUE, h3("Summary")),
#       glassTabPanel("detail",  "Detail",  h3("Detail"))
#     )
#   )
# }
# 
# # Server function
# my_server <- function(id) {
#   moduleServer(id, function(input, output, session) {
#     active <- glassTabsServer("tabs")    # bare id — no ns() here
# 
#     observeEvent(active(), {
#       message("Active tab: ", active())
#     })
#   })
# }
# 
# # App
# ui     <- fluidPage(my_ui("explorer"))
# server <- function(input, output, session) my_server("explorer")
# if (interactive()) shinyApp(ui, server)

## -----------------------------------------------------------------------------
# # Build panels from data
# tab_defs <- list(
#   list(value = "revenue", label = "Revenue"),
#   list(value = "orders",  label = "Orders"),
#   list(value = "returns", label = "Returns")
# )
# 
# panels <- lapply(tab_defs, function(t) {
#   glassTabPanel(t$value, t$label, h3(t$label))
# })
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   do.call(glassTabsUI, c(list("metrics", selected = "orders"), panels))
# )
# 
# server <- function(input, output, session) {
#   active <- glassTabsServer("metrics")
# }

## -----------------------------------------------------------------------------
# # Switch active tab
# updateGlassTabsUI(session, "main", "details")
# 
# # Hide or show a tab
# hideGlassTab(session, "main", "admin")
# showGlassTab(session, "main", "admin")
# 
# # Append or remove a tab at runtime
# appendGlassTab(
#   session, "main",
#   glassTabPanel("compare", "Compare", h3("Compare")),
#   select = TRUE
# )
# removeGlassTab(session, "main", "compare")

## -----------------------------------------------------------------------------
# glassTabsUI(
#   "main",
#   glassTabPanel("a", "A", selected = TRUE, p("A")),
#   glassTabPanel("b", "B", p("B")),
#   selected = "a",
#   wrap = TRUE,
#   compact = FALSE,      # set TRUE inside dashboard cards for tighter layout
#   extra_ui = tags$div("Right side UI"),
#   theme = "light"
# )

## -----------------------------------------------------------------------------
# bs4Card(
#   title = "Explorer", width = 12,
#   glassTabsUI(
#     "tabs",
#     glassTabPanel("a", "A", selected = TRUE, p("Content")),
#     glassTabPanel("b", "B", p("More content")),
#     compact = TRUE      # reduced spacing for card context
#   )
# )

## -----------------------------------------------------------------------------
# choices <- c(Revenue = "revenue", Orders = "orders", Returns = "returns")
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("metric", choices),
#   glassFilterTags("metric")
# )
# 
# server <- function(input, output, session) {
#   metric <- glassMultiSelectValue(input, "metric")
# }

## -----------------------------------------------------------------------------
# updateGlassMultiSelect(
#   session,
#   "metric",
#   selected = c("revenue", "orders"),
#   check_style = "filled"
# )
# 
# # Clear selection
# updateGlassMultiSelect(session, "metric", selected = character(0))

## -----------------------------------------------------------------------------
# glassMultiSelect(
#   "metric",
#   choices,
#   selected = unname(choices),
#   label = "Metrics",
#   placeholder = "Choose metrics",
#   all_label = "All metrics",
#   check_style = "checkbox",
#   show_style_switcher = TRUE,
#   show_select_all = TRUE,
#   show_clear_all = TRUE,
#   theme = "dark"
# )

## -----------------------------------------------------------------------------
# regions <- c("All Regions" = "all", North = "north", South = "south")
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassSelect("region", regions, selected = "all")
# )
# 
# server <- function(input, output, session) {
#   region <- glassSelectValue(input, "region")
# }

## -----------------------------------------------------------------------------
# updateGlassSelect(session, "region", selected = "south")
# 
# # Clear value
# updateGlassSelect(session, "region", selected = character(0))

## -----------------------------------------------------------------------------
# glassSelect(
#   "region",
#   regions,
#   selected = "all",
#   label = "Region",
#   placeholder = "Pick a region",
#   searchable = TRUE,
#   clearable = TRUE,
#   include_all = FALSE,
#   check_style = "checkbox",
#   theme = "light"
# )

## -----------------------------------------------------------------------------
# library(shiny)
# library(bs4Dash)
# 
# ui <- bs4DashPage(
#   header  = bs4DashNavbar(),
#   sidebar = bs4DashSidebar(
#     bs4SidebarMenu(
#       bs4SidebarMenuItem("Explorer", tabName = "explorer", icon = icon("table"))
#     )
#   ),
#   body = bs4DashBody(
#     useGlassTabs(),                     # place once, anywhere in the body
#     bs4TabItems(
#       bs4TabItem(
#         tabName = "explorer",
#         bs4Card(
#           title = "Data explorer",
#           width = 12,
#           glassTabsUI(
#             "s3_tabs",
#             glassTabPanel("buckets", "Buckets", selected = TRUE,
#               p("List of S3 buckets here.")
#             ),
#             glassTabPanel("objects", "Objects",
#               p("Object browser here.")
#             ),
#             glassTabPanel("preview", "Preview",
#               p("File preview here.")
#             )
#           )
#         )
#       )
#     )
#   )
# )
# 
# server <- function(input, output, session) {
#   active <- glassTabsServer("s3_tabs")
# }
# 
# if (interactive()) shinyApp(ui, server)

## -----------------------------------------------------------------------------
# # Tabs
# glassTabsUI(
#   "main",
#   glassTabPanel("a", "A", selected = TRUE, p("A")),
#   theme = glass_tab_theme(
#     halo_bg = "rgba(251,191,36,0.15)",
#     tab_active_text = "#fef3c7"
#   )
# )
# 
# # Select widgets
# glassMultiSelect(
#   "metric", choices,
#   theme = glass_select_theme(
#     mode = "dark",
#     accent_color = "#38bdf8"
#   )
# )

## -----------------------------------------------------------------------------
# # Instead of: condition = "input['main-active_tab'] === 'details'"
# conditionalPanel(
#   condition = glassTabCondition("main", "details"),
#   p("Only visible on the Details tab.")
# )
# 
# # Inside a module — pass the same id as glassTabsUI():
# # glassTabsUI(ns("tabs"), ...)
# conditionalPanel(
#   condition = glassTabCondition(NS("mymod")("tabs"), "details"),
#   p("Only visible on the Details tab.")
# )

## ----eval=FALSE---------------------------------------------------------------
# glasstabs_news()      # prints changelog to the console

