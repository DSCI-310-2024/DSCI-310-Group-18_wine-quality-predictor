# author: Group 18: Sid Ahuja

"This script reads raw data and performs any and all necessary preprocessing
prior to exploratory data analysis and modelling. It also splits the processed 
data into train and test sets. Seed is set as 321.

Usage: src/02_Preprocess_Data.R --raw_data=<raw_data> --data_out=<data_out>

Options:
--raw_data=<raw_data>   Path to the raw data
--data_out=<data_out>   Path to the directory where you want to save all processed data files
" -> doc

suppressMessages(library(tidyverse))
suppressWarnings(library(docopt))
suppressMessages(library(repr))
suppressMessages(library(tidymodels))
suppressMessages(library(psych))

opt <- docopt(doc)

main <- function(raw_data, data_out) {
    
    #create output dir if it does not exist
    if (!dir.exists(data_out)) {
    dir.create(data_out)
  }
    #load in training data
    data <- read_csv(file_path)
    
    # changing quality_score to quality_category
    data <- data %>% 
        mutate(quality_category = case_when(
        quality_score <= 5 ~ "bad",
        quality_score <= 10 ~ "good")) %>%
        mutate(quality_category = as_factor(quality_category)) %>%
        select(-quality_score)
    
    #saving data set
    write_csv(data, file.path(output_path,"01_wine_data.csv"))
    
    #setting seed
    set.seed(321)

    #Splitting data into train and test set
    data_split <- initial_split(data, prop = 0.70, strata = quality_category)
    data_train <- training(data_split)
    data_test <- testing(data_split)
    
    #Saving data
    write_csv(data_train, file.path(data_out, "02_wine_data_train.csv"))
    write_csv(data_test, file.path(data_out, "03_wine_data_test.csv"))

    # Create recipe for scaling data
    wine_preprocess_recipe <- recipe(quality_category ~ ., data = data_train) %>%
        step_scale(all_predictors()) %>%
        step_center(all_predictors())
    
    # Train recipe
    prep_preprocess_recipe <- prep(wine_preprocess_recipe, training = data_train)

    # Scale Data
    scaled_data_train <- bake(prep_preprocess_recipe, new_data = data_train)
    scaled_data_test <- bake(prep_preprocess_recipe, new_data = data_test)

    #Save Scaled data
    write_csv(scaled_data_train, file.path(data_out, "04_scaled_wine_data_test.csv"))
    write_csv(scaled_data_test, file.path(data_out, "05_scaled_wine_data_test.csv"))
}

main(opt$raw_data, opt$data_out)
