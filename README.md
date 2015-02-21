# Coursera-Getting-and-Cleaning-Data-Course-Project


This respository holds the script run_analysis.R for the Coursera course - Getting and Cleaning Data.


The original data files used in this script are located at the below location. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


steps to re-create the tidy dataset 

* download and unzip the files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  to the R working directory
* clone this repository or download the script run_analysis.R 
* run script run_analysis.R in the working directory the datafiles were extracted to.

To view the tidy dataset from this repo in R, run the below code.

link <- "https://raw.githubusercontent.com/nickwhimster/Coursera-Getting-and-Cleaning-Data-Course-Project/master/tidy.txt"
df <- read.table(link, header = TRUE)
View(df)
