# author: Group 18: Sid Ahuja

"This script downloads the zip file containing data from a specified URL,
unzips the files, extracts the relevent data, and saves it to a specified local filepath.

Usage: src/01_Data_Download.R --url=<url> --file_path=<file_path>

Options:
--url=<url>               URL of the dataset location from the web or local file path
--file_path=<file_path>   The local filepath where you want to save the file and what to name it
" -> doc

suppressMessages(library(tidyverse))
suppressWarnings(library(docopt))

opt <- docopt(doc)

main <- function(url, file_path) {

    # create temp file
    temp <- tempfile()

    # download the .zip file to the temp location
    download.file(url, temp)

    # unzip file and save in file_path
    unzip(temp, exdir = file_path)

}

main(opt$url, opt$file_path)
