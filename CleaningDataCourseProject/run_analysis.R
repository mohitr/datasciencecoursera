# read features
features <- read.csv("features.txt", sep=" ", header=FALSE)
features <- as.character(features[,2])

# read activity labels
activity_name <- read.csv("activity_labels.txt", sep=" ", header=FALSE)
colnames(activity_name) <- c("activity_id", "activity_name")

# reading test data
test_x <- read.csv("test/X_test.txt", sep=" ", header=FALSE)
test_y <- read.csv("test/y_test.txt", header=FALSE)
test_subject <- read.csv("test/subject_test.txt", header=FALSE)

# reading training data
train_x <- read.csv("train/X_train.txt", sep=" ", header=FALSE)
train_y <- read.csv("train/y_train.txt", header=FALSE)
train_subject <- read.csv("train/subject_train.txt", header=FALSE)

combined_x <- rbind(train_x, test_x)
combined_y <- rbind(train_y, test_y)
combined_subject <- rbind(train_subject, test_subject)

# assign names to features
colnames(combined_x) <- features
colnames(combined_y) <- c("activity_id")
colnames(combined_subject) <- c("subject_id")

# merge activity labels and values
labelled_combined_y <- merge(combined_y, activity_name)

# mean and std features
mean_std_features <- regexpr("mean", features) != -1 | regexpr("std", features) != -1
combined_x <- combined_x[, which(mean_std_features)]

# adding activity_name and subject_id to same data set
combined_x <- cbind(combined_subject, labelled_combined_y$activity_name, combined_x )

# aggregating based on subject_id and activity_name
aggregate_data <- aggregate(combined_x[, 3:ncol(combined_x)], by=list(combined_x[['subject_id']], combined_x[['labelled_combined_y$activity_name']]), FUN=mean)

# writing text file
write.csv(aggregate_data, "tidy_data.txt")