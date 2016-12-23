---
title: "Code Book"
author: "macgrouther"
date: "12/23/2016"
output: html_document
---

dataTidy.txt is the output file from running the run_analysis.R script.
This code book lists the variable names, which have been expanded from the 
original data set to be more intuitive than the code names used there and should be 
self-explanatory given an understanding of the data.  
This was one of the tasks of the assignment.  

dataTidy.txt meets the 3 key requirements of tidy data:  
1. Each variable forms a column. (Each of the 88 column heading is listed below.)  
2. Each observation forms a row. (There are 180 observations: 6 activities x 30 subjects.)  
3. Each type of observational unit forms a table. (tidyData is the only table.)  

Additional notes have been added where applicable.  

The following code may be run to obtain the original data set:  

`if(!file.exists("./data")){dir.create("./data")}`  
`fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"`  
`download.file(fileUrl, destfile = "./data/dataset.zip")`  
`unzip("./data/dataset.zip", exdir = "./data")`  

#### IDENTIFICATION DATA  

subject_id  - one of 30 subject identified by an integer  
activity_id - one of 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
Note: 30 subjects x the 6 activies results in the 180 observations.  

#### MEASUREMENT DATA:  
Note: There were a total of 86 activity measurements. Each variable is listed below.  
For further reading, there are two files with the original data set that will
clarify:  README.txt and feature_info.txt.

TimeBodyAccelerometerMean()-X  
TimeBodyAccelerometerMean()-Y  
TimeBodyAccelerometerMean()-Z  
TimeBodyAccelerometerSTD()-X  
TimeBodyAccelerometerSTD()-Y  
TimeBodyAccelerometerSTD()-Z  
TimeGravityAccelerometerMean()-X  
TimeGravityAccelerometerMean()-Y  
TimeGravityAccelerometerMean()-Z  
TimeGravityAccelerometerSTD()-X  
TimeGravityAccelerometerSTD()-Y  
TimeGravityAccelerometerSTD()-Z  
TimeBodyAccelerometerJerkMean()-X  
TimeBodyAccelerometerJerkMean()-Y  
TimeBodyAccelerometerJerkMean()-Z  
TimeBodyAccelerometerJerkSTD()-X  
TimeBodyAccelerometerJerkSTD()-Y  
TimeBodyAccelerometerJerkSTD()-Z  
TimeBodyGyroscopeMean()-X  
TimeBodyGyroscopeMean()-Y  
TimeBodyGyroscopeMean()-Z  
TimeBodyGyroscopeSTD()-X  
TimeBodyGyroscopeSTD()-Y  
TimeBodyGyroscopeSTD()-Z  
TimeBodyGyroscopeJerkMean()-X  
TimeBodyGyroscopeJerkMean()-Y  
TimeBodyGyroscopeJerkMean()-Z  
TimeBodyGyroscopeJerkSTD()-X  
TimeBodyGyroscopeJerkSTD()-Y  
TimeBodyGyroscopeJerkSTD()-Z  
TimeBodyAccelerometerMagnitudeMean()  
TimeBodyAccelerometerMagnitudeSTD()  
TimeGravityAccelerometerMagnitudeMean()  
TimeGravityAccelerometerMagnitudeSTD()  
TimeBodyAccelerometerJerkMagnitudeMean()  
TimeBodyAccelerometerJerkMagnitudeSTD()  
TimeBodyGyroscopeMagnitudeMean()  
TimeBodyGyroscopeMagnitudeSTD()  
TimeBodyGyroscopeJerkMagnitudeMean()  
TimeBodyGyroscopeJerkMagnitudeSTD()  
FrequencyBodyAccelerometerMean()-X  
FrequencyBodyAccelerometerMean()-Y  
FrequencyBodyAccelerometerMean()-Z  
FrequencyBodyAccelerometerSTD()-X  
FrequencyBodyAccelerometerSTD()-Y  
FrequencyBodyAccelerometerSTD()-Z  
FrequencyBodyAccelerometerMeanFreq()-X  
FrequencyBodyAccelerometerMeanFreq()-Y  
FrequencyBodyAccelerometerMeanFreq()-Z  
FrequencyBodyAccelerometerJerkMean()-X  
FrequencyBodyAccelerometerJerkMean()-Y  
FrequencyBodyAccelerometerJerkMean()-Z  
FrequencyBodyAccelerometerJerkSTD()-X  
FrequencyBodyAccelerometerJerkSTD()-Y  
FrequencyBodyAccelerometerJerkSTD()-Z  
FrequencyBodyAccelerometerJerkMeanFreq()-X  
FrequencyBodyAccelerometerJerkMeanFreq()-Y  
FrequencyBodyAccelerometerJerkMeanFreq()-Z  
FrequencyBodyGyroscopeMean()-X  
FrequencyBodyGyroscopeMean()-Y  
FrequencyBodyGyroscopeMean()-Z  
FrequencyBodyGyroscopeSTD()-X  
FrequencyBodyGyroscopeSTD()-Y  
FrequencyBodyGyroscopeSTD()-Z  
FrequencyBodyGyroscopeMeanFreq()-X  
FrequencyBodyGyroscopeMeanFreq()-Y  
FrequencyBodyGyroscopeMeanFreq()-Z  
FrequencyBodyAccelerometerMagnitudeMean()  
FrequencyBodyAccelerometerMagnitudeSTD()  
FrequencyBodyAccelerometerMagnitudeMeanFreq()  
FrequencyBodyBodyAccelerometerJerkMagnitudeMean()  
FrequencyBodyBodyAccelerometerJerkMagnitudeSTD()  
FrequencyBodyBodyAccelerometerJerkMagnitudeMeanFreq()  
FrequencyBodyBodyGyroscopeMagnitudeMean()  
FrequencyBodyBodyGyroscopeMagnitudeSTD()  
FrequencyBodyBodyGyroscopeMagnitudeMeanFreq()  
FrequencyBodyBodyGyroscopeJerkMagnitudeMean()  
FrequencyBodyBodyGyroscopeJerkMagnitudeSTD()  
FrequencyBodyBodyGyroscopeJerkMagnitudeMeanFreq()  
Angle(TimeBodyAccelerometerMean,Gravity)  
Angle(TimeBodyAccelerometerJerkMean),GravityMean)  
Angle(TimeBodyGyroscopeMean,GravityMean)  
Angle(TimeBodyGyroscopeJerkMean,GravityMean)  
Angle(X,GravityMean)  
Angle(Y,GravityMean)  
Angle(Z,GravityMean)  