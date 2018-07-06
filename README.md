# Data science course 3, getting and cleaning data,  excercise

## Objective

The 
[original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
should be made tidy following these guidelines:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each observation.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This is achieved the R script "run_analysis.R" which downloads the tarball, unpacks it and peforms the above steps.
It creates the tidy dataset of step 5 as "tidydataset.csv" and cleans up all intermediate files and directories
The data set can be read in with 'read.table("tidydataset.csv", colClasses = c(subject = "factor"))'.

The data set is in the wide format assuming that each row in original data set is an independent observation
where the single measurements can not be split as there might be some correlation from the process of measurement.
The select for mean() was such that for every mean() column and std() column exists.

***

The repo includes the following files:
* README.md - this file
* Codebook.md - describes the data of the tidy data set
* run_analysis.R - R script to create the tidy data set

***

From README of original data set:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:
> ======================================

> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.
