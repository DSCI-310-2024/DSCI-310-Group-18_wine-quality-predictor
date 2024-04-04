# data and objects for testing of generate_summary_stats fuction

source("../../R/generate_summary_stats.R")

minimal_data <- data.frame("var1", "var2")

list_data <- list(1, 2, 3, 4, 5, 6, 7, 8, 9)  #shouldn't work with the function, should cause argument type error for data

test_data <- data.frame("length" = c(1, 2, 2, 3, 3, 3, 3, 4, 4),
                        "width" = c(90, 80, 70, 60, 50, 40, 30, 20, 10),
                        "height" = c(10, 20, 30, 40, 50, 60, 70, 80, 90))


# expected function outputs

minimal_data_output <- data.frame("var1" = NA, 
                                  "count" = 0, 
                                  "percentage" = 100, 
                                  "var2" = NA)

test_data <- data.frame("length" = c(1, 2, 3, 4),
                        "count" = c(1, 2, 4, 2),
                        "percentage" = c(11.1, 22.2, 44.4, 22.2),
                        "width_avg" = c(90, 75, 45, 15),
                        "height_avg" = c(10, 25, 55, 85))