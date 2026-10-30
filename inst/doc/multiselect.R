## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)
library(shiny)
library(glasstabs)

fruits <- c(Apple = "apple",
            Banana = "banana",
            Cherry = "cherry",
            Mango = "mango",
            Peach = "peach")

## ----app----------------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# fruits <- c(Apple = "apple",
#             Banana = "banana",
#             Cherry = "cherry",
#             Mango = "mango",
#             Peach = "peach")
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("pick", fruits),
#   glassFilterTags("pick"),
#   verbatimTextOutput("out")
# )
# 
# server <- function(input, output, session) {
#   output$out <- renderPrint(input$pick)
# }
# 
# if (interactive()) shinyApp(ui, server)

## ----ready--------------------------------------------------------------------
# server <- function(input, output, session) {
#   observeEvent(input$pick_ready, {
#     # Safe to read input$pick and drive downstream outputs here.
#   }, ignoreInit = FALSE)
# }

## ----selection----------------------------------------------------------------
# # All selected (default)
# glassMultiSelect("f", fruits)
# 
# # A subset pre-selected
# glassMultiSelect("f", fruits, selected = c("apple", "cherry"))
# 
# # Nothing pre-selected — the trigger shows the placeholder instead
# glassMultiSelect("f", fruits, selected = character(0))

## ----display------------------------------------------------------------------
# # "auto" — the familiar single-label / "Multiple selection" behavior
# glassMultiSelect("f", fruits, selection_display = "auto")
# 
# # "3 selected" — compact, always the same width
# glassMultiSelect("f", fruits, selection_display = "count")
# 
# # First labels, then "+N" — the dashboard default
# glassMultiSelect("f", fruits,
#   selection_display = "summary",
#   selection_max_items = 2
# )
# 
# # Every selected label, comma-separated
# glassMultiSelect("f", fruits, selection_display = "labels")

## ----styles-------------------------------------------------------------------
# # Bordered box + animated tick (default)
# glassMultiSelect("f", fruits, check_style = "checkbox")
# 
# # Tick only — minimal, no box border
# glassMultiSelect("f", fruits, check_style = "check-only")
# 
# # Solid coloured box
# glassMultiSelect("f", fruits, check_style = "filled")

## ----filled-------------------------------------------------------------------
# # One theme accent for every selected row (the default)
# glassMultiSelect("f", fruits,
#   check_style = "filled",
#   fill_colors = "single"
# )
# 
# # Per-option hues — categorical colour per choice
# glassMultiSelect("f", fruits,
#   check_style = "filled",
#   fill_colors = "multi"
# )

## ----hues---------------------------------------------------------------------
# glassMultiSelect("f", fruits,
#   check_style = "filled",
#   fill_colors = "multi",
#   hues = c(apple = 0, banana = 50, cherry = 340, mango = 30, peach = 20)
# )

## ----search-------------------------------------------------------------------
# # Always show the search box (the default)
# glassMultiSelect("f", fruits, searchable = TRUE)
# 
# # Hide it entirely — right for a small, fixed list
# glassMultiSelect("f", fruits, searchable = FALSE)
# 
# # Show it only once the list is big enough to need it
# glassMultiSelect("f", fruits,
#   searchable = "auto",
#   search_threshold = 12
# )

## ----width--------------------------------------------------------------------
# glassMultiSelect("f", fruits, width = "100%")
# glassMultiSelect("f", fruits, width = "240px")

## ----long-labels--------------------------------------------------------------
# glassMultiSelect(
#   "long_filters",
#   c(
#     "Commercial real estate development and property management services" = "property",
#     Healthcare = "healthcare"
#   ),
#   selected = "property",
#   width = "240px",
#   selection_display = "summary",
#   overflow_tooltip = "auto"
# )

## ----chrome-------------------------------------------------------------------
# glassMultiSelect("f", fruits,
#   show_style_switcher = FALSE,   # hide the Check / Box / Fill row
#   show_select_all     = FALSE,   # hide the "Select all" row
#   show_clear_all      = FALSE    # hide the "Clear all" footer link
# )

