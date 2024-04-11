#' Calculate a specified model metric
#'
#' This function calculates a specified model metric (e.g., accuracy, precision, recall) 
#' for a given set of predictions and ground truth values.
#'
#' @param predictions A data frame or tibble containing model predictions
#' @param truth A vector containing the ground truth values
#' @param metric The metric to calculate (e.g., "accuracy", "precision", "recall")
#' @param event_level The event level for precision and recall calculations. Default is "first".
#'
#' @return The calculated value of the specified metric
#'
#' @examples
#' calculate_model_metric(wine_test_predictions, wine_test_predictions$quality_category, "accuracy")
#' calculate_model_metric(wine_test_predictions, wine_test_predictions$quality_category, "precision", event_level = "first")
#'
calculate_model_metric <- function(predictions, truth_col, predictions_col, metric, event_level_string = "first") {
  if (metric == "accuracy") {
    metric_value <- predictions %>%
    metrics(truth = {{ truth_col }}, estimate = {{ predictions_col }}) %>%
    filter(.metric == "accuracy") %>%
    pull(.estimate)
  } else if (metric == "precision") {
    metric_value <- predictions %>%
    precision(truth = {{ truth_col }}, estimate = {{ predictions_col }}, event_level="first") %>%
    pull(.estimate)
  } else if (metric == "recall") {
    metric_value <- predictions %>%
    recall(truth = {{ truth_col }}, estimate = {{ predictions_col }}, event_level="first") %>%
    pull(.estimate)
  } else {
      stop("Invalid metric used")
  }
  return(metric_value)
}