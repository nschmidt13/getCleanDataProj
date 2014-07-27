run_analysis <- function(){
##read in features which are the heading names for the X_test.txt file
features <- read.table("./UCI HAR Dataset/features.txt", sep="")
features <- features$V2

##read in the X_test fie and set the colname using the feature vector
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test) <- features

##read in the y_test fie
activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(activity) <- "activity"

##read in the subject fie
test.subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(test.subjects) <- "subjects"

##test data merged into tiny dataset
test.data <- cbind2(activity, X_test)
test.data <- cbind2(test.subjects, test.data)



##read in the X_train fie and set the colname using the feature vector
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train) <- features

##read in the y_train fie
activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(activity) <- "activity"

##read in the subject fie
train.subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(train.subjects) <- "subjects"

##train data merged into tidy dataset
train.data <- cbind2(activity, X_train)
train.data <- cbind2(train.subjects, train.data)

##rbind the test and train datasets into one large tidy dataset
data <- rbind2(test.data, train.data)

##reaplace the activity with readable values
data$activity[data$activity == "1"] <- "Walking"
data$activity[data$activity == "2"] <- "Walking_Upstairs"
data$activity[data$activity == "3"] <- "Walking_Downstairs"
data$activity[data$activity == "4"] <- "Sitting"
data$activity[data$activity == "5"] <- "Standing"
data$activity[data$activity == "6"] <- "Laying"

##remove id's and activity data
data.only <- data[, 3:563]

##caclulate mean for each variable and put data in data.summary
data.summary <- apply(data.only, 2, mean)

##create sd for each variable and add column to data.summary
data.summary <- cbind2(data.summary, apply(data.only, 2, sd))

##create data.summary column names
data.summary <- data.frame(data.summary)
names(data.summary) <- c("mean", "sd")

##create summary.aggregate by activity and subject
summary.aggregate <- aggregate(data, by=list(data$activity, data$subjects), FUN=mean, na.rm=TRUE)

##write data.summary and summary.aggregate out to files
write.table(data.summary, file="./dataSummary.txt")
write.table(summary.aggregate, file="./summaryAggregate.txt")
}


