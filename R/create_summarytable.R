#' Create Summary Table
#'
#' Creates a new summary table from input data and writes to a new CSV file with input name, at input path.
#'
#' @param name String specifying the name of the new CSV file to be written
#' @param path Path within project directory where the new CSV file should be written
#' @param data Data to be compiled by function (should be read from a CSV file, and manipulated before input to function)
#'
#' @return 
#'
#' @export A new CSV file containing the summary table of the input data.
#'
#' @examples
#' input_data <- read_csv(<INPUT FILE PATH>)
#' create_summarytable(name = "summary_table_01.csv", 
#'                     path = <OUTPUT FILE PATH>, 
#'                     data = input_data)
#'