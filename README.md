---
title: "README"
author: "Lluís Ferreras"
date: "9/7/2020"
output: html_document
---

# Introduction
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone.

The data used for this project can be downloaded in:
[link to data]https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

An R script has been created to perform following tasks:

## 1 - Merge the train and the test sets to create one data set

First we read the training datasets (X_train,y_train and subject_train) from the "UCI HAR Dataset/train" subfolder using the read.table function with the option of not loading a header row and sep="" into R data frames X_train, y_train, subject_train

```{r}
## Reading of training data
# X_train: training dataset
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="")
# y_train: training activiy labels
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")
# subject_train: subjects in training dataset
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="")
```

we read the test datasets (X_test,y_test and subject_test) from the "UCI HAR Dataset/test" subfolder using the read.table function with the option of not loading a header row and sep="" into R data frames X_test, y_test, subject_test

```{r}
## Reading of test data
# X_test: test dataset
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")
# y_test: test activiy labels
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")
# subject_test: subjects in test dataset
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="")
```

we merge the train and the test variables using the rbind() function and creating the new data frames merged_X, merged_y and merged_subject

```{r}
## merging of training and test datasets
merged_X<-rbind(X_train,X_test)
merged_y<-rbind(y_train,y_test)
merged_subject<-rbind(subject_train,subject_test)
```

## 2 - Extracts only the measurements on the mean and standard deviation for each measurement

we read the features dataset from the "UCI HAR Dataset" subfolder containing the names of the variables in the merged_X data frame, into a data frame called features

```{r}
## reading of features (column names) of dataset
features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep="")
```

we rename the column variable names of the X files with the names of the features dataset. The description of the measurement variables are in the second column of the features data frame

```{r}
## We rename the columns of X dataset with the variable names in features dataset
colnames(merged_X)<-features[,2]
```

we select only the columns that correspond to variables related with means and standard deviations. We use the function grepl separately for means and for standard deviation in order to not taking the meanfreq related variables

```{r}
## we take only the variables that correspond to means and standard deviations of measurements
merged_X<-merged_X[,grepl("mean()",colnames(merged_X),fixed = TRUE)|grepl("std()",colnames(merged_X),fixed = TRUE)]
```

## 3 - Use descriptive activity names to name the activities in the data set

we read the activity_labels dataset from the "UCI HAR Dataset" subfolder into the data frame activity_labels. This dataset contains the relation between the activity numbers and their description

```{r}
## reading the activity_labels file that links the class labels with their activity name
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="")
```

we merge the data frame merged_y with activity id numbers with the data frame activity labels with the correspondence between activity id and activity description

```{r}
## we merge variable merged_y with the activity_labels file to allocate descriptive activity names
merged_y<-merge(merged_y,activity_labels,by.x = "V1",by.y = "V1")
```

we build the final tidy dataset putting together the merged_subject with the subject identification, the second columns of the merged_y data frame with the activity description, and the merged_X data frame with all the measurements related with means and standard deviation. We name the new data frame data_set

```{r}
## we build the final tidy dataset joining the columns of subject, labels (with 
## descriptive names - column 2) and measurements
data_set<-cbind(merged_subject,merged_y[,2],merged_X)
```

## 4 - Appropriately label the data set with descriptive variable names

we label the first column of the data frame with "subject" and the second on with "activity". The rest of columns already have a descriptive name composed of the measurement and the suffixe mean() or std() indicating whether the observation is a mean or a standard deviation 

```{r}
## we set descriptive variable names for subject and activity
colnames(data_set)[1:2]<-c("subject","activity")
```

## 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

we load the dplyr package for table treatment and use the function tbl_df to create a tibble that will be useful to create aggregates on factor variables

```{r}
## we load the dplyr package for table treatment
library(dplyr)
## we create a dplyr table from the tidy dataset
data_set_dpl<-tbl_df(data_set)
```

We set groups by the combination subject/activity

```{r}
## we set groups by the combination subject/activity
gr_subject_activity<-group_by(data_set_dpl,subject,activity)
```

we create a new tibble with the averages of all measurement variables for each subject/activity

```{r}
## we create a new dataset with the averages of all measurement variables for
## each subject/activity
stats_dataset<-summarize_all(gr_subject_activity,mean)
```

we save the tibble stats_dataset to a .txt file using the write.table statement

```{r}
## we create a text file with the averages for each subject/activity
write.table(stats_dataset,"./stats_dataset.txt",row.names=FALSE)
```
