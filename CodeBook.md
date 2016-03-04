---
title: "CodeBook"
author: "Robert Begg"
date: "March 3, 2016"
output: html_document
---
# Intro
The data used for this project represent data collected from the
accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project downloaded 2/28/2016 from: 
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Analysis steps
The run_analysis.R script reads the data from the zip file above and writes two csv files to the local directory "Tidy.csv" and "Tidy_avg.csv"

#Processing Steps
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Summary of run_analysis.R

1. set deafult rootPath used in zip file 
2. read 6 data files and 2 label files
3. Create combined and Tidy data set
    + Merges the training and the test sets to create one data set.
    + Extracts only the measurements on the mean and standard deviation for each measurement.
    + Uses descriptive activity names to name the activities in the data set
    + Appropriately labels the data set with descriptive variable names.
4. Create summary Data set 
5. Write output file for step #3
6. Write output file from Step #4

# Resulting Processed Data 
##Tidy.csv - Contains all observations for:
1. Each subject (1-30)
2. Each activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING )
3. All observed values for each of the variables listed below

##Tidy_avg.csv 
1. Each subject (1-30)
2. Each activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING )
3. Average for each variable listed below

#Variables
*	subject
*	activity
*	tBodyAcc-mean()-X
*	tBodyAcc-mean()-Y
*	tBodyAcc-mean()-Z
*	tGravityAcc-mean()-X
*	tGravityAcc-mean()-Y
*	tGravityAcc-mean()-Z
*	tBodyAccJerk-mean()-X
*	tBodyAccJerk-mean()-Y
*	tBodyAccJerk-mean()-Z
*	tBodyGyro-mean()-X
*	tBodyGyro-mean()-Y
*	tBodyGyro-mean()-Z
*	tBodyGyroJerk-mean()-X
*	tBodyGyroJerk-mean()-Y
*	tBodyGyroJerk-mean()-Z
*	tBodyAccMag-mean()
*	tGravityAccMag-mean()
*	tBodyAccJerkMag-mean()
*	tBodyGyroMag-mean()
*	tBodyGyroJerkMag-mean()
*	fBodyAcc-mean()-X
*	fBodyAcc-mean()-Y
*	fBodyAcc-mean()-Z
*	fBodyAcc-meanFreq()-X
*	fBodyAcc-meanFreq()-Y
*	fBodyAcc-meanFreq()-Z
*	fBodyAccJerk-mean()-X
*	fBodyAccJerk-mean()-Y
*	fBodyAccJerk-mean()-Z
*	fBodyAccJerk-meanFreq()-X
*	fBodyAccJerk-meanFreq()-Y
*	fBodyAccJerk-meanFreq()-Z
*	fBodyGyro-mean()-X
*	fBodyGyro-mean()-Y
*	fBodyGyro-mean()-Z
*	fBodyGyro-meanFreq()-X
*	fBodyGyro-meanFreq()-Y
*	fBodyGyro-meanFreq()-Z
*	fBodyAccMag-mean()
*	fBodyAccMag-meanFreq()
*	fBodyBodyAccJerkMag-mean()
*	fBodyBodyAccJerkMag-meanFreq()
*	fBodyBodyGyroMag-mean()
*	fBodyBodyGyroMag-meanFreq()
*	fBodyBodyGyroJerkMag-mean()
*	fBodyBodyGyroJerkMag-meanFreq()
*	angle(tBodyAccMean,gravity)
*	angle(tBodyAccJerkMean),gravityMean)
*	angle(tBodyGyroMean,gravityMean)
*	angle(tBodyGyroJerkMean,gravityMean)
*	angle(X,gravityMean)
*	angle(Y,gravityMean)
*	angle(Z,gravityMean)
*	tBodyAcc-std()-X
*	tBodyAcc-std()-Y
*	tBodyAcc-std()-Z
*	tGravityAcc-std()-X
*	tGravityAcc-std()-Y
*	tGravityAcc-std()-Z
*	tBodyAccJerk-std()-X
*	tBodyAccJerk-std()-Y
*	tBodyAccJerk-std()-Z
*	tBodyGyro-std()-X
*	tBodyGyro-std()-Y
*	tBodyGyro-std()-Z
*	tBodyGyroJerk-std()-X
*	tBodyGyroJerk-std()-Y
*	tBodyGyroJerk-std()-Z
*	tBodyAccMag-std()
*	tGravityAccMag-std()
*	tBodyAccJerkMag-std()
*	tBodyGyroMag-std()
*	tBodyGyroJerkMag-std()
*	fBodyAcc-std()-X
*	fBodyAcc-std()-Y
*	fBodyAcc-std()-Z
*	fBodyAccJerk-std()-X
*	fBodyAccJerk-std()-Y
*	fBodyAccJerk-std()-Z
*	fBodyGyro-std()-X
*	fBodyGyro-std()-Y
*	fBodyGyro-std()-Z
*	fBodyAccMag-std()
*	fBodyBodyAccJerkMag-std()
*	fBodyBodyGyroMag-std()
*	fBodyBodyGyroJerkMag-std()

