#It is assumed that data is already unzipped and UCI HAR Dataset is present is the current working directory

#Get training data
trainingX <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
trainingY <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
trainingSubjects <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
trainingXY<-cbind(trainingX,trainingY)
training<-cbind(trainingXY,trainingSubjects)

#Get testing data
testingX <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testingY <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testingSubjects <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
testingXY<-cbind(testingX,testingY)
testing<-cbind(testingXY,testingSubjects)

#Step 1 - Merge the training and the test sets to create one data set.
mergedData <- rbind(training, testing)

#Get features 
#Step 2 - Extract only the measurements on the mean and standard deviation for each measurement.
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('[-()]', '', features[,2])
meanStdColumns <- grep(".*mean.*|.*std.*", features[,2])
features <- features[meanStdColumns,]
# Add last two columns (subject and activity)
meanStdColumns <- c(meanStdColumns, 562, 563)
# Filter mergedData so that it contains columns regarding mean/standard deviation with subject and activity
mergedData <- mergedData[,meanStdColumns]
#Step 4 - Appropriately label the data set with descriptive variable names.
colnames(mergedData) <- c(features$V2, "Activity", "Subject")


#Step 3 - Use descriptive activity names to name the activities in the data set
mergedData$Activity[mergedData$Activity == 1] <- "WALKING"
mergedData$Activity[mergedData$Activity == 2] <- "WALKING_UPSTAIRS"
mergedData$Activity[mergedData$Activity == 3] <- "WALKING_DOWNSTAIRS"
mergedData$Activity[mergedData$Activity == 4] <- "SITTING"
mergedData$Activity[mergedData$Activity == 5] <- "STANDING"
mergedData$Activity[mergedData$Activity == 6] <- "LAYING"

#Step 4 - Appropriately label the data set with descriptive variable names.
#Columns are already named with feature name. Change column names to be more readable.
colNames  = colnames(mergedData); 
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("std","StdDev",colNames[i])
  colNames[i] = gsub("mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyroscope",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};
colnames(mergedData) = colNames;

#Step 5 - Create a second, independent tidy data set with the average of each variable for each activity and each subject.
mergedData$Activity <- as.factor(mergedData$Activity)
mergedData$Subject <- as.factor(mergedData$Subject)

tidyData = aggregate(mergedData, by=list(activity = mergedData$Activity, subject=mergedData$Subject), mean)
# Remove Subject and Activity column, since a mean of those has no use
tidyData[,ncol(tidyData)]=NULL
tidyData[,ncol(tidyData)]=NULL
write.table(tidyData, "tidy_data.txt", sep="\t")

#tidyTable<-read.table("tidy_data.txt", sep="\t")
