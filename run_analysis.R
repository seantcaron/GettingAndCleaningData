# Read in the activity labels
setwd(file.path("c:", "Users", "scaron", "Desktop", "Coursera_Getting_and_Cleaning_Data", "final"))
activity_labels <- read.table("activity_labels.TXT", header=FALSE, col.names=c("activity.id", "activity"))

# Read in the test data
setwd(file.path("c:", "Users", "scaron", "Desktop", "Coursera_Getting_and_Cleaning_Data", "final", "test"))
x_test <- read.table("X_test.TXT", header=FALSE)
activity_test <- read.table("y_test.TXT", header=FALSE)
subject_test <- read.table("subject_test.TXT", header=FALSE)

# Extract all the means and standard deviations from the test data
testdata <- data.frame(subject.id=subject_test$V1,
                       activity.id=activity_test$V1,
                       tBodyAccMag.mean=x_test$V201,
                       tBodyAccMag.std=x_test$V202,
                       tGravityAccMag.mean = x_test$V214,
                       tGravityAccMag.std = x_test$V215,
                       tBodyAccJerkMag.mean = x_test$V227,
                       tBodyAccJerkMag.std = x_test$V228,
                       tBodyGyroMag.mean = x_test$V240,
                       tBodyGyroMag.std = x_test$V241,
                       tBodyGyroJerkMag.mean = x_test$V253,
                       tBodyGyroJerkMag.std = x_test$V254,
                       fBodyAcc.mean.X = x_test$V266,
                       fBodyAcc.mean.Y = x_test$V267,
                       fBodyAcc.mean.Z = x_test$V268,
                       fBodyAcc.std.X = x_test$V269,
                       fBodyAcc.std.Y = x_test$V270,
                       fBodyAcc.std.Z = x_test$V271,
                       fBodyAccJerk.mean.X = x_test$V345,
                       fBodyAccJerk.mean.Y = x_test$V346,
                       fBodyAccJerk.mean.Z = x_test$V347,
                       fBodyAccJerk.std.X = x_test$V348,
                       fBodyAccJerk.std.Y = x_test$V349,
                       fBodyAccJerk.std.Z = x_test$V350,
                       fBodyGyro.mean.X = x_test$V424,
                       fBodyGyro.mean.Y = x_test$V425,
                       fBodyGyro.mean.Z = x_test$V426,
                       fBodyGyro.std.X = x_test$V427,
                       fBodyGyro.std.Y = x_test$V428,
                       fBodyGyro.std.Z = x_test$V429,
                       fBodyAccMag.mean = x_test$V503,
                       fBodyAccMag.std = x_test$V504,
                       fBodyBodyAccJerkMag.mean = x_test$V516,
                       fBodyBodyAccJerkMag.std = x_test$V517,
                       fBodyBodyGyroMag.mean = x_test$V529,
                       fBodyBodyGyroMag.std = x_test$V530,
                       fBodyBodyGyroJerkMag.mean = x_test$V542,
                       fBodyBodyGyroJerkMag.std = x_test$V543)

# Label the activities
labeled_testdata <- merge(testdata, activity_labels, by = "activity.id", sort=FALSE)

# Read in the training data
setwd(file.path("c:", "Users", "scaron", "Desktop", "Coursera_Getting_and_Cleaning_Data", "final", "train"))
x_train <- read.table("X_train.TXT", header=FALSE)
activity_train<- read.table("y_train.TXT", header=FALSE)
subject_train <- read.table("subject_train.TXT", header=FALSE)

# Extract all the means and standard deviations from the training data
traindata <- data.frame(subject.id = subject_train$V1,
                        activity.id = activity_train$V1,
                        tBodyAccMag.mean=x_train$V201,
                        tBodyAccMag.std=x_train$V202,
                        tGravityAccMag.mean = x_train$V214,
                        tGravityAccMag.std = x_train$V215,
                        tBodyAccJerkMag.mean = x_train$V227,
                        tBodyAccJerkMag.std = x_train$V228,
                        tBodyGyroMag.mean = x_train$V240,
                        tBodyGyroMag.std = x_train$V241,
                        tBodyGyroJerkMag.mean = x_train$V253,
                        tBodyGyroJerkMag.std = x_train$V254,
                        fBodyAcc.mean.X = x_train$V266,
                        fBodyAcc.mean.Y = x_train$V267,
                        fBodyAcc.mean.Z = x_train$V268,
                        fBodyAcc.std.X = x_train$V269,
                        fBodyAcc.std.Y = x_train$V270,
                        fBodyAcc.std.Z = x_train$V271,
                        fBodyAccJerk.mean.X = x_train$V345,
                        fBodyAccJerk.mean.Y = x_train$V346,
                        fBodyAccJerk.mean.Z = x_train$V347,
                        fBodyAccJerk.std.X = x_train$V348,
                        fBodyAccJerk.std.Y = x_train$V349,
                        fBodyAccJerk.std.Z = x_train$V350,
                        fBodyGyro.mean.X = x_train$V424,
                        fBodyGyro.mean.Y = x_train$V425,
                        fBodyGyro.mean.Z = x_train$V426,
                        fBodyGyro.std.X = x_train$V427,
                        fBodyGyro.std.Y = x_train$V428,
                        fBodyGyro.std.Z = x_train$V429,
                        fBodyAccMag.mean = x_train$V503,
                        fBodyAccMag.std = x_train$V504,
                        fBodyBodyAccJerkMag.mean = x_train$V516,
                        fBodyBodyAccJerkMag.std = x_train$V517,
                        fBodyBodyGyroMag.mean = x_train$V529,
                        fBodyBodyGyroMag.std = x_train$V530,
                        fBodyBodyGyroJerkMag.mean = x_train$V542,
                        fBodyBodyGyroJerkMag.std = x_train$V543)

# Label the activities
labeled_traindata <- merge(traindata, activity_labels, by = "activity.id", sort=FALSE)

# Concatenate the test data and the training data
ds <- rbind(labeled_testdata, labeled_traindata)

# Remove now redundant column activity.id
ds2 <- ds[ , -which(names(ds) %in% c("activity.id"))]

library(reshape2)

# Generate the final output dataset
tt <- melt(ds2, id.vars = c("subject.id", "activity"))
op <- dcast(tt, subject.id + activity ~ variable, mean)
write.table(op, file="finalProjectOutput.txt", row.name=FALSE)
