## Coursera Peer Assignment 
## Course 03 Getting and Cleaning data
## Week 4

## Upload needed libraries
library(dplyr)

##################################################################################################
## PART 1 - Merges the training and the test sets to create one data set

#Setting path, dowload files, unzip
#path of zip file
fileurl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filezip <- "UCI HAR Dataset.zip"
path_name <- file.path("UCI HAR Dataset")

#download zip file
if(!file.exists(filezip)){download.file(fileurl, filezip)}
#unzip file
unzip(zipfile = filezip)

##################################################################################################
## Reading data

#feature vector
features<- read.table(file.path(path_name, "features.txt"), header = FALSE)

#Reading activity labels
activitylabels<- read.table(file.path(path_name, "activity_labels.txt"), header = FALSE)

#Reading test Variables
x_test <- read.table(file.path(path_name, "test", "X_test.txt"), header = FALSE)
y_test <- read.table(file.path(path_name, "test", "y_test.txt"), header = FALSE)
subject_test <- read.table(file.path(path_name, "test", "subject_test.txt"), header = FALSE)

#Reading train Variables
x_train <- read.table(file.path(path_name, "train", "X_train.txt"), header = FALSE)
y_train <- read.table(file.path(path_name, "train", "y_train.txt"), header = FALSE)
subject_train <- read.table(file.path(path_name, "train", "subject_train.txt"), header = FALSE)

#Merging test and training data together
x_data <- rbind(x_test,x_train)
y_data <- rbind(y_test,y_train)
subject_data <- rbind(subject_test,subject_train)

# setting names of the columns of the tables
names(subject_data) <- "subject"
names(y_data) <- "activity"
names(x_data) <- features[, 2]

##################################################################################################
## PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement

# search for mean() and std()
list_mean_std <- grep("(mean|std)\\(\\)", features[,2])
# feature data reduced by mean and std
x_datared <- x_data[, list_mean_std]

##################################################################################################
##PART 3 - Uses descriptive activity names to name the activities in the data set

# assigning label activtity to typeactivtiy (label instead of number)
y_data$typeactivity <- factor(activitylabels[y_data$typeactivity,2])
#summary(all_data$typeactivity) view table of typeactivity

##################################################################################################
##PART 4 - Appropriately labels the data set with descriptive variable names

# names optimization for readability
names(x_datared)<-gsub("^t", "Time", names(x_datared))
names(x_datared)<-gsub("^f", "Freq", names(x_datared))
names(x_datared)<-gsub("BodyBody", "Body", names(x_datared))

# create a unique dataframe
all_data <- cbind(subject_data, y_data, x_datared)
#dim(all_data)

##################################################################################################
##PPART 5 - From the data set in step 4, creates a second, independent tidy data set with the average
##         of each variable for each activity and each subject

#re-arrange data
all_data_done <- all_data[order(all_data$subject),]
#write tidy data on hd
write.table(all_data_done, file = file.path("tidydata.txt"), row.names=FALSE, sep = ',')

