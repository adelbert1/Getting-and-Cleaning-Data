#Getting and Cleaning Data Course Project
This repo contains my solution to the Getting and Cleaning Data Course Project. Detailed descriptions of the project are included below.

##Purpose and Goal of the Project
The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

##Context and Background of the Project
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The experiments that provided the data for this project have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. (Source: Human Activity Recognition Using Smartphones Dataset Version 1.0 Read Me)

##Accessing Data for the Project

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Instructions for Completing the Project
You should create one R script called run_analysis.R that does the following. 
* 1.	Merges the training and the test sets to create one data set.
* 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3.	Uses descriptive activity names to name the activities in the data set
* 4.	Appropriately labels the data set with descriptive variable names. 
* 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
