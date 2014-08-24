setwd("./UCI HAR Dataset")
features <- (read.table("features.txt", as.is=T)[,2])
activities <- read.table("activity_labels.txt")
activities[,2] <- as.factor(activities[,2])

setwd("./test")
#measurements
test_set <- read.table("X_test.txt")
#subjects
test_subj <- read.table("subject_test.txt")
#activity
test_feat <- read.table("y_test.txt")
#merges activity and subjects with measurements
test_table <- cbind(test_set,test_subj,test_feat)
setwd("../")
setwd("./train")
train_set <- read.table("X_train.txt")
train_subj <- read.table("subject_train.txt")
train_feat <- read.table("y_train.txt")
train_table <- cbind(train_set,train_subj,train_feat)
setwd("../")
#transform subjects column into factor
test_table[,562] <- as.factor(test_table[,562])
train_table[,562] <- as.factor(train_table[,562])
#transform activities column into factor
activities[,2] <- as.factor(activities[,2])
test_table[,563] <- as.factor(test_table[,563])
train_table[,563] <- as.factor(train_table[,563])
levels(test_table[,563]) <- levels(activities[,2])
levels(train_table[,563]) <- levels(activities[,2])
#merges test and train data sets
data_table <- rbind(test_table,train_table)
#names variable names
features[562] <- "subject"
features[563] <- "activity"
names(data_table) <- features
#extracts mean() and std() variables only
matches_mean <- (grep("mean()", names(data_table), fixed=T))
matches_std <- (grep("std()", names(data_table), fixed=T))
ord <- order((c(matches_mean,matches_std)))
matches<-c(matches_mean, matches_std)
matches <- c(matches[ord], 562, 563)
sub_table <- data_table[,matches]
#
aver_table <- aggregate(sub_table[1:66], list(sub_table[,67],sub_table[,68]), mean)
names(aver_table)[1] <- names(sub_table[67])
names(aver_table)[2] <- names(sub_table[68])
write.table(aver_table, file="tiddytable.txt", row.name=F)