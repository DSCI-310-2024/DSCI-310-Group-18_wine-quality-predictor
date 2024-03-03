# Wine Quality Predictor
Authors: Sid Ahuja, Zackarya Hamza, Alexander Dawson

Demo of a data analysis project for DSCI 310 (Reproducible & Trustworthy workflows); a course in the Data Science faculty.

## About 
In this project, we build a prediction model using the k-nearest neighbours algorithm which attempts to categorize the quality of a wine based on its' physiochemical properties. We classify wine quality into a binary category: whether it is good or bad. Our classifier performed moderately well on the test set, but further research must be done to improve the model before it is put into production.

The dataset that we used for this project is about white variants of the Portugese "Vinho Verde" wine, which was assembled by Paulo Cortez, A. Cerdeira, F. Almeida, T.Matos, and J.Reis. The dataset was sourced from UCI Machine Learning Repository (Dua and Graff 2017), located [here](https://archive.ics.uci.edu/dataset/186/wine+quality). Each row in this dataset showcases an observation of a white wine, specifically related to its physicochemical and sensory attributes.  

## Usage
Use the steps below to reproduce this analysis.

If this is the first time running the project, run this command: 

``` bash
conda env create --file environment.yml
```

To run the analysis, navigate to the root of this repository and run:

```bash
jupyter lab
```

Open file `wine_quality_predictor_report.ipynb` in Jupyter Lab UI and choose the R Kernel. 

Then, under the "Kernel" menu, click "Restart Kernel and Run All Cells"

## Report

The final report can be found
[here](https://github.com/DSCI-310-2024/DSCI-310-Group-18_wine-quality-predictor/blob/main/wine_quality_predictor_report.ipynb).


## Dependencies
- 'conda' (version 23.9.0 or higher)
- R Jupyter kernels
- R and packages listed in environment.yml

## License
Our report is licensed under the [MIT License](https://opensource.org/license/MIT). See [LICENSE](https://github.com/DSCI-310-2024/DSCI-310-Group-18_wine-quality-predictor/blob/8fb3e227b92abd07962779aa3e01b77c78fdc9d2/LICENSE) for additional information.

## References
Cortez,Paulo, Cerdeira,A., Almeida,F., Matos,T., and Reis,J.. (2009). Wine Quality. UCI Machine Learning Repository. https://doi.org/10.24432/C56S3T.

CVRVV. (2024). Vinho Verde. https://www.vinhoverde.pt/en/homepage

Tiffany Timbers, Trevor Campbell. “Data Science.” Data Science, 23 Dec. 2023, datasciencebook.ca/. 

Chester Ismay and Albert Y. Kim   Foreword by Kelly S. McConville. “Statistical Inference via Data Science.” Statistical Inference via Data Science, 13 Feb. 2024, moderndive.com/index.html. 