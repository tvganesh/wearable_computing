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

# Merge the test and training samples. Do a row-wise bind of the test and training samples
X_total <- rbind(X_test,X_train)
y_total <- rbind(y_test,y_train)

#Merge the training and test subjects
subjects <- rbind(test_subject,train_subject)

# Set the colnames with the values of the measurements taken with the different sensors
colnames(X_total) <- measurements

# Read the activity labels 
activity <- read.table("activity_labels.txt")
labels <- activity$V2

# Assign activity labels to activities
for(i in 1:6) {
  a <- y_total == i
  y_total[a,] = as.character(labels[i])
}

# Create a vector of all columns with "mean" and "std" in them
m <- grep("mean",measurements,perl=FALSE)
n <- grep("std",measurements,perl=FALSE)

# Combine the 2 vectors of all columns into a single vector
o <- c(m,n)

# Subset these columns from the entire data set. These columns deal with all measurements which have 'mean' or 'std' in them
X_measures <- X_total[,o]

# Add the subject and activity columns to the dataset
s <- cbind(subjects,y_total)
colnames(s) <- c("subject","activity")
X_measures <- cbind(s,X_measures)

# Compute the mean measures using the dplyr summarise_each after group'ing by subject & activity
Mean_measures <-X_measures %>% group_by(subject,activity) %>% summarise_each(funs(mean))

# Move up directory and write the output into a file 'mean_measures.txt'
setwd("..\\..")
write.table(Mean_measures,file="mean_measures.txt",row.names=FALSE)

# Read the data
data <- read.table("mean_measures.txt", header = TRUE)

#Display the results
View(data)
}

