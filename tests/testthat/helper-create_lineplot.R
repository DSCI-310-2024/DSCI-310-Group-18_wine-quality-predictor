# objects for testing of create_lineplot fuction

library(ggplot2)
source("../../R/create_lineplot.R")

test_data <- data.frame("absorbance" = c(0.2, 0.4, 0.8, 1.6, 3.2),
                        "time" = c(0, 15, 30, 45, 60))

empty_data <- data.frame("absorbance", "time")

test_plot <- create_lineplot(test_data, time, absorbance,
                             "Absorbance(OD600)", "Time(s)", TRUE, 11)

num_list_input <- list(1, 2)

str_data <- data.frame("absorbance" = c("0.2", "0.4", "0.8", "1.6", "3.2"),
                       "time" = c("0", "15", "30", "45", "60"))

default_plot <- create_lineplot(test_data, time, absorbance)

# should all produce errors
wrong_col_plot <- create_lineplot(test_data, time, od)

empty_plot <- create_lineplot(empty_data, time, absorbance)

str_plot <- create_scatterplot(str_data, time, absorbance)

list_plot <- create_scatterplot(num_list_input, time, absorbance)

title_plot <- create_lineplot(test_data, time, absorbance, TRUE)
