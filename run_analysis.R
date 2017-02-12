## run_analysis.R

##  read_tble is used to read fixed width separated by whitespace 
##  read_fwf is used where there is no whitespace
library(readr)
library(dplyr)
library(plyr)

# Get data field names
trainingDataNames <- read.fwf("features.txt", widths = 255)

# Get training data measurements
trainingData <- read_table("train/X_train.txt"
                           , col_names = as.character(trainingDataNames$V1))

# Get activities for training data 
trainingDataY <- read_table("train/y_train.txt"
                            , col_names = c("ActivityCode"))

# Get codes for subjects
trainingDataSubject <- read_table("train/subject_train.txt"
                                  , col_names = c("SubjectNumber"))

# Combine columns
trainingData <- cbind(trainingDataSubject, trainingDataY, trainingData)

# Get test data measurements
testData <- read_table("test/X_test.txt"
                       , col_names = as.character(trainingDataNames$V1))

# Get activities for test data
testDataY <- read_table("test/y_test.txt", col_names = c("ActivityCode"))

# Get codes for subjects
testDataSubject <- read_table("test/subject_test.txt"
                              , col_names = c("SubjectNumber"))

# Combine test data columns
testData <- cbind(testDataSubject, testDataY, testData)

# Combine training and test data sets
mergedData <- rbind(trainingData, testData)

# Get Activity Names
activityNames <- read_table("activity_labels.txt"
                            , col_names = c("ActivityCode", "ActivityName"))

# merge activity names into mergedData frame
mergedData <- merge(activityNames, mergedData, by.x = "ActivityCode"
                    , by.y = "ActivityCode")

# Remove meanFreq to keep out of final data set
mergedData <- mergedData[, -(grep("meanFreq", names(mergedData)))]

# populate skinnyData frame with Subject, Activity, and any fields with 
# mean or std in name
skinnyData <- mergedData[, c(3, 2, grep("mean", names(mergedData)), 
                             grep("std", names(mergedData)))]

# Sort data by Subject and Activity
skinnyData <- arrange(skinnyData, SubjectNumber, ActivityName)

# Group dataset by Subject and Activity
group_by(skinnyData, SubjectNumber, ActivityName)

# create final tidy dataset with averages of measurements \
# by subject and activity
samsungData <- ddply(skinnyData, .(SubjectNumber, ActivityName)
                     , colwise(mean))

names(samsungData)[3:68] <- paste(names(samsungData)[3:68], "Average")


write.table(samsungData, file = "samsungData.txt", row.names = FALSE)