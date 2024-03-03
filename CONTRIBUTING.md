# Contribution

This project was started at the University of British Columbia as a group assignment for DSCI 310. The goal of this project is to analyze the physiochemical properties of wine samples from the North of Portugal, in order to predict wine quality. Contributors are expected to abide by our [CODE OF CONDUCT](https://github.com/DSCI-310-2024/DSCI-310-Group-18_wine-quality-predictor/blob/092310ce3f540557115500bdbec58c3157f7587d/CODE_OF_CONDUCT.MD). 

Notice: As input to this repository is restricted under the class' grading policies (until the end of the term in April 2024), anyone other than the listed authors and their teaching team might expect delays in having their contributions added. Those who seek to contribute immediately are invited to fork this repository on GitHub (as allowed by the [LICENSE](https://github.com/DSCI-310-2024/DSCI-310-Group-18_wine-quality-predictor/blob/304f29cfdbd36ace6a540083733da9f349faf6e9/LICENSE)), and operate independently of the original team until further notice. Changes added to this repository will appear downstream as of this moment, but can be incorporated to the main repository after April of 2024. To do so, see the following instructions:

# Duplicating this Data Analysis

Find the option to "fork" this repository on GitHub. Navigate to a location on your computer's file browser where you would like to store your local repository clone, and copy it's pathname. This can be done using:

```cmd
cd <PATHNAME>
```

Copy the HTTPS link to your forked repository off its' landing page. Clone the fork to your machine using:

```cmd
git clone <LINK>
```

For reference: the original repository's link is https://github.com/DSCI-310-2024/DSCI-310-Group-18_wine-quality-predictor.git

We recommend keeping your forked repository up to date with changes in the main repository, to minimize merge conflicts when this project becomes publicly editable. GitHub should present a button labelled "fetch upstream". Use this to update your repository with our changes.

Now, create a branch in your forked repository for your contributions. Please do this, as modifying the main branch will change the structure of the core of our project, and issues with consistency could ensue after a merge. Do the following:

```cmd
git switch -c <your branch name here>
```

Finally, activate the project environment to avoid dependency issues:

```cmd
conda activate environment.yml
```

You are then free to modify this project as you wish! Once you finish, create a pull Request to the main branch.

```cmd
git add <modified-file>
git commit -m "A descriptive message about your change"
git push origin <your-branch-name>
```

You will then need to submit a pull request (PR) on GitHub asking to merge
your example branch into the main DSCI 310 Group 3 repository. For details on creating a PR see GitHub
documentation [Creating a pull
request](https://help.github.com/en/articles/creating-a-pull-request). You can
add more details about your example in the PR such as motivation for the
example or why you thought it would be a good addition.  You will get feedback
in the PR discussion if anything needs to be changed. To make changes continue
to push commits made in your local example branch to origin and they will be
automatically shown in the PR.

# Additional Requirements

Please adhere to our project's [CODE OF CONDUCT](https://github.com/DSCI-310-2024/DSCI-310-Group-18_wine-quality-predictor/blob/02d26dcc2b168e58758963702923bc126748a055/CODE_OF_CONDUCT.md)

# Attributions

[Altair's Contributing](https://github.com/altair-viz/altair/blob/main/CONTRIBUTING.md)

[dplyr's Contributing](https://github.com/tidyverse/dplyr/blob/main/.github/CONTRIBUTING.md)
