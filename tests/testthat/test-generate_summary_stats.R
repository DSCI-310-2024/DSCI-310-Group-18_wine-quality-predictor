library(testthat)
library(tidyverse)
source("../../R/generate_summary_stats.R")

summary_stats_min <- generate_summary_stats(minimal_data, var1)
summary_stats_test <- generate_summary_stats(test_data, length)

test_that("'generate_summary_stats' should return a data frame or extension with n + 2 columns, where n
is the number of columns in the original input data frame.", {
   expect_identical(minimal_data_output_col_count, count_classes(summary_stats_min))
   expect_identical(test_data_output_col_count, count_classes(summary_stats_test))
})

test_that("'generate_summary_stats' should return a data frame or extension where values in the 'count'
 column represent the number of observations in each group_var column, from the original data frame.", {
   expect_identical(test_data_output_counts, summary_stats_test %>% select(count))
   expect_identical(minimal_data_output_counts, summary_stats_min %>% select(count))
 })

 test_that("'generate_summary_stats' should return a data frame or extension where values in the 'percentage'
 column represent the percentage of observations in the group_var column, from the total observation count.", {
   expect_identical(test_data_output_percentages, summary_stats_test %>% select(percentage))
   expect_identical(minimal_data_output_percentages, summary_stats_min %>% select(percentage))
 })

test_that("'generate_summary_stats' should format a new data frame output according to the examples in the helper
document.", {
   expect_identical(minimal_data_output, summary_stats_min)
   expect_identical(test_data_output, summary_stats_test)
})

 test_that("'generate_summary_stats' should throw an error message when incorrect types are passed to 'data' and
 'group_var' arguments.", {
   expect_error(generate_summary_stats(list_data, 1))
   expect_error(generate_summary_stats(minimal_data, NULL))
 })