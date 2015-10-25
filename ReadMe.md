===================
Repository Content
===================
1.	Codebook.md
2.	ReadMe.md
3.	Run_Analysis.R

=============
Project Goal
=============
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The submission requirements are   as follows 
1.	A tidy data set as described below, 
2.	A link to a Github repository with your script for performing the analysis, 
3.	A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4.	A README.md that explains how all of the scripts work and how they are connected.  

================
Code Walkthrough
================
Run_Analysis.R is performs the task of cleansing the dataset. This is achieved in 6 Steps
Step 0: Initialization Step
1.	In this step we include the necessary libraries to run the script. Following packages are needed for the script to run.
•	library(dplyr)
•	library(data.table)
•	library(tidyr)
2.	Set the working directory. 
3.	Download the data files and Unzip them
Step 1:  Merges the training and the test sets to create one data set.
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Step 3: Uses descriptive activity names to name the activities in the data set
Step 4:  Appropriately labels the data set with descriptive variable names.
Step 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject

====================
How to run this code
====================
1.	Make sure the dependent packages mentioned above are installed
2.	Create this folder on the machine “C:\Dhrumil\Personal\Learning\CourseEra\Data Science\Course 3 - Getting and Cleaning Data\ProjectWork”
3.	Copy-Paste the code in R studio and execute the code. 
4.	The code tries to download the data files if they are not present. This would require internet connectivity.

