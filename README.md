Getting and cleaning data Course Project
----------------------------------------
----------------------------------------

This repository contains submission files for a project to create tidy data
Data for the project is extracted from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It is assumed that data is already downloaded and unzipped manually in the current working directory.
Current working directory should contain folder - UCI HAR Dataset.

###Repository Files and their usage
run_analysis.R contains code to produce tidy dataset.
It reads data from UCI HAR Dataset. It then merges testing and training data, extracts columns containing mean and standard deviation. It also cleans activity labels and column names. Then it creates a second, independent tidy data set with the average of each variable for each activity and each subject.
At the end it has read.table command in commented code which can be uncommented to view tidy dataset

tidy_data.txt is a final output file with tidy data set obtained after running run_analysis.R using UCI HAR Dataset.

CodeBook.md describes the variables, the data, and any transformations performed to clean up the data in run_analysis.R file