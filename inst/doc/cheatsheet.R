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
#   extra_ui = tags$div("Right side UI"),
#   theme = "light"
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

