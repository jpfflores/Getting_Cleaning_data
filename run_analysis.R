## Create one R script called run_analysis.R that does the following:

## 0 - Load the data
TableFtres <- read.table('./UCI HAR Dataset/features.txt',header=FALSE);
TableActType <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE);

TableSubjTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE);
TableXTrain <-  read.table('./UCI HAR Dataset/train/x_train.txt',header=FALSE);
TableYTrain <-  read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE);

TableSubjTest <- read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE);
TableXTest <-  read.table('./UCI HAR Dataset/test/x_test.txt',header=FALSE);
TableYTest <-  read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE);

## 1. Merges the training and the test sets to create one data set.
DataX <- rbind( TableXTrain, TableXTest) 
DataY <- rbind( TableYTrain, TableYTest) 
DataSubj <- rbind( TableSubjTrain, TableSubjTest) 


# 3. Use descriptive activity names to name the activities in the data set
colnames(TableFtres)  = c('featureId','featureName');
colnames(TableActType)  = c('activityId','activityType');
colnames(DataSubj)  = "subjectId";
colnames(DataX)        = TableFtres[,2]; 
colnames(DataY)        = "activityId";

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
IdxFtres <- grep("-mean\\(\\)|-std\\(\\)", TableFtres$featureName) 
ValidDataX <- DataX[,IdxFtres]

# 4. Appropriately label the data set with descriptive activity names. 

# Final Data
TidyData <- cbind(ValidDataX, DataY,DataSubj);

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
JustData <- TidyData[, 3:dim(TidyData)[2]]
TidyAvgData <- aggregate(JustData,list(TidyData$subjectId, TidyData$activityId), mean)

names(TidyAvgData)[1] = "Subject"
names(TidyAvgData)[2] = "Activity"