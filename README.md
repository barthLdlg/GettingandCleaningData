# GettingandCleaningData

## Goal

The goal of the project is to clean up a data set, so it can be used for further analysis.

The data for this project :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description of the data :

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Content

* **run_analysis.R**: the script performs the analysis (loading, merging and transforming)
* **README.md** : the file that explains the content of the project
* **CodeBook.md** : the file which describes the variables and the transformations they got in orde to get the clean data
* **tidy_dataset.txt** : a data set with the average of each variable for each activity and each subject.

## How it works

**run_analysis.R** will :

* Download the data
* Unzip the data
* Clean the data
* Save the clean data set in the file **tidy_dataset.txt** in the project repository


