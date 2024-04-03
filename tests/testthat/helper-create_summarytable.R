# objects for testing of create_summarytable function

source("../../R/create_summarytable.R")

test_data <- data.frame("length" = c(10, 20, 30, 40, 50, 60, 70, 80, 90),
                        "width" = c(90, 80, 70, 60, 50, 40, 30, 20, 10),
                        "height" = c(1, 2, 3, 4, 5, 6, 7, 8, 9))

write_csv(test_data, file.path(tests/testthat/,"summarytable.csv"))