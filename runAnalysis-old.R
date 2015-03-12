if(!file.exists("data")) {
  dir.create("data")
}
fileUrl <-   "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD" 
#Download zip with wb flag
download.file(fileUrl, destfile= "./data/dataset.zip",mode="wb")

#Specify the extract folder
unzip("./data/dataset.zip",  exdir = "./data")

# Set the working directory to test
setwd(".\\data\\UCI HAR Dataset\\test\\Inertial Signals\\")

# display files
dir()

#Read test files


body_acc_x_test <- read.table("body_acc_x_test.txt")
body_acc_y_test <- read.table("body_acc_y_test.txt")
body_acc_z_test <- read.table("body_acc_z_test.txt")

body_gyro_x_test <- read.table("body_gyro_x_test.txt")
body_gyro_y_test <- read.table("body_gyro_y_test.txt")
body_gyro_z_test <- read.table("body_gyro_z_test.txt")

total_acc_x_test <- read.table("total_acc_x_test.txt")
total_acc_y_test <- read.table("total_acc_y_test.txt")
total_acc_z_test <- read.table("total_acc_z_test.txt")

setwd("..\\..\\..\\..")
getwd()

#Read train files
# Set the working directory to test

setwd(".\\data\\UCI HAR Dataset\\test\\")

X_test <- read.table("X_test.txt")
y_test  <- read.table("y_test.txt")

setwd("..\\..\\..")
setwd(".\\data\\UCI HAR Dataset\\train\\")
X_train <- read.table("X_train.txt")

y_train  <- read.table("y_train.txt")
