---
title: "Codebook - Clean Data Project"
author: "Dan Martin"
date: "2/12/2017"
output: html_document
---

## Clean Data Project - Smartphone Data

### Outline

This codebook outlines the process to clean and tidy a smartphone activity data set.  Included is also the original specification of the data from Smartlab, which is in the next section.  All transforms to the data and modifications will be outlined, as well as a list of the fields in each data set.

### Original Data Definition


##### Human Activity Recognition Using Smartphones Dataset
##### Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

All features are normalized and bounded within [-1,1].

### Transformations to the data

The original data set was provided in two groups: test and training.  It was necessary to piece the groups together.  In addition, the header and subject IDs, as well as activity IDs, were stored in other files (y_train.txt, subject_train.txt, y_test.txt, subject_test.txt, features.txt).  The first step was getting the header, activity, and subject values into the respective datasets.  Once the information was in place we could then combine the two datasets into one, called mergedData.  

It was also necessary to get the activity names into the dataset, since the activity IDs weren't of much use.  This was done with a merge process against the data from the file activity_labels.txt.  

Since the only measures of interest to this project were the mean and standard deviation values, a second dataset was created having only those values, as well as the subject ID and the activity.  This was done using a grep function to find values that matched our criteria.

A final data set called samsungData was built that held the average feature observation for each activity for each of the 30 subjects.  This dataset has 180 observations of 68 variables. 

### Variables in skinnyData

- SubjectNumber
- ActivityName
- 1 tBodyAcc-mean()-X
- 2 tBodyAcc-mean()-Y
- 3 tBodyAcc-mean()-Z
- 41 tGravityAcc-mean()-X
- 42 tGravityAcc-mean()-Y
- 43 tGravityAcc-mean()-Z
- 81 tBodyAccJerk-mean()-X
- 82 tBodyAccJerk-mean()-Y
- 83 tBodyAccJerk-mean()-Z
- 121 tBodyGyro-mean()-X
- 122 tBodyGyro-mean()-Y
- 123 tBodyGyro-mean()-Z
- 161 tBodyGyroJerk-mean()-X
- 162 tBodyGyroJerk-mean()-Y
- 163 tBodyGyroJerk-mean()-Z
- 201 tBodyAccMag-mean()
- 214 tGravityAccMag-mean()
- 227 tBodyAccJerkMag-mean()
- 240 tBodyGyroMag-mean()
- 253 tBodyGyroJerkMag-mean()
- 266 fBodyAcc-mean()-X
- 267 fBodyAcc-mean()-Y
- 268 fBodyAcc-mean()-Z
- 345 fBodyAccJerk-mean()-X
- 346 fBodyAccJerk-mean()-Y
- 347 fBodyAccJerk-mean()-Z
- 424 fBodyGyro-mean()-X
- 425 fBodyGyro-mean()-Y
- 426 fBodyGyro-mean()-Z
- 503 fBodyAccMag-mean()
- 516 fBodyBodyAccJerkMag-mean()
- 529 fBodyBodyGyroMag-mean()
- 542 fBodyBodyGyroJerkMag-mean()
- 4 tBodyAcc-std()-X
- 5 tBodyAcc-std()-Y
- 6 tBodyAcc-std()-Z
- 44 tGravityAcc-std()-X
- 45 tGravityAcc-std()-Y
- 46 tGravityAcc-std()-Z
- 84 tBodyAccJerk-std()-X
- 85 tBodyAccJerk-std()-Y
- 86 tBodyAccJerk-std()-Z
- 124 tBodyGyro-std()-X
- 125 tBodyGyro-std()-Y
- 126 tBodyGyro-std()-Z
- 164 tBodyGyroJerk-std()-X
- 165 tBodyGyroJerk-std()-Y
- 166 tBodyGyroJerk-std()-Z
- 202 tBodyAccMag-std()
- 215 tGravityAccMag-std()
- 228 tBodyAccJerkMag-std()
- 241 tBodyGyroMag-std()
- 254 tBodyGyroJerkMag-std()
- 269 fBodyAcc-std()-X
- 270 fBodyAcc-std()-Y
- 271 fBodyAcc-std()-Z
- 348 fBodyAccJerk-std()-X
- 349 fBodyAccJerk-std()-Y
- 350 fBodyAccJerk-std()-Z
- 427 fBodyGyro-std()-X
- 428 fBodyGyro-std()-Y
- 429 fBodyGyro-std()-Z
- 504 fBodyAccMag-std()
- 517 fBodyBodyAccJerkMag-std()
- 530 fBodyBodyGyroMag-std()
- 543 fBodyBodyGyroJerkMag-std()

### Variables in samsungData

The names are similar to those in skinnyData, however, "Average" has been appended to columns 3 through 68.
