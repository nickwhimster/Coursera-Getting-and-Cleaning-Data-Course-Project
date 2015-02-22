

# get packages if not installed
if (!require("data.table")) {
    install.packages("data.table")
}
library(data.table)

if (!require("data.table")) {
    install.packages("data.table")
}

library(dplyr)

# Function to read data from file
fGetData<- function (path, separator="" ) {
    # read first row to get number of columns
    df1_row<- df<-read.table(path, header=FALSE, sep= separator, nrows=1)
    cClass<-sapply(df1_row, class)
    #read data 
    df<-read.table(path, header=FALSE,sep= separator,colClasses= cClass)
    df    
}


# read column headers
dffeatures<-fGetData('~/UCI HAR Dataset/features.txt')
dfactivity_lables<-fGetData('~/UCI HAR Dataset/activity_labels.txt')
colnames(dfactivity_lables)<-'activity'

# read x_train data
dfxtrain<-fGetData('~/UCI HAR Dataset/train/X_train.txt')
dfytrain<-fGetData('~/UCI HAR Dataset/train/y_train.txt')
dftrainsubjects<-fGetData('~/UCI HAR Dataset/train/subject_train.txt')

# read x_test data 
dfxtest<-fGetData('~/UCI HAR Dataset/test/X_test.txt')
dfytest<-fGetData('~/UCI HAR Dataset/test/y_test.txt')
dftestsubjects<-fGetData('~/UCI HAR Dataset/test/subject_test.txt')

#bind x data together
df_x<-bind_rows(dfxtrain, dfxtest)
df_y<-bind_rows(dfytrain, dfytest)
df_subjects<-bind_rows(dftrainsubjects,dftestsubjects)

# get logical data on columns to keep
dfkeep<- sapply(dffeatures[,2], function(x) grepl("mean()", x, fixed=T) | grepl("std()", x, fixed=T))

# Apply column names to x data
colnames(df_x)<- dffeatures$V2
dflist<-dffeatures[(dfkeep),]
# subset the mean & std columns
dfsubx<- df_x[, (dfkeep)]

# bind all columns; subjects, subset of x data and y data
dfall<-cbind(df_subjects, df_y, dfsubx)

#add column names for subject and activity
colnames(dfall)[1:2]<-c('subject','activity')

#aggregate data
dftidy<-dfall %>% group_by(subject,activity) %>% summarise_each(funs(mean))
dftidy<-merge(dfactivity_lables,dftidy,by='activity')
dftidy<-select(dftidy,-activity)
dftidy<-arrange(dftidy,subject)
colnames(dftidy)[1]<-'activity'
dftidy<-dftidy[,c("subject",setdiff(names(dftidy),"subject"))]

write.table(dftidy, "tidy.txt" )



link <- "https://github.com/nickwhimster/Coursera-Getting-and-Cleaning-Data-Course-Project/blob/master/tidy.txt"
#address <- sub("^https", "http", address)
df <- read.table(link, header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
View(df)
