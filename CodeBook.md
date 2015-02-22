---
title: "Getting and Cleaning Data Course Project"
author: "Nick Whimster"
date: "Friday, February 20, 2015"
---

#Codebook

## Introduction

This codebook describes the steps inside script run_analysis.R for producing a tidy dataset from the datasets located at; 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Original description of the dataset; 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis.R assumes the data files have been downloaded to the root of the working directory.

The original data contains the following files which are used to create the final dataset;


* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.


The following files are available for the train and test data. Their descriptions are equivalent. 
These files are not used in the creation of the tidy dataset.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



## Steps

* install the r packages dplyr and data.table, if they are not already installed.
* create function fGetData to read a file into and return a data.frame.
* using the function fGetData to read the files listed as used above into individual data.frames.
* bind the x_train data & x_test data together into one data.frame
* bind the y_train data & y_test data together into one data.frame
* bind the subject_train data & subject_test data together into one data.frame
* create a logical data.frame (dfkeep) from the features data to match all features which related to data on mean() and std()
* use the features data.frame to map the correct columns names to the x data.
* use the logical data.frame dfkeep to subset the x data to only the variables which hold mean() and std() data.
* bind the subset of the x data with the y data (which holds the activity for each row of x) and the subject data (which maps each row of x to a subject).
* aggregate the mean of this new data grouped by the subject and the activity.
* order the data by subject then activity
* add the activity column with the names of the activities from the file activity_labels and remove the numeric activity this related to
* apply column name to the activity column and swap the subject column to be the first in the data.frame.
* write the final data.frame to a text file.



### Final Variable list


"subject"
"activity"
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"



### The below calculated variables from the original data where excluded from the final tidy dataset.
The complete list of variables of each feature vector is available in 'features.txt' in the original data set. 

mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.



