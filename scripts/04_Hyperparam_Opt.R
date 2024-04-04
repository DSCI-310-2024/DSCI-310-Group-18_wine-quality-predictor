# author: Group 18: Sid Ahuja

"This script performs Hyperparameter Optimization, selecting the
optimal value of K and outputting a figure demonstrating the 
optimization.

Usage: scripts/04_Hyperparam_Opt.R --file_path=<file_path> --output_path=<output_path> 

Options:
--file_path=<file_path>         Path to the data file
--output_path=<output_path>     Path to the output files 
" -> doc

suppressMessages(library(repr))
suppressMessages(library(tidyverse))
suppressMessages(library(tidymodels))
suppressMessages(library(psych))
suppressWarnings(library(docopt))
suppressWarnings(library(kknn))
source("R/create_lineplot.R")

opt <- docopt(doc)

main <- function(file_path, output_path) {

    #load in training data
    data <- read_csv(file_path)

    # set seed
    set.seed(654)
    
    #create recipe
    wine_recipe <- recipe(quality_category ~ alcohol + volatile_acidity + 
                      total_sulfur_dioxide + density + chlorides+residual_sugar,
                      data = data) %>%
            step_scale(all_predictors()) %>%
            step_center(all_predictors())

    # set cross-validation parameters
    wine_vfold <- vfold_cv(data, v = 10, strata = quality_category)


    # building the model for k selection
    knn_spec <- nearest_neighbor(weight_func = "optimal",
                                neighbors = tune()) %>%
                set_engine("kknn") %>%
                set_mode("classification")

    # Specifying rang of k values to check
    k_vals <- tibble(neighbors = seq(from = 1, to = 100, by = 5))

    # fitting, generating results, collecting cv metrics
    knn_results <- workflow() %>%
            add_recipe(wine_recipe) %>%
            add_model(knn_spec) %>%
            tune_grid(resamples = wine_vfold, grid = k_vals) %>%
            collect_metrics()

    # getting accuracy results
    accuracies <- knn_results %>%
            filter(.metric == "accuracy")

    #convert to data frame
    accuracies_df <- data.frame(accuracies)

    # saving accuracies table
    write_csv(accuracies_df, file.path(output_path,"04_k_val_accuracies.csv"))

    #pull best k value
    best_k <- accuracies %>%
        arrange(desc(mean)) %>%
        head(1) %>%
        pull(neighbors)
    
    #save best k value as a text object
    writeLines(as.character(best_k), file.path(output_path, "05_best_k.txt"))

    # generating the plot of accuracy for each tested k value
    
    accuracies_vs_k <- create_lineplot(accuracies, neighbors, mean,
                                       "K (Neighbors)", "Cross-Validation Mean Accuracy", TRUE)

    #Saving Figure
    ggsave(file.path(output_path, "06_accuracies_vs_k_plot.png"), accuracies_vs_k)
}

main(opt$file_path, opt$output_path)