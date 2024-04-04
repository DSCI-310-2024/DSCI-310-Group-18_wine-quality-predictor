library(testthat)
library(tidyverse)
source("../../R/generate_summary_stats.R")

test_that("'generate_summary_stats' should return a data frame (or extension, eg: a tibble).", {
    # add tests here
})

test_that("'generate_summary_stats' should return a data frame or extension with n + 2 columns, where n
is the number of columns in the original input data frame.", {
    # add tests here
})

test_that("'generate_summary_stats' should return a data frame or extension where values in the 'count'
 column represent the number of observations in each group_var column, from the original data frame.", {
    # add tests here
 })

 test_that("'generate_summary_stats' should return a data frame or extension where values in the 'percentage'
 column represent the percentage of observations in the group_var column, from the total observation count.", {
    # add tests here
 })

 test_that("'generate_summary_stats' should throw an error message when incorrect types are passed to 'data' and
 'group_var' arguments.", {
    # add tests here
 })