## ----disabled-----------------------------------------------------------------
# glassMultiSelect("filters_d", fruits, disabled = TRUE)
# glassMultiSelect("filters_dc", fruits, disabled_choices = "banana")

## ----groups-------------------------------------------------------------------
# glassMultiSelect("food", list(
#   Fruit = c(Apple = "apple", Banana = "banana"),
#   Veg   = c(Carrot = "carrot", Pea = "pea")
# ))

## ----filter-tags--------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("cat", fruits, show_style_switcher = FALSE),
#   glassFilterTags("cat")    # can be placed anywhere, even in a different tab pane
# )

## ----server-------------------------------------------------------------------
# server <- function(input, output, session) {
#   observe({
#     message("Selected: ", paste(input$pick, collapse = ", "))
#     message("Style: ", input$pick_style)
#   })
# }

## ----value-helper-------------------------------------------------------------
# server <- function(input, output, session) {
#   ms <- glassMultiSelectValue(input, "pick")
# 
#   observe({
#     message("Selected: ", paste(ms$selected(), collapse = ", "))
#     message("Style: ", ms$style())
#   })
# }

## ----empty-resolution---------------------------------------------------------
# rows <- data.frame(
#   fruit = c("apple", "banana", "cherry"),
#   n = c(12, 7, 9)
# )
# 
# server <- function(input, output, session) {
#   ms <- glassMultiSelectValue(
#     input,
#     "pick",
#     choices = fruits,
#     empty_behavior = "all"
#   )
# 
#   filtered <- reactive({
#     rows[rows$fruit %in% ms$resolved(), , drop = FALSE]
#   })
# }

## ----run-filter-empty-none----------------------------------------------------
# rows <- data.frame(
#   fruit = c("apple", "banana", "cherry"),
#   n = c(12, 7, 9)
# )
# 
# filter_none <- function(selected) {
#   if (is.null(selected) || length(selected) == 0L) {
#     return(rows[0, , drop = FALSE])
#   }
#   rows[rows$fruit %in% selected, , drop = FALSE]
# }
# 
# stopifnot(nrow(filter_none(character(0))) == 0L)
# stopifnot(nrow(filter_none("apple")) == 1L)

## ----run-filter-empty-all-----------------------------------------------------
# filter_all <- function(selected) {
#   if (is.null(selected) || length(selected) == 0L) {
#     return(rows)
#   }
#   rows[rows$fruit %in% selected, , drop = FALSE]
# }
# 
# stopifnot(nrow(filter_all(character(0))) == 3L)
# stopifnot(nrow(filter_all("banana")) == 1L)

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
#     updateGlassMultiSelect(session, "pick", choices = fruits[1:3])
#   })
# 
#   observeEvent(input$pick2, {
#     updateGlassMultiSelect(
#       session, "pick",
#       selected = c("apple", "cherry")
#     )
#   })
# 
#   observeEvent(input$clear, {
#     updateGlassMultiSelect(session, "pick", selected = character(0))
#   })
# 
#   observeEvent(input$fill, {
#     updateGlassMultiSelect(session, "pick", check_style = "filled")
#   })
# }
# 
# if (interactive()) shinyApp(ui, server)

## ----transactional-update-----------------------------------------------------
# server <- function(input, output, session) {
#   observeEvent(input$region, {
#     updateGlassMultiSelect(
#       session,
#       "pick",
#       choices = fruits[fruits %in% c("apple", "banana", "cherry")],
#       preserve_selection = TRUE,
#       drop_invalid = TRUE,
#       searchable = "auto",
#       notify = "changed"
#     )
#   })
# }

## ----lifecycle----------------------------------------------------------------
# server <- function(input, output, session) {
#   observeEvent(input$change_layout, {
#     closeGlassMultiSelect(session, "pick")
#   })
# }

