# Original data
This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone.

The data used for this project can be downloaded in:
[link to data]https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Description of the variables of the tidy dataset

-subject: This variable indicates the subject who performed the experiment. The information of this variable was in the original files 'train/subject_train.txt' and 'test/subject_test.txt'. Its range is from 1 to 30

-activity: This variable indicates the description of the activity performed by the subject. This variable has been created using the activity ids from original files 'train/y_train.txt' and 'test/y_test.txt' and using the correspondence between the activity ids and the activity descriptions in the file 'activity_labels.txt'. Its possible values are WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING

The rest of variables of this dataset correspond to the mean and standard deviation of the following measurements:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The final variable names follow this pattern:
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
...

There are 33 variables correponding to means and 33 variables corresponding to standard deviations.

The mean variables are in the range [-1,1] and the standard deviation variables are in the range [0,1] because the original features are in the range [-1,1]

# Description of the variables of the stats_dataset.txt file containing the averages of all variables by subject and activity

- subject: This variable indicates the subject who performed the experiment. The information of this variable was in the original files 'train/subject_train.txt' and 'test/subject_test.txt'. Its range is from 1 to 30

-activity: This variable indicates the description of the activity performed by the subject. This variable has been created using the activity ids from original files 'train/y_train.txt' and 'test/y_test.txt' and using the correspondence between the activity ids and the activity descriptions in the file 'activity_labels.txt'. Its possible values are WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING

The name of the rest of variables is the same as that of the tidy dataset described above. For each variable is provided the average of all the observations correponding to a subject and activity.

There are 33 variables correponding to means and 33 variables corresponding to standard deviations.

The mean variables are in the range [-1,1] and the standard deviation variables are in the range [0,1] because the original features are in the range [-1,1]

