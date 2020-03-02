# CodeBook

The goal of the project is to clean up a data set, so it can be used for further analysis.

## Original data set

The data for this project :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description of the data :

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Final data set desciption

The final tidy data is produced inside the run_analysis.R, it is called **dataSetTestTrain**.

The file **tidy_dataset.txt** located in the project repository is the tidy data set with the average of each variable for each activity and each subject. It is a text file containing space-separated values.

** The first column is the subject ID of the person who dit the experiment.
** The second column is the activity that the subject was doing during the measurement.
** The rest of the columns are the mean and standard deviation feature variables.


## Transformations

**run_analysis.R** performed to the initial data sets these transformations :

* Merge the training and test data by binding them by row to create 3 merged data sets. X_train.txt has been binded with X_test.txt, y_train.txt has been binded with y_test.txt and subject_train.txt has been binded with subject_test.txt.

* Extract only the measurements on the mean and standard deviation for each measurement. We extracted only the columns that have **mean()** or **std()** in their names in **feature.txt**.

* Give the columns of the data set the names they have in **feature.txt**

* Give the activty name for each measurement by matching activity ID in **activity_labels.txt**.

* Create one data set with all the data by binding by column the 3 data sets we have.

* Create a second, independent tidy data set with the average of each variable for each activity and each subject. This result is saved in **tidy_dataset.txt**.





