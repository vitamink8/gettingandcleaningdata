

library(reshape2)
# Step 1a. Read all data files in R
subtrain <- read.table("train/subject_train.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subtest <- read.table("test/subject_test.txt")
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
features <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt")

# Step 1b: Get the column (feature) names
featureNames <- features$V2

# Step 2a: Extract mean and standard deviation indices
meanSTDindices <- grep("mean\\(\\)|std\\(\\)", featureNames)

# Step 2b: Merge all read data into one big dataset
xMerged <- rbind(xtrain, xtest)
xMerged <- xMerged[,meanSTDindices] #subset by above indices
yMerged <- rbind(ytrain, ytest)
subMerged <- rbind(subtrain, subtest)
allMerged <- cbind(xMerged, yMerged, subMerged)

rm(xtrain, xtest, ytrain, ytest, subtrain, subtest) #cleanup

# Steps 3/4a: Set descriptive variable names
subFeatureNames <- as.character(featureNames[meanSTDindices])
names(allMerged) <- c(subFeatureNames, "Activity", "Subject")

# Steps 3/4b: Apply descriptive activity names
allMerged$Activity <- factor(allMerged$Activity, levels = 1:6, 
                    labels = activityLabels$V2)

# Step 5: Create second tidy data set with average
# of each variable for each activity and each subject
melted <- melt(allMerged, id.vars = c("Activity", "Subject"),
               measure.vars = featureNames[meanSTDindices])
finalData <- dcast(melted, formula = 
                           Subject + Activity ~ variable, mean)
write.table(finalData, "tidydata.txt", sep = ",", row.names=FALSE)