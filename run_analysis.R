
##
# Project; Getting and Cleaning Data Course Project
# Author: BarthLdlg
# Dataset from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##

# Download the dataset and unzip it
if (!file.exists("dataset.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
}
unzip("dataset.zip")

##set working directory
setwd("UCI HAR Dataset")

##read training set
setTrain <- read.table("train/X_train.txt", header = FALSE)
subjectTrain <- read.table("train/subject_train.txt", header = FALSE)
activityTrain <- read.table("train/y_train.txt", header = FALSE)

##read test set
setTest <- read.table("test/X_test.txt", header = FALSE)
subjectTest <- read.table("test/subject_test.txt", header = FALSE)
activityTest <- read.table("test/y_test.txt", header = FALSE)


##merge the two sets
mergedSet <- rbind(setTrain, setTest)
mergedSubject <- rbind(subjectTrain, subjectTest)
mergedActivity <- rbind(activityTrain, activityTest)


##read the feature file to get the mean and standard deviation features (step 2)
featureName <- read.table("features.txt", header = FALSE)
names <- as.character(featureName$V2)
mergedSetMeanSd <- mergedSet[, grep("mean\\(\\)|std\\(\\)", names)]

##appropriately labels the data set with descriptive variable names (step)
names(mergedSetMeanSd) <- names[grepl("mean\\(\\)|std\\(\\)", names)]

##use descriptive activity names to name the activities in the dataset (step 3)
activities <- read.table("activity_labels.txt", header = FALSE)
names(mergedActivity) <- c("activityLabel")
mergedActivity$activityLabel <- activities[mergedActivity[,1],2]

##create one data set with all the data (step 1)
names(mergedSubject) <- c("subject")
dataSetTestTrain <- cbind(mergedSubject, mergedActivity, mergedSetMeanSd)

##create a second, independent tidy data set with the
##average of each variable for each activity and each subject (step 5)
library(dplyr)
tidySet <- dataSetTestTrain %>% group_by(subject, activityLabel) %>% summarise_at(-(1:2),mean,na.rm = T)

### Save the dataset
write.table(tidySet, file="../tidy_dataset.txt", row.names = FALSE)
tidySet

