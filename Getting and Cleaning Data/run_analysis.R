#######     Download File
fileUrl <-
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Dataset.zip")

# Unzip File
unzip(zipfile = "./Dataset.zip")

list.files("./UCI HAR Dataset", recursive = TRUE)
################## Reading All files

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table('./UCI HAR Dataset/features.txt')
alabels = read.table('./UCI HAR Dataset/activity_labels.txt')

#############    1 Merge files
m1 <- rbind(xtrain, xtest)
m2 <- rbind(ytrain, ytest)
m3 <- rbind(strain, stest)
fulldata <- cbind(m1, m2, m3)
colnames(fulldata) <-
        c(as.character(features$V2), "subject", "activity")

############################# 2 Extract Data
subfeatures <-
        c(as.character(features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]), "subject", "activity")

############################### 3 names

finaldata <- subset(fulldata, select = subfeatures)

############################### 4 descriptive variable names
finaldata$activity <-
        factor(finaldata$activity, levels = alabels[, 1], labels = alabels[, 2])
finaldata$subject <- as.factor(finaldata$subject)

############################### 5 wite file
tidydata <- aggregate(. ~ subject + activity, finaldata, mean)

write.table(tidydata, "tidydata.txt", row.name = FALSE)
