# data and objects for testing of generate_summary_stats fuction

source("../../R/generate_summary_stats.R")

minimal_data <- data.frame("var1", "var2")

list_data <- list(1, 2, 3, 4, 5, 6, 7, 8, 9)  #shouldn't work with the function, should cause argument type error for data

test_data <- data.frame("length" = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
                        "width" = c(90, 80, 70, 60, 50, 40, 30, 20, 10),
                        "height" = c(10, 20, 30, 40, 50, 60, 70, 80, 90))


# expected function outputs

minimal_data_output <- data.frame("var1" = NULL, 
                                  "count" = 0, 
                                  "percentage" = 100, 
                                  "var2" = NULL)

test_data