## ----presets------------------------------------------------------------------
# glassMultiSelect("f", fruits, theme = "dark")   # default
# glassMultiSelect("f", fruits, theme = "light")  # white panel, dark text
# glassMultiSelect("f", fruits, theme = "auto")   # follows Bootstrap/bslib color mode

## ----dark-selector------------------------------------------------------------
# glassMultiSelect("f", fruits,
#   theme = "auto",
#   dark_selector = "body.dark-mode"
# )

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
# # Four commonly customized fields
# glassMultiSelect("f", fruits,
#   theme = glass_select_theme(
#     bg_color     = "#1a0a2e",
#     border_color = "#a855f7",
#     text_color   = "#ede9fe",
#     accent_color = "#a855f7"
#   )
# )

## ----presentation-------------------------------------------------------------
# glassMultiSelect("f", fruits,
#   tongue = TRUE,              # attached unfurl (default); FALSE = detached short fade
#   label_bold = TRUE,          # semibold field label, matching native inputs
#   label_size = "14px",        # keeps the title distinct from the options
#   search_focus_ring = FALSE,  # quiet search focus (default); TRUE = accent outline
#   shape = "square"            # crisp corners beside native selectize inputs
# )

## ----multi--------------------------------------------------------------------
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("a", c(X = "x", Y = "y", Z = "z")),
#   glassMultiSelect("b", c(P = "p", Q = "q", R = "r"),
#                    check_style = "filled",
#                    show_style_switcher = FALSE)
# )

## ----dashboard----------------------------------------------------------------
# library(shiny)
# library(glasstabs)
# 
# sales <- data.frame(
#   region  = c("North", "North", "South", "South", "East", "West"),
#   product = c("Alpha", "Beta", "Alpha", "Gamma", "Beta", "Alpha"),
#   revenue = c(42000, 31000, 27000, 55000, 38000, 61000)
# )
# 
# products_by_region <- list(
#   North = c(Alpha = "Alpha", Beta = "Beta"),
#   South = c(Alpha = "Alpha", Gamma = "Gamma"),
#   East  = c(Beta = "Beta"),
#   West  = c(Alpha = "Alpha")
# )
# 
# ui <- fluidPage(
#   useGlassTabs(),
#   glassMultiSelect("region",
#     c(North = "North", South = "South", East = "East", West = "West"),
#     show_style_switcher = FALSE
#   ),
#   glassMultiSelect("product",
#     c(Alpha = "Alpha", Beta = "Beta", Gamma = "Gamma"),
#     show_style_switcher = FALSE,
#     check_style = "check-only"
#   ),
#   glassFilterTags("region"),
#   glassFilterTags("product"),
#   actionButton("reset", "Reset filters"),
#   tableOutput("tbl")
# )
# 
# server <- function(input, output, session) {
#   fallback <- function(x, default) {
#     if (is.null(x) || length(x) == 0) default else x
#   }
# 
#   # Region drives the product list; keep what still applies.
#   observeEvent(input$region, {
#     available <- unique(unlist(
#       products_by_region[fallback(input$region, names(products_by_region))],
#       use.names = FALSE
#     ))
#     updateGlassMultiSelect(
#       session, "product",
#       choices = stats::setNames(available, available),
#       preserve_selection = TRUE,
#       drop_invalid = TRUE,
#       notify = "changed"
#     )
#   }, ignoreNULL = FALSE)
# 
#   observeEvent(input$reset, {
#     updateGlassMultiSelect(session, "region", selected = character(0))
#     updateGlassMultiSelect(session, "product", selected = character(0))
#   })
# 
#   filtered <- reactive({
#     sales[
#       sales$region %in% fallback(input$region, unique(sales$region)) &
#       sales$product %in% fallback(input$product, unique(sales$product)),
#     ]
#   })
# 
#   output$tbl <- renderTable(filtered())
# }
# 
# if (interactive()) shinyApp(ui, server)

