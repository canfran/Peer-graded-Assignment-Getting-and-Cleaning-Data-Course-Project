#COURSE3_FINAL PROJECT

  
#1 Merges the training and the test sets to create one data set.
  
  #1st - download and unzip dataset.zip locally from https address; and read each dataframe given their location
  path <- getwd()
  path <- paste(path,"/data")
  if(!file.exists("./data")){dir.create("./data")}
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="./data/dataset.zip", method="curl")
  unzip("./data/dataset.zip",exdir = "./data/")
  X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
  X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
  y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
  y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
  subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
  activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
  features <- read.table("./data/UCI HAR Dataset/features.txt")
  
  #2nd - merging in unique dataset using rbind()
  X <-  rbind(X_train, X_test) #merging dataset of measurements
  y <-  rbind(y_train, y_test) #merging dataset of labels
  subject <-  rbind(subject_train, subject_test) #merging dataset of subjects
  
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  #1st - build regular expression for selecting only the names including mean() or std()
  re <- "(mean\\(\\))|(std\\(\\))" #regular expression which implies "-mean" or "-std" as required
  features1 <- features[grep(re, features$V2),] #set of features required through grep() and re defined
  X1 <- X[,features1$V1] #selection the columns which match features required
 
#3 Uses descriptive activity names to name the activities in the data set
  #1st - create function to make multiple sub() given activity_labels match between V1 and V2
  gsubs <- function(pattern, replacement, x, ...) {
    if (length(pattern)!=length(replacement)) {
      stop("pattern and replacement do not have the same length.")
    }
    output <- x
    for (i in 1:length(pattern)) {
      output <- gsubs(pattern[i], replacement[i], output, ...)
    }
    output
  }
  #2nd - applying mgsub() to y (merged dataset of labels)
  yy <- mgsub(activity_labels$V1,activity_labels$V2,y$V1)
  
  #3rd - include labels(y) and subjects(subject) as new columns at the beginning in X dataset as required (I understand it is what step3 is saying ;))
  X <- cbind(yy,X1)
  X <- cbind(subject,X) #including additional column with subject
  
#4 Appropriately labels the data set with descriptive variable names. 
  
  #1at - named first two columns and include original names from features
  names(X)[1] <- "subject"
  names(X)[2] <- "activity"
  names(X)[3:length(names(X))] <- as.character(features1$V2[1:length(features1$V2)])
  
  #Changes in the names of features to get better description: "Acc" by "Accelerometer", "Gyro" by "Gyroscope", 
  #"Mag" by "Magnitude", "f" by "frequency", "t" by "time"
  names(X)[-c(1:2)]<-gsub("Acc", "Accelerometer", names(X)[-c(1:2)])
  names(X)[-c(1:2)]<-gsub("Gyro", "Gyroscope", names(X)[-c(1:2)])
  names(X)[-c(1:2)]<-gsub("Mag", "Magnitude", names(X)[-c(1:2)])
  names(X)[-c(1:2)]<-gsub("^f", "frequency", names(X)[-c(1:2)])
  names(X)[-c(1:2)]<-gsub("^t", "time", names(X)[-c(1:2)])
  
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each 
#  variable for each activity and each subject. 
  
  Z <- aggregate(. ~ subject + activity, X, mean)
  Z <- Z[order(Z$subject,Z$activity),]
  