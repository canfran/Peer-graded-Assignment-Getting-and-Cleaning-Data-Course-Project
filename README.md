# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project

Endorsed in Github Repo the following files: 

* run_analysis.R #script including all the requirements required in the assignment.

* codebook.md #including description for each variable utilized in the script.

* also attached "tidydata.txt" as the script´s output according assignment´s requirements. 


run_analysis.R works as follows: 

0- download the .zip file which contents all the Samsung experiment´ data files, creating a dir "./data" taking as root the present workplace dir, and unzip the .zip file and read all the files, creating the related variables for working within the script. 

1- Merges the training and the test sets to create one data set using rbind() functio (#1st part of assignment)

2- Extracts only the measurements on the mean and standard deviation for each measurement. For doing so, builds a regular expression for selecting only the names including mean() or std() (#2nd part of assignment)

3- Uses descriptive activity names to name the activities in the data set. First, creates function, subs(), to make multiple sub(), and then, applying subs() to merged datasets (measurements, labels, and subjects of the experiment) (#3rd part of assigment)

4- Appropriately labels the data set with descriptive variable names. Doing the following names´ transformations: "Acc" by "Accelerometer", "Gyro" by "Gyroscope", "Mag" by "Magnitude", "f" by "frequency", "t" by "time" (#4th part of assignment)
  
  
5- From the data set in step 4, creates a second, independent tidy data set with the average of each 
variable for each activity and each subject. Using function aggregate() (#5th and last part of assigment)
