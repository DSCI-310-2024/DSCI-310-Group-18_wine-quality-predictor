# author: Group 18: Sid Ahuja

"This script downloads the csv containing data from a specified URL and 
extracts the relevent data, and saves it to a specified local filepath.

Usage: src/01_Data_Download.R --url=<url> --file_path=<file_path>

Options:
--url=<url>               URL of the dataset location from the web or local file path
--file_path=<file_path>   The local filepath where you want to save the file and what to name it
" -> doc

suppressMessages(library(tidyverse))
suppressWarnings(library(docopt))

opt <- docopt(doc)

main <- function(url, file_path) {

    #make folders
    dir.create("data")
    dir.create("data/raw")
    # read in data from web
    # https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv
    data <- read_delim(url, delim = ";", show_col_types = FALSE)
    colnames(data) <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", 
                          "chlorides", "free_sulfur_dioxide", "total_sulfur_dioxide", "density", 
                          "pH", "sulphates", "alcohol", "quality_score")

    # save the file in specified local filepath
    write_csv(data, file_path)

}

main(opt$url, opt$file_path)
