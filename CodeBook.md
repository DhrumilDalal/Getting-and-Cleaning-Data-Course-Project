==================
Project Goal
==================
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

====================
The data source
====================
•Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
•Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

=====================
Data Set Information
=====================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset includes the following files:
•'README.txt'
•'features_info.txt': Shows information about the variables used on the feature vector.
•'features.txt': List of all features.
•'activity_labels.txt': Links the class labels with their activity name.
•'train/X_train.txt': Training set.
•'train/y_train.txt': Training labels.
•'test/X_test.txt': Test set.
•'test/y_test.txt': Test labels.


The following files are available for the train and test data. Their descriptions are equivalent.

•'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
•'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
•'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
•'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


==============================
Important Variables Used
==============================


Names					Description
----------------------------------------------------------------------------------------------------------------------------------------------------------
01. DataSetForActivityTraining		This variable is used to store the data read from Y_train.txt
02. DataSetForActivityTesting		This variable is used to store the data read from Y_test.txt
03. DataForActivity			This variable is used to store the data that is obtained by applying rbind() on above variables

04. DataSetForSubjectTraining		This variable is used to store the data read from subject_train.txt
05. DataSetForSubjectTesting		This variable is used to store the data read from subject_test.txt
06. DataForSubject			This variable is used to store the data that is obtained by applying rbind() on above variables

07. DataSetForTraining			This variable is used to store the data read from X_train.txt			
08. DataSetForTesting			This variable is used to store the data read from X_test.txt
09. WorkingDataSet			This variable is used to store the data that is obtained by applying rbind() on above variables.

10. FinalDataSet			This is the final data set that is used to produce the output
-----------------------------------------------------------------------------------------------------------------------------------------------------------


=======================
Transformation Details
=======================
Step 0: Initialization Step
	•	In this step we include the necessary libraries to run the script. Following packages are needed for the script to run.
		 - library(dplyr)
		 - library(data.table)
		 - library(tidyr)
	•	Set the working directory. 
	•	Download the data files and Unzip them
Step 1:  Merges the training and the test sets to create one data set.
	•	Merge the training dataset and testing dataset
	•	Merge the training dataset and testing dataset for Activities
	•	Merge the training dataset and testing dataset for subjects
	•	Apply name to the columns based on the features
	•	Merge the columns to create working dataset
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
	•	Read "features.txt" and extract only the mean and standard deviation
	•	Take only measurements for the mean and standard deviation and add "subject","activityNum"
Step 3: Uses descriptive activity names to name the activities in the data set
	•	Add descriptive names to the activities in the working data set
	•	Modify the WorkingDataSet with variable means sorted by subject and Activity
Step 4:  Appropriately labels the data set with descriptive variable names.
	•	Appropriate column headers are given to the columns. These user friendly name allows the data set to be consumed easily.
Step 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject
	•	Copy data set to the new variable
	•	Write the data set to file 
