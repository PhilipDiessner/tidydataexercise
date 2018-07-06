library("dplyr")
## See README.md in directory for description of this script
##

# function reads all necessary files from dataset and merges them
# to one data frame using activity names and adding variable names
getfulltable <- function(pathtodataset){

    # Assuming Unix system for paths...
    readin <- function(txtloc, ...){
        read.csv(
            paste(pathtodataset, txtloc, sep="/"),
                 sep = "", header = FALSE, ...)
    }

    # Reading in all necessary files
    testx <- readin("test/X_test.txt")
    testy <- readin("test/y_test.txt")
    testsub <- readin("test/subject_test.txt")

    trainx <- readin("train/X_train.txt")
    trainy <- readin("train/y_train.txt")
    trainsub <- readin("train/subject_train.txt")

    active <- readin("activity_labels.txt")
    features <- readin("features.txt", stringsAsFactors = FALSE)

    names(testx) <- features[,2]
    names(testy) <- "activnum"
    names(testsub) <- "subject"
    names(trainx) <- features[,2]
    names(trainy) <- "activnum"
    names(trainsub) <- "subject"
    names(active) <- c("activnum","activity")

    test <- bind_cols(testsub,testy,testx)
    train <- bind_cols(trainsub,trainy,trainx)
    full <- bind_rows(test,train)
    full$subject = as.factor(full$subject)
    full <- select(left_join(full,active,by = "activnum"),-c("activnum"))
    full[order(full$subject),]
}

# from dataframe select only mean and std of measurments as data together with
# subject and activity
getmeanstd <- function(datfr){
    # columns matching subject, activity, mean(), or std()
    needed <- grep("subject|activity|(mean\\(\\)|std\\(\\))",names(datfr))
    select(datfr,needed)
}

# tidy up labeling
labeling <- function(datfr){
    toregexp <- names(datfr)
    toregexp <- gsub("^t","time",toregexp)
    toregexp <- gsub("^f","frequency",toregexp)
    toregexp <- gsub("Acc","acceleration",toregexp)
    toregexp <- gsub("Gyro","gyroscope",toregexp)
    toregexp <- gsub("Mag","magnitude",toregexp)
    toregexp <- gsub("-(mean|std)\\(\\)-*([XYZ]*)","\\2\\1",toregexp)
    toregexp <- tolower(toregexp)
    names(datfr)<- toregexp
    datfr
}

# average over all mean and std for each subject and activity
averageing <- function(datfr){
    datfr %>% group_by(subject,activity) %>% summarise_all(funs(mean))
}

# download data set, unpack, create tidy set, then clean up

webpath <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(webpath,"dataset.zip",mode="wb")
unzip("dataset.zip")
output <-"tidydataset.csv"
result <- getfulltable("UCI HAR Dataset")
write.table(result %>% getmeanstd %>% labeling %>% averageing, file = output,
            row.names = FALSE)
unlink(c("dataset.zip","UCI HAR Dataset"), recursive = TRUE)
