## Reading of training data
# X_train: training dataset
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="")
# y_train: training activiy labels
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")
# subject_train: subjects in training dataset
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="")

## Reading of test data
# X_test: test dataset
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")
# y_test: test activiy labels
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")
# subject_test: subjects in test dataset
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="")

## merging of training and test datasets
merged_X<-rbind(X_train,X_test)
merged_y<-rbind(y_train,y_test)
merged_subject<-rbind(subject_train,subject_test)

## reading of features (column names) of dataset
features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep="")
## We rename the columns of X dataset with the variable names in features dataset
colnames(merged_X)<-features[,2]
## we take only the variables that correspond to means and standard deviations of measurements
merged_X<-merged_X[,grepl("mean()",colnames(merged_X),fixed = TRUE)|grepl("std()",colnames(merged_X),fixed = TRUE)]

## reading the activity_labels file that links the class labels with their activity name
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="")

## we merge variable merged_y with the activity_labels file to allocate descriptive activity names
merged_y<-merge(merged_y,activity_labels,by.x = "V1",by.y = "V1")

## we build the final tidy dataset joining the columns of subject, labels (with 
## descriptive names - column 2) and measurements
data_set<-cbind(merged_subject,merged_y[,2],merged_X)

## we set descriptive variable names for subject and activity
colnames(data_set)[1:2]<-c("subject","activity")

## we load the dplyr package for table treatment
library(dplyr)

## we create a dplyr table from the tidy dataset
data_set_dpl<-tbl_df(data_set)

## we set groups by the combination subject/activity
gr_subject_activity<-group_by(data_set_dpl,subject,activity)

## we create a new dataset with the averages of all measurement variables for
## each subject/activity
stats_dataset<-summarize_all(gr_subject_activity,mean)

## we create a text file with the averages for each subject/activity
write.table(stats_dataset,"./stats_dataset.txt",row.names=FALSE)
