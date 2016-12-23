# Getting and Cleaning Data Course Project
# December 23, 2016

# load the data.table and dplyr packages
library(data.table)
library(dplyr)

# if it doesn't already exist, create a directory "./data", assign the source link
# to a variable (fileUrl), download the data as "dataset.zip" into "./data", then
# unzip the dataset into the "./data" folder - straight from lecture notes
# delete hashmarks below once done - I didn't want to keep downloading
# if(!file.exists("./data")){dir.create("./data")}
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, destfile = "./data/dataset.zip")
# unzip("./data/dataset.zip", exdir = "./data")

## read the relevant data sets (text files) into data tables
## the files in the "Inertial Signals" folders are not relevant for this analysis

activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# append the training data to the end of the test data to work with fewer data frames
subjects <- rbind(subject_test, subject_train)
activities <- rbind(y_test, y_train)
measurements <- rbind(x_test, x_train)

# add variable names to the three data frames
colnames(subjects) <- "subject_id"
colnames(activities) <- "activity_id"
colnames(measurements) <- t(features[2])        # transpose 'features'

# Task#1 - merge the training and test sets to create one data set
datamerge <- cbind(measurements, activities, subjects)

# Task#2 - extract only the measurements on the mean and standard deviation for
#          each measurement

## first, identify the column names in 'datamerge' that include 'Mean' or 'Std'
## and return a vector called 'calcs' - per features_info.txt

calcs <- grep(".*Mean.*|.*Std.*", names(datamerge), ignore.case = TRUE)

## second, add the 'activities' and 'subjects' columns (the last two columns in 'datamerge')
datamergeColumns <- c(calcs, 562, 563)

## lastly, extract only the appropriate columns and store in "dataExtract"
dataExtract <- datamerge[ , datamergeColumns]

# Task#3 - use descriptive activity names to name the activities in the data set

## first, convert the element 'activity_id' from numeric to character so you can
## replace 'activity_id' values with the more descriptive 'activity_labels'
dataExtract$activity_id <- as.character(dataExtract$activity_id)
for (i in 1:6) {
        dataExtract$activity_id[dataExtract$activity_id == i] <- as.character(activity_labels[i, 2])
}

## then, convert it back to a factor so you can use it to factor the data
dataExtract$activity_id <- as.factor(dataExtract$activity_id)

# Task#4 - appropriately label the data set with descriptive variable names

## use gsub to replace code names with more descriptive terms
names(dataExtract)<-gsub("Acc", "Accelerometer", names(dataExtract))
names(dataExtract)<-gsub("Gyro", "Gyroscope", names(dataExtract))
names(dataExtract)<-gsub("Mag", "Magnitude", names(dataExtract))
names(dataExtract)<-gsub("^t", "Time", names(dataExtract))
names(dataExtract)<-gsub("^f", "Frequency", names(dataExtract))
names(dataExtract)<-gsub("tBody", "TimeBody", names(dataExtract))
names(dataExtract)<-gsub("-mean()", "Mean", names(dataExtract), ignore.case = TRUE)
names(dataExtract)<-gsub("-std()", "STD", names(dataExtract), ignore.case = TRUE)
names(dataExtract)<-gsub("-freq()", "Frequency", names(dataExtract), ignore.case = TRUE)
names(dataExtract)<-gsub("angle", "Angle", names(dataExtract))
names(dataExtract)<-gsub("gravity", "Gravity", names(dataExtract))

# Task#5 - from the data set in step 4, create a second, independent tidy 
#          data set with the average of each variable for each activity and each subject.

dataExtract$subject_id <- as.factor(dataExtract$subject_id)
dataExtract <- data.table(dataExtract)

## compute the means for each subject and activity
dataTidy <- aggregate(. ~subject_id + activity_id, dataExtract, mean)

## order the resulting data frame by 'subject_id', then by 'activity_id'
dataTidy <- dataTidy[order(dataTidy$subject_id, dataTidy$activity_id), ]

## create the tidy data 'dataTidy' in a text file.
write.table(dataTidy, file = "dataTidy.txt", row.names = FALSE)