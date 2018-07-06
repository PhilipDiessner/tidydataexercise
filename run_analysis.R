library("dplyr")

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

    # TODO rename features

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

# from datframe select only mean and std of measurments as data together with
# subject and activity
getmeanstd <- function(datfr){
    # columns matching subject, activity, mean(), or std()
    needed <- grep("subject|activity|(mean\\(\\)|std\\(\\))",names(datfr))
    select(datfr,needed)
}

averageing <- function(datfr){
    datfr %>% group_by(subject,activity) %>% summarise_all(funs(mean))
}

pathtodata <- "data/ExcerciseDataset"
output <-"tidydataset.csv"
result <- getfulltable(pathtodataset)
write.table(result %>% getmeanstd %>% averageing, file = output)
