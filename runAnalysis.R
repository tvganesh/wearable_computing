library(dplyr)

if(!file.exists("data")) {
  dir.create("data")
}

fileUrl <-   "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD" 
#Download zip with wb flag
download.file(fileUrl, destfile= "./data/dataset.zip",mode="wb")

#Specify the extract folder
unzip("./data/dataset.zip",  exdir = "./data")


# display files
dir()


# Set the working directory to test
setwd(".\\data\\UCI HAR Dataset\\test\\")

# Read test files with readings
X_test <- read.table("X_test.txt")
y_test  <- read.table("y_test.txt")
test_subject <- read.table("subject_test.txt")

# Set the working directory to train
setwd("..\\train")

# Read the train files
X_train <- read.table("X_train.txt")
y_train  <- read.table("y_train.txt")
train_subject <- read.table("subject_train.txt")

# Read features file
setwd("..")
features <- read.table("features.txt")
names <- features$V2

#Convert the vector to names
vnames <- as.vector(names)
measurements <- gsub("-","",vnames)

# Do a rowwise binf of the test and training sampls
X_total <- rbind(X_test,X_train)
y_total <- rbind(y_test,y_train)
subjects <- rbind(test_subject,train_subject)

# Set the colnames
colnames(X_total) <- measurements

# Read the activity labels
activity <- read.table("activity_labels.txt")
labels <- activity$V2

# Assign activity labels to activities
for(i in 1:6) {
  a <- y_total == i
  y_total[a,] = as.character(labels[i])
}

# Create a vector of all columns with mean and std in them
m <- grep("mean",measurements,perl=FALSE)
n <- grep("std",measurements,perl=FALSE)

# Combine the 2 vectors of all columns
o <- c(m,n)

# Subset these columns
X_measures <- X_total[,o]

# Add the subject and activity columns
s <- cbind(subjects,y_total)
colnames(s) <- c("subject","activity")
X_measures <- cbind(s,X_measures)

# Compute the mean measures using the dply summarise_each
Mean_measures <-X_measures %>% group_by(subject,activity) %>% summarise_each(funs(mean))

setwd("..\\..")
write.table(Mean_measures,file="mean_measures.txt",row.names=FALSE)


}

