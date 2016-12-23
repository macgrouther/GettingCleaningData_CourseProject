---
title: "README"
author: "macgrouther"
date: "12/23/2016"
output: html_document
---

## Course Project for Getting and Cleaning Data

The purpose of this project was to demonstrate the ability to collect, work with, and clean a data set. The end result was to prepare tidy data that could be used for later analysis. This tidy dataset, called dataTidy.txt, is included in this repository.  

### Repository Inventory  

This repository comprises four items:  

1. This README.md file
2. The code book, aptly named "CodeBook.md", which lists all of the variables (or column names) in the resulting dataTidy.txt.  It also includes R code necessary to retrieve the original data set.  
3. The R script itself, which also shows the code necessary to retrieve the data set, but it has been "commented" so that the script doesn't continuously download the data every time the program is run.
4. The resulting "dataTidy.txt", which is the output of this project.  It may be read into R 
from your working directory by using the following command:  

`dataTidy <- read.table("./dataTidy.txt", header = TRUE)`  

### The script: run_analysis.R  

This one script performs the following actions:  

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.    
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

Each item has been called out in the script with comments, prefaced with "# Task#..." for easy
identification.  Subtasks have been commented with double hashmarks ("##").

Lastly, I found this to be a challenging and time-consuming project.  I am interested in
learning from your feedback.