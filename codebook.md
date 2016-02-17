## Getting and Cleaning Data Project

Atit Doctor
February 16, 2016


### Source Data
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) mounting a smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
- activity_labels.txt
- features.txt
- subject_test.txt
- X_test.txt
- Y_test.txt
- subject_train.txt
- X_train.txt
- y_train.txt

Assign column names and merge to create one data set.


### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Create a vector that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others. Subset this data to keep only the required columns.


### 3. Use descriptive activity names to name the activities in the data set.
Merge data subset with the activityType table to cinlude the descriptive activity names.


### 4. Appropriately label the data set with descriptive variable names.
Use gsub function for pattern replacement to clean up the data labels in the finalData table.


### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
As per the project instructions, only a data set with the average of each veriable for each activity and subject is to be produced. 
