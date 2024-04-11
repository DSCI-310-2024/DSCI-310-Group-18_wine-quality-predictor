library(testthat)
library(tidyverse)

source("../../R/combine_model_metrics.R")

test_that("calculate_model_metric should correctly calculate accuracy", {
  expect_equal(test_accuracy, 1.0)
})

test_that("calculate_model_metric should correctly calculate precision", {
  expect_equal(test_precision, 1.0)
})

test_that("calculate_model_metric should correctly calculate recall", {
  expect_equal(test_recall, 1.0)
})

test_that("gives an error when an incorrect metric is put in", {
  expect_error(test_predictions %>%
              calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "invalid"))
})

test_that("calculate different precise values for accuracy, precision, and recall", {
  expect_equal(round(diff_test_accuracy, digits = 3), 0.400)
  expect_equal(round(diff_test_precision, digits = 3), 0.411)
  expect_equal(round(diff_test_recall, digits = 3), 0.389)
})
