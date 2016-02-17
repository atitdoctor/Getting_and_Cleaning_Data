# 1. Merge the training and the test sets to create one data set.

setwd('/Users/adoctor/Documents/UCI HAR Dataset/');

## Read in the data from files
features     = read.table('./features.txt',header=FALSE); 
activityType = read.table('./activity_labels.txt',header=FALSE); 
subjectTrain = read.table('./train/subject_train.txt',header=FALSE); 
xTrain       = read.table('./train/x_train.txt',header=FALSE);
yTrain       = read.table('./train/y_train.txt',header=FALSE); 

## Assigin column names to the data imported
colnames(activityType)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";

## Create the final training set by merging yTrain, subjectTrain, and xTrain
trainingData = cbind(yTrain,subjectTrain,xTrain);

## Read in the test data and assigning column names to the test data
subjectTest = read.table('./test/subject_test.txt',header=FALSE);
xTest       = read.table('./test/x_test.txt',header=FALSE);
yTest       = read.table('./test/y_test.txt',header=FALSE);

colnames(subjectTest) = "subjectId";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activityId";

## Create the final test set by merging the xTest, yTest and subjectTest data
testData = cbind(yTest,subjectTest,xTest);

## Combine training and test data to create a final data set
finalData = rbind(trainingData,testData);

## Create a vector for the column names from the finalData, which will be used to select the desired mean() & stddev() columns
colNames  = colnames(finalData); 


# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# LogicalVector that has TRUE values for the ID, mean() & stddev() columns and FALSE for others
logVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

# Subset finalData table based on the logicalVector to keep only required columns
finalData = finalData[logVector==TRUE];


# 3. Use descriptive activity names to name the activities in the data set

# 4. Appropriately label the data set with descriptive activity names. 

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

