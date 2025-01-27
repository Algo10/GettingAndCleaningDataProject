Getting and cleaning data Course Project
----------------------------------------
----------------------------------------

##Information about data and transformations performed to clean the data
A full description of the data used in this project can be found at The UCI Machine Learning Repository
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data for this project can be found at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Data Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided:
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.

###Transformations
Following files are merged together to form data set with training and testing data
X_train.txt, Y_train.txt, subject_train.txt, X_test.txt, Y_test.txt, subject_test.txt
mergedData variable contains merged data

Column names are read from features.txt. Then subset of columns (meanStdColumns) is taken from feature names which contains mean or std (standard deviation). Columns in mergedData are renamed with descriptive feature names. Finally, Activity and Subject column is renamed and appended to mergedData. Numeric values in Activity column are then replaced by labels like 'WALKING', 'SITTING', etc. activity_labels.txt file is used for this.

Column titles are then cleaned to make them user readable. e.g. () is removed from column names, duplicate occurences of 'Body' is removed from column names.

At the end, tidy data set with the average of each variable for each activity and each subject is produced in a variable- 'tidyData' which is written to tide_data.txt file.


