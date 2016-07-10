#setting a file path and working directory where the data files have been saved
filesPath <- "C:/Users/acdelbert/R/cleaningdatacourse/UCIHARDataset"
setwd(filesPath)

#Loading the necessary packages
library(dplyr)
library(data.table)
library(tidyr)

# Reading the subject files
SubjectTrain <- tbl_df(read.table(file.path(filesPath, "train", "subject_train.txt")))
SubjectTest  <- tbl_df(read.table(file.path(filesPath, "test" , "subject_test.txt" )))

# Reading the activity files
yTrain <- tbl_df(read.table(file.path(filesPath, "train", "Y_train.txt")))
yTest  <- tbl_df(read.table(file.path(filesPath, "test" , "Y_test.txt" )))

#Reading the data files.
xTrain <- tbl_df(read.table(file.path(filesPath, "train", "X_train.txt" )))
xTest  <- tbl_df(read.table(file.path(filesPath, "test" , "X_test.txt" )))

# For the both activity and subject files, this will merge the training and the test sets via row binding 
#and rename variables "subject" and "activityNum"
mergeSubject <- rbind(SubjectTrain, SubjectTest)
setnames(mergeSubject, "V1", "subject")
allY<- rbind(yTrain, yTest)
setnames(allY, "V1", "activityNum")

#combine the training and test files
allX <- rbind(xTrain, xTest)

# name variables according to feature e.g.(V1 = "tBodyAcc-mean()-X")
Features <- tbl_df(read.table(file.path(filesPath, "features.txt")))
setnames(Features, names(Features), c("featureNum", "featureName"))
colnames(allX) <- Features$featureName

#column names for activity labels
activityLabels<- tbl_df(read.table(file.path(filesPath, "activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityNum","activityName"))

# Merging the columns
mergeSubject<- cbind(mergeSubject, allY)
allX <- cbind(mergeSubject, allX)

# Reading "features.txt" and extracting only the mean and standard deviation
FeaturesMeanStd <- grep("mean\\(\\)|std\\(\\)",Features$featureName,value=TRUE) #var name

# Taking only measurements for the mean and standard deviation and adding "subject" and "activityNum"

FeaturesMeanStd <- union(c("subject","activityNum"), FeaturesMeanStd)
allX<- subset(allX,select=FeaturesMeanStd) 

##entering name of activity into allX
allX <- merge(activityLabels, allX , by="activityNum", all.x=TRUE)
allX$activityName <- as.character(allX$activityName)

## creating allX with variable means sorted by subject and Activity
allX$activityName <- as.character(allX$activityName)
Aggr<- aggregate(. ~ subject - activityName, data = allX, mean) 
allX<- tbl_df(arrange(Aggr,subject,activityName))

#Showing the names before
head(str(allX),2)


names(allX)<-gsub("std()", "SD", names(allX))
names(allX)<-gsub("mean()", "Mean", names(allX))
names(allX)<-gsub("^t", "time", names(allX))
names(allX)<-gsub("^f", "frequency", names(allX))
names(allX)<-gsub("Acc", "Accelerometer", names(allX))
names(allX)<-gsub("Gyro", "Gyroscope", names(allX))
names(allX)<-gsub("Mag", "Magnitude", names(allX))
names(allX)<-gsub("BodyBody", "Body", names(allX))

# Showing the names after
head(str(allX),6)

##Creating a text file with the cleaned up data
write.table(allX, "TidyData.txt", row.name=FALSE)

