# author: Group 18: Sid Ahuja

"This script performs EDA, creating visualizations and tables. It
creates 2 tables and 1 figure, all within the main funtion.

Usage: scripts/03_EDA.R --file_path=<file_path> --output_path=<output_path> 

Options:
--file_path=<file_path>         Path to the data file
--output_path=<output_path>     Path to the output files 
" -> doc

suppressMessages(library(repr))
suppressMessages(library(tidyverse))
suppressMessages(library(tidymodels))
suppressMessages(library(psych))
suppressWarnings(library(docopt))
source("R/generate_summary_stats.R")

opt <- docopt(doc)

main <- function(file_path, output_path) {

    #create output dir if it does not exist
    if (!dir.exists(output_path)) {
    dir.create(output_path)
    }

    #Summary Tables
    #load in training data
    data <- read_csv(file_path)

    #create summary table
    summary_table <- data.frame(describe(data) %>%
        select(n, mean, sd, median, min, max, range))
    
    #Save summary table       
    write_csv(summary_table, file.path(output_path,"01_summary_table_features.csv"))

    #summary stats by class
    summary <- generate_summary_stats(data, quality_category)
    
    #convert to data frame
    summary_class <- data.frame(summary)

    #Save summary by class table       
    write_csv(summary_class, file.path(output_path,"02_summary_table_by_class.csv"))

    # Feature Selection Plot
    # Changing data to be compatable with analysis
    data_long <- data %>%
        gather(key = "predictor", value = "value", -quality_category)

    #Generating Figure
    feature_dist_plot <- ggplot(data_long, aes(x = value, fill = quality_category)) +
        geom_density(alpha = 0.7) +
        facet_wrap(~predictor, scales = "free") +
        theme_minimal() +
        labs(fill = "Quality Category") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))

    #Saving Figure
    ggsave(file.path(output_path, "03_feature_dist_plot.png"), feature_dist_plot)
}

main(opt$file_path, opt$output_path)
