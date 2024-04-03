library(testthat)
library(tidyverse)
library(vdiffr)
source("../../R/create_lineplot.R")

test_that("refactoring code should not change our plot", {
  expect_doppelganger("create lineplot", test_plot)
})

test_that("The data frame should call existing columns", {
  expect_error(wrong_col_plot)
})

test_that("The plot should not take empty columns", {
  expect_error(empty_plot)
})

test_that("Columns should be numeric", {
  expect_error(str_plot)
})

test_that("`df` should be a dataframe", {
  expect_error(list_plot)
})

test_that("Title should not be produced if no axis labels specified", {
  expect_error(title_plot)
})

test_that("Default settings plot should have all default values", {
  expect_equal(default_plot$theme$text$size, 12)
  expect_equal(default_plot$labels$x, "")
  expect_equal(default_plot$labels$y, "")
})


test_that("The plot should use geom_point and geom_line.", {
  expect_true("GeomPoint" %in% c(class(test_plot$layers[[1]]$geom)))
  expect_true("GeomLine" %in% c(class(test_plot$layers[[2]]$geom)))
})

test_that("The plot should map `x` to x-axis and `y` to y-axis.", {
  expect_true("time" == rlang::get_expr(test_plot$mapping$x))
  expect_true("absorbance" == rlang::get_expr(test_plot$mapping$y))
})
