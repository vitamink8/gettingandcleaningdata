# Coursera/Johns Hopkins 
# Getting and Cleaning Data
# Final Project ReadMe

Please see CodeBook.md for the full original data description and variable breakdown.

### About This Code
*Dependencies:* [reshape2] library

As per project instructions, [r_analysis.R] does the following (in loose order):
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code expects to be run from a working directory called "UCI HAR Dataset" with the following file paths present:
* [train/subject_train.txt]
* [train/X_train.txt]
* [train/y_train.txt]
* [test/subject_test.txt]
* [test/X_test.txt]
* [test/y_test.txt]
* [features.txt]
* [activity_labels.txt]

These files and the original data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It will produce a new tidy dataset in a file called "tidydata.txt" in the working directory.

Original data source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 