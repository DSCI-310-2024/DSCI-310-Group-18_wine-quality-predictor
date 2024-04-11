# objects for testing of calculate_model_metric function

# Load necessary libraries
library(tidymodels)

source("../../R/combine_model_metrics.R")

# Generate test data
test_predictions <- data.frame(
  .pred_class = factor(c("A", "B", "C")),
  .truth = factor(c("A", "B", "C"))
)

diff_test_predictions <- data.frame(
  .truth = factor(c("A", "B", "C", "A", "B", "C", "A", "B", "C", "A"), levels = c("A", "B", "C")),
  .pred_class = factor(c("A", "A", "B", "B", "B", "C", "C", "A", "A", "A"), levels = c("A", "B", "C"))
)

# Calculate metrics for testing
test_accuracy <- test_predictions %>%
calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "accuracy")

test_precision <- test_predictions %>%
calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "precision", event_level = "first")

test_recall <- test_predictions %>%
calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "recall", event_level = "first")

#different values for metrics
diff_test_accuracy <- diff_test_predictions %>%
calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "accuracy")

diff_test_precision <- diff_test_predictions %>%
calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "precision", event_level = "first")

diff_test_recall <- diff_test_predictions %>%
calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "recall", event_level = "first")