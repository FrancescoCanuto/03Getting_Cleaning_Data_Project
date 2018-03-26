# Getting and Cleaning Data Course Project
Repository of file related to peer assignment of Getting and Cleaning Data Project Assignment

## Files in the repo - introduction
* Readme.md - With a brief description on work organization
* run_analysis.R - Script file with all R program to performe the project
* codeBook.md - md file with description of data and transformation
* tidy_data.txt - new data set coming according with question 5 of assignment

## run_analysis.R organization
* PART 1 - Merges the training and the test sets to create one data set
* PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement
* PART 3 - Uses descriptive activity names to name the activities in the data set
* PART 4 - Appropriately labels the data set with descriptive variable names
* PART 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject 

## Data description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'codeBook.md' for more details. 

## The tidy_data.txt dataset
The "tidy_data.txt" data set include following data

###Subject ID - ID factor of people who did the test
The group of 30 volunteers who carried out the experiment. ID 1-30

###Typeactivity - Label of single activity performed by each subject
The  activities that each person performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

###Sensor variables calculated in Time and Frequency domain (features)
The vector of features was obtained by calculating variables from the time and frequency domain. The features available are mean(): Mean value and std(): Standard deviation

