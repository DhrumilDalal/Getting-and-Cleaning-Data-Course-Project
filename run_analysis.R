############################################################################################################################################
#Step 0 - Initialization

library(dplyr)
library(data.table)
library(tidyr)


#C:\Dhrumil\Personal\Learning\CourseEra\Data Science\Course 3 - Getting and Cleaning Data\ProjectWork
#Set the Working Directory
setwd("C:\\Dhrumil\\Personal\\Learning\\CourseEra\\Data Science\\Course 3 - Getting and Cleaning Data\\ProjectWork")


if(!file.exists("./DataFiles"))
  dir.create("./DataFiles")

#Download the dataset
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./DataFiles/Dataset.zip",method="internal")
unzip(zipfile="./DataFiles/Dataset.zip",exdir="./DataFiles")
############################################################################################################################################

###########################################################################################################################################
#Step 1 - Merges the training and the test sets to create one data set.

filesPath <- "C:/Dhrumil/Personal/Learning/CourseEra/Data Science/Course 3 - Getting and Cleaning Data/ProjectWork/DataFiles/UCI HAR Dataset"

#Read data files and combine them.
DataSetForTraining <- tbl_df(read.table(file.path(filesPath, "train", "X_train.txt" )))
DataSetForTesting  <- tbl_df(read.table(file.path(filesPath, "test" , "X_test.txt" )))
WorkingDataSet <- rbind(DataSetForTraining, DataSetForTesting)

# Read activity files anf combine them
DataSetForActivityTraining <- tbl_df(read.table(file.path(filesPath, "train", "Y_train.txt")))
DataSetForActivityTesting  <- tbl_df(read.table(file.path(filesPath, "test" , "Y_test.txt" )))
DataForActivity<- rbind(DataSetForActivityTraining, DataSetForActivityTesting)
setnames(DataForActivity, "V1", "activityNum")

# Read subject files and combine them
DataSetForSubjectTraining <- tbl_df(read.table(file.path(filesPath, "train", "subject_train.txt")))
DataSetForSubjectTesting  <- tbl_df(read.table(file.path(filesPath, "test" , "subject_test.txt" )))
DataForSubject <- rbind(DataSetForSubjectTraining, DataSetForSubjectTesting)
setnames(DataForSubject, "V1", "subject")


# name variables according to feature e.g.(V1 = "tBodyAcc-mean()-X")
Features <- tbl_df(read.table(file.path(filesPath, "features.txt")))
setnames(Features, names(Features), c("featureNum", "featureName"))
colnames(WorkingDataSet) <- Features$featureName

#column names for activity labels
ActivityLabels<- tbl_df(read.table(file.path(filesPath, "activity_labels.txt")))
setnames(ActivityLabels, names(ActivityLabels), c("activityNum","activityName"))

# Merge columns
EntireData<- cbind(DataForSubject, DataForActivity)
WorkingDataSet <- cbind(EntireData, WorkingDataSet)
############################################################################################################################################

###########################################################################################################################################
#Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# Reading "features.txt" and extracting only the mean and standard deviation
FeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)",Features$featureName,value=TRUE)

# Taking only measurements for the mean and standard deviation and add "subject","activityNum"
FeaturesMeanStd <- union(c("subject","activityNum"), FeaturesMeanStd)
WorkingDataSet<- subset(WorkingDataSet,select=FeaturesMeanStd) 
###########################################################################################################################################

###########################################################################################################################################
#Step 3 - Uses descriptive activity names to name the activities in the data set
#enter name of activity into WorkingDataSet
WorkingDataSet <- merge(ActivityLabels, WorkingDataSet , by="activityNum", all.x=TRUE)
WorkingDataSet$activityName <- as.character(WorkingDataSet$activityName)

## create WorkingDataSet with variable means sorted by subject and Activity
WorkingDataSet$activityName <- as.character(WorkingDataSet$activityName)
TmpSetForAgg<- aggregate(. ~ subject - activityName, data = WorkingDataSet, mean) 
WorkingDataSet<- tbl_df(arrange(TmpSetForAgg,subject,activityName))
###########################################################################################################################################

###########################################################################################################################################
#Step 4 - Appropriately labels the data set with descriptive variable names.
names(WorkingDataSet)<-gsub("std()", "SD", names(WorkingDataSet))
names(WorkingDataSet)<-gsub("mean()", "MEAN", names(WorkingDataSet))
names(WorkingDataSet)<-gsub("^t", "TIME", names(WorkingDataSet))
names(WorkingDataSet)<-gsub("^f", "FREQ.", names(WorkingDataSet))
names(WorkingDataSet)<-gsub("Acc", "ACCELEROMETER", names(WorkingDataSet))
names(WorkingDataSet)<-gsub("Gyro", "GYROSCOPE", names(WorkingDataSet))
names(WorkingDataSet)<-gsub("Mag", "MAGNITUDE", names(WorkingDataSet))
names(WorkingDataSet)<-gsub("BodyBody", "BODY", names(WorkingDataSet))
###########################################################################################################################################

###########################################################################################################################################
#Step 5 - creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalDataSet <- WorkingDataSet
write.table(FinalDataSet, "TidyData.txt", row.name=FALSE)
###########################################################################################################################################
