==================================================================
Peer-graded Assignment: Getting and Cleaning Data Course Project
==================================================================
canfran@gmail.com
==================================================================

CODEBOOK.MD

The following descriptions come up according to the squence of appareance in the script: 

-----------------------------
INPUT Data sets to the Script
-----------------------------
X_test <- dataset including measurements for testing part of dataset (potentially for machine learning design)
X_train <- dataset including measurements for training part of dataset (potentially for machine learning design)
y_test <- dataset including labels (1:6) of the type of activity (walking..) for testing part of dataset
y_train <- dataset including labels for training part of dataset
subject_train <- dataset including subjects (1:30) who perform the experiment for testing part of dataset
subject_test <- dataset including subjects for training part of dataset
activity_labels <- dataset including the 6 types of activities corresponding to the ones enumerated in y variables
features <- dataset including the 561 different features measure in the trail

-------------------------------
WORKING Data sets and Variables in the Script
-------------------------------
X = X-test + X_train
y = y_test + y_train
subject =  subject_test + subject_train
re =  regular expressions to select mean() ad std() features as required in the project
features1 = features selection as required, as a result of using grep() and above regular expression "re"
X1 = X truncated given features1 (selection only the 68 features out of 561)

----------------------------------------
OUTPUT Data sets generated by the Script
----------------------------------------

Z = tidy dataset as the final result of the script
