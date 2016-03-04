## Coursera Getting and Cleaning Data 
## Course Project 
## 
## Author: Robert Begg Feb 29, 2016
## 
## Project Goal: 
##      Download multiple data files and create combined data set 
##      and create an additional summary data set
##      Details at: 
##      https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
## 
## The data used for this project represent data collected from the
## accelerometers from the Samsung Galaxy S smartphone. A full description is
## available at the site where the data was obtained: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## 
## Data for the project downloaded 2/28/2016 from: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##
## Function: run_analysis()
## Input:
##      rootPath - (optional) The path to the main data directory from the zip
##      file skipRead - (optional) Skips the reading of the two main data files,
##      used for testing. 
##      Note: Main data variables are cached in the scope of the caller after read
##
## Output:
##      Writes two csv files to the local directory "Tidy.csv" and "Tidy_avg.csv"
## Purpose:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names.
## 5) From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

run_analysis <- function(rootPath = NULL, skipRead = FALSE){
        
        # set deafult rootPath used in zip file 
        if( is.null(rootPath)){
                rootPath <- file.path(".","getdata-projectfiles-UCI HAR Dataset","UCI HAR Dataset")        
        }
        
        # read 6 data files and 2 label files
        readFiles(rootPath, skipRead )
        
        # Create combined and Tidy data set (Steps #1-4) 
        result_tdf <<- tidyData()
        
        # Create summary Daya set (Step #5)
        avg_tdf <<- group_by(result_tdf,subject,activity) %>%
                summarise_each(funs(mean))
        
        # Write output file from Steps #1-4
        write.csv(result_tdf,file="./tidy.csv")
        
        # Write output file from Step #5
        write.csv(avg_tdf,file="./tidy_avg.csv")
}

##
## Function: readFiles
## Input:
##      rootPath - path to data directory containing the test and train subdirectories
##      skipRead - (Optional)
## Description:
##      Read the 6 data files and the two label files that make up the data set
## 
readFiles <- function(rootPath, skipRead = FALSE ) {
       
        # data files are stored in callers scope to allow caching for testing purpose
        # Set skipRead = TRUE if the function has been previously called to skip large data files
        if( !skipRead ) {
                # Read test data files
                x_test <<- read.fwf(file.path(rootPath,"test","X_test.txt"),rep(16,561))
                y_test <<- read.fwf(file.path(rootPath,"test","Y_test.txt"),c(2))

                # Read train data files
                x_train <<- read.fwf(file.path(rootPath,"train","X_train.txt"),rep(16,561))
                y_train <<- read.fwf(file.path(rootPath,"train","Y_train.txt"),c(2))
        }
        
        # read the list of subjects that match the observations for the test data
        subject_test <<- read.fwf(file.path(rootPath,"test","subject_test.txt"),c(2))
        
        # read the list of subjects that match the observations for the train data
        subject_train <<- read.fwf(file.path(rootPath,"train","subject_train.txt"),c(2))
        
        # read the list of variable names (e.g. "tBodyAcc-mean()-X", ..., "tGravityAcc-std()-X", ... )
        features <<- read.delim(file.path(rootPath,"features.txt"),header=FALSE, sep=" ", strip.white=TRUE)
        
        # read the list of activity labels (e.g. "WALKING", "WALKING UPSTAIRS", ... )
        activity_labels <<- read.delim(file.path(rootPath,"activity_labels.txt"),header=FALSE, sep=" ")
}


##
## Function: tidyData
## Input: (uses global scoped values from readFiles)
##
## Description:
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names.
##
tidyData <- function(){
        
        #Create unique colnames by combining col number and name
        names( x_test ) <- paste(features[,2],features[,1])  
        names( x_train ) <- paste(features[,2],features[,1])
        
        # Name activity column
        names( y_test ) <- c("activity")
        names( y_train ) <- c("activity")
        
        # Name subject column
        names( subject_test ) <- c("subject")
        names( subject_train ) <- c("subject")
        
        
        # test data
        # Combine subject, activity, and all other columns together 
        test_tdf <- tbl_df(bind_cols(subject_test,y_test,x_test)) %>%
                select(subject, activity, contains("mean"),contains("std"))
        
        # train data
        # Combine subject, activity, and all other columns together
        # drop all columns except subject, activity, columns containing "mean" or "std"
        train_tdf <- tbl_df(bind_cols(subject_train, y_train, x_train)) %>%
                select(subject,activity, contains("mean"),contains("std"))
        
        # combine test rows and train rows 
        combined_tdf <- bind_rows(test_tdf, train_tdf) %>%
                arrange(subject,activity)
        
        # remove col number that was added to column names above
        clean_names <- strsplit(names(combined_tdf)," ")
        clean_names <- sapply(clean_names, function(x){x[1]})
        names(combined_tdf) <- clean_names
        
        # convert Activity column to factors
        combined_tdf$activity <- factor(combined_tdf$activity)
        
        # Replace cell values with factor (e.g. 1 to "WALKING", etc.)
        levels(combined_tdf$activity) <- activity_labels[,2]
        
        return(combined_tdf)
}
