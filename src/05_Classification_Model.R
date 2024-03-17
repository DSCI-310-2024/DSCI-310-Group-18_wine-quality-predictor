# author: Group 18: Sid Ahuja

"This script reads specified data and creates a classification model.
It saves the model to a RDS file and model results as a CSV. The model
evaluation metrics are also calculated and saved.

Usage: src/05_Classification_Model.R --file_path=<file_path> --best_k_path=<best_k_path> --test_file=<train_file> --output_path=<output_path> 

Options:
--file_path=<file_path>         Path to the data file
--best_k_path=<best_k_path>     Path to the best k value file
--test_file=<train_file>        Path to the test file
--output_path=<output_path>     Path to the output files 
" -> doc

suppressMessages(library(repr))
suppressMessages(library(tidyverse))
suppressMessages(library(tidymodels))
suppressMessages(library(psych))
suppressWarnings(library(docopt))
suppressWarnings(library(kknn))

opt <- docopt(doc)

main <- function(file_path, best_k_path, train_file, output_path) {

    #load in training data
    data <- read_csv(file_path)

    # set seed
    set.seed(654)

    # read the best k value outputted during hyperparameter optimization
    best_k <- readLines(best_k_path)

    # making the recipe for classification
    wine_recipe <- recipe(quality_category ~ alcohol + chlorides + volatile_acidity + 
                        total_sulfur_dioxide + density ,
                        data = data) %>%
                    step_scale(all_predictors()) %>%
                    step_center(all_predictors())

    # building classification model using best k value
    knn_spec <- nearest_neighbor(weight_func = "optimal",
                                neighbors = best_k) %>%
                set_engine("kknn") %>%
                set_mode("classification")

    #fitting model
    knn_fit <- workflow() %>%
        add_recipe(wine_recipe) %>%
        add_model(knn_spec) %>%
        fit(data = data)
    
    # saving model
    saveRDS(knn_fit, file.path(output_path, "07_classification_model.rds"))

    # loading in test data
    test_data <- read_csv(train_file)

    # using model on test set
    wine_test_predictions <- predict(knn_fit, test_data) %>%
        bind_cols(test_data)

    # complining results
    wine_test_accuracy <- wine_test_predictions %>%
        metrics(truth = quality_category, estimate = .pred_class) %>%
        filter(.metric == "accuracy")

    wine_test_precision <- wine_test_predictions %>%
        precision(truth = quality_category, estimate = .pred_class, event_level="first")

    wine_test_recall <- wine_test_predictions %>%
        recall(truth = quality_category, estimate = .pred_class, event_level="first")

    wine_tests <- rbind(wine_test_accuracy, wine_test_precision, wine_test_recall)

    #saving results as csv
    wine_tests_df <- data.frame(wine_tests)
    write_csv(wine_tests_df, file.path(output_path,"08_test_accuracies.csv"))

    #getting confusion matrix
    confusion <- wine_test_predictions %>%
             conf_mat(truth = quality_category, estimate = .pred_class)
    
    #saving confusion matrix
    confusion_df <- data.frame(confusion)
    write_csv(confusion_df, file.path(output_path,"09_confusion_matrix.csv"))
}

main(opt$file_path, opt$best_k_path, opt$train_file, opt$output_path)
