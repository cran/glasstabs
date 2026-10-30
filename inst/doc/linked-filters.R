## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)
library(shiny)
library(glasstabs)

## ----run-keep-available-------------------------------------------------------
# selected <- c("apple", "banana", "durian")
# new_choices <- c("apple", "banana", "cherry")
# kept <- intersect(selected, new_choices)
# stopifnot(identical(kept, c("apple", "banana")))

## ----keep-available-----------------------------------------------------------
# updateGlassMultiSelect(
#   session,
#   "facility",
#   choices = available_facilities,
#   preserve_selection = TRUE,
#   drop_invalid = TRUE,
#   notify = "changed"
# )

## ----select-all-new-----------------------------------------------------------
# updateGlassMultiSelect(
#   session,
#   "facility",
#   choices = available_facilities,
#   selected = unname(available_facilities),
#   notify = "changed"
# )

## ----disable-update-----------------------------------------------------------
# updateGlassMultiSelect(
#   session,
#   "facility",
#   choices = available_facilities,
#   disabled_choices = "durian",
#   notify = "changed"
# )

## ----settling-----------------------------------------------------------------
# updateGlassMultiSelect(session, "county", choices = counties, notify = "changed")
# updateGlassMultiSelect(session, "facility", choices = facilities, notify = "changed")
# updateGlassMultiSelect(session, "region", choices = regions, notify = "changed")

## ----run-reset-vectors--------------------------------------------------------
# all_choices <- c("apple", "banana", "cherry")
# initial_selection <- c("apple")
# reset_all <- unname(all_choices)
# reset_default <- initial_selection
# reset_none <- character(0)
# stopifnot(length(reset_all) == 3L)
# stopifnot(identical(reset_default, "apple"))
# stopifnot(length(reset_none) == 0L)

