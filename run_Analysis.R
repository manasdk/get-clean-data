# read training data
data_train <- read.table('./UCI HAR Dataset/train/X_train.txt', header=FALSE)
data_train_label <- read.table('./UCI HAR Dataset/train/y_train.txt', header=FALSE)
data_train_subject <- read.table('./UCI HAR Dataset/train/subject_train.txt', header=FALSE)
data_train <- cbind(data_train, data_train_label)
data_train <- cbind(data_train, data_train_subject)

# read test data
data_test <- read.table('./UCI HAR Dataset/test/X_test.txt', header=FALSE)
data_test_label <- read.table('./UCI HAR Dataset/test/y_test.txt', header=FALSE)
data_test_subject <- read.table('./UCI HAR Dataset/test/subject_test.txt', header=FALSE)
data_test <- cbind(data_test, data_test_label)
data_test <- cbind(data_test, data_test_subject)

# combine data
data_combine <- rbind(data_train, data_test)

# activity labels
data_activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# data features
data_features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
data_features[,2] <- gsub('-mean', 'Mean', data_features[,2])
data_features[,2] <- gsub('-mean', 'Mean', data_features[,2])
data_features[,2] <- gsub('-std', 'Std', data_features[,2])
data_features[,2] <- gsub('[-()]', '', data_features[,2])

# pick mean, std_dev columns, activity adn subject columns
required_columns <- grep(".*Mean.*|.*Std.*", data_features[,2])
data_features <- data_features[required_columns,]
required_columns <- c(required_columns, 562, 563)
column_names <- tolower(c(data_features$V2, "Activity", "Subject"))

# filter out required data and assign column_names
data_combine <- data_combine[,required_columns]
colnames(data_combine) <- column_names

# assign pretty names for activity labels in data
activity_value = 1
for (activity_label in data_activity_labels$V2) {
  data_combine$activity <- gsub(activity_value, activity_label, data_combine$activity)
  activity_value <- activity_value + 1
}

data_combine$activity <- as.factor(data_combine$activity)
data_combine$subject <- as.factor(data_combine$subject)

# aggregate into the final tidy data set and write to file.
final_tidy_data <- aggregate(data_combine, by=list(activity = data_combine$activity,
                                                   subject = data_combine$subject), 
                             mean)

write.table(final_tidy_data, "final_tidy_data.txt", sep="\t")