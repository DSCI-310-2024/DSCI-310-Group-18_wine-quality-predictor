# Makefile
# Authors: Sid Ahuja, Zackarya Hamza, Alexander Dawson
# date: 2024-03-16

# Example usage: 
# make clean
# make all

all: data/raw/winequality-white.csv \
	data/processed/01_wine_data.csv \
	data/processed/02_wine_data_train.csv \
	data/processed/03_wine_data_test.csv \
	data/processed/04_scaled_wine_data_test.csv \
	data/processed/05_scaled_wine_data_test.csv \
	results/01_summary_table_features.csv \
	results/02_summary_table_by_class.csv \
	results/03_feature_dist_plot.png \
	results/04_k_val_accuracies.csv \
	results/05_best_k.txt \
	results/06_accuracies_vs_k_plot.png \
	results/07_classification_model.rds \
	results/08_test_accuracies.csv \
	results/09_confusion_matrix.png \
	docs/wine_quality_predictor.html \
	docs/wine_quality_predictor.pdf


# Download Data
data/raw/winequality-white.csv: scripts/01_Data_Download.R
	Rscript scripts/01_Data_Download.R \
	--url="https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv" \
	--file_path=data/raw/winequality-white.csv

# Preprocess Data
data/processed/01_wine_data.csv data/processed/02_wine_data_train.csv data/processed/03_wine_data_test.csv data/processed/04_scaled_wine_data_test.csv data/processed/05_scaled_wine_data_test.csv: scripts/02_Preprocess_Data.R data/raw/winequality-white.csv
	Rscript scripts/02_Preprocess_Data.R \
	--raw_data=data/raw/winequality-white.csv \
	--data_out=data/processed/

# Exploratory Data Analysis
results/01_summary_table_features.csv results/02_summary_table_by_class.csv results/03_feature_dist_plot.png: scripts/03_EDA.R data/processed/02_wine_data_train.csv
	Rscript scripts/03_EDA.R \
	--file_path=data/processed/02_wine_data_train.csv \
	--output_path=results/

# Hyperparameter Optimization
results/04_k_val_accuracies.csv results/05_best_k.txt results/06_accuracies_vs_k_plot.png: scripts/04_Hyperparam_Opt.R data/processed/02_wine_data_train.csv
	Rscript scripts/04_Hyperparam_Opt.R \
	--file_path=data/processed/02_wine_data_train.csv \
	--output_path=results/

# Classification Model
results/07_classification_model.rds results/08_test_accuracies.csv results/09_confusion_matrix.png: scripts/05_Classification_Model.R data/processed/02_wine_data_train.csv results/05_best_k.txt data/processed/03_wine_data_test.csv
	Rscript scripts/05_Classification_Model.R \
	--file_path=data/processed/02_wine_data_train.csv \
	--best_k_path=results/05_best_k.txt \
	--test_file=data/processed/03_wine_data_test.csv \
	--output_path=results/

# render quarto report in HTML and PDF
docs/wine_quality_predictor.html: results docs/wine_quality_predictor.qmd
	quarto render docs/wine_quality_predictor.qmd --to html

docs/wine_quality_predictor.pdf: results docs/wine_quality_predictor.qmd
	quarto render docs/wine_quality_predictor.qmd --to pdf

# clean
clean:
	rm -rf data/raw/*
	rm -rf data/processed/*
	rm -rf results
	rm -rf docs/wine_quality_predictor.html \
		docs/wine_quality_predictor.pdf \
		docs/wine_quality_predictor_files
