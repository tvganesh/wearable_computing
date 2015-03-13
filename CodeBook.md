# Displaying the average of the measurements performed on 30 subjects for 6 activities

This project displays the average values of measures taken on 30 subjects for 6 activities

Subject : 
         Numeric : 1 to 30
		 
Activity:  ( 6 values)
            LAYING
			SITTING
			STANDING
			WALKING
			WALKING_DOWNSTAIRS
			WALKING_UPSTAIRS
			
Measurements 79 values
             tBodyAccMean..X
             tBodyAccMean..Y
			 ...
			 ....
			 
			 
Implementation:
                This project uses dplyr package
				
	        1. Create a folder 'data' to store the unzipped contents
			2. Download the zipped file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD" 
			3. Unzip this file into the folder data
			4. Change directory to the test folder
			5. Read the following files from the test folder into the variables shown on the left side
					a. X_test <= X_test.txt
					b. y_test <= y_test.txt
					c. subject_test <= subject_test.txt
			6. Change directory to the train folder
			7. Read the following files from the train folder into the variables shown on the left side
					a. X_train <= X_train.txt
					b. y_train <= y_train.txt
					c. subject_train <= subject_train.txt
			8 Move up one folder
			9. Read features <- features.txt. This is the all the measurements carried out 
			10. Subset the 2nd column and then get the names in this
			11.  The measurements are then obtained by remove the '-' character in the the measurements
			     For e.g. tBodyAcc-mean()-X us changed to tBodyAccmean()X
				 This was done to to identify all measurements that  contain 'mean' or 'std' in them
				 measurements <- obtained by removing the '-' character from the 2nd column of features
			12. Merge X_test and X_train by doing a row bind and store in X_total
			13. Merge y_test and y_train into y_total
			14. Merge test_subjects and train_subjects into subjects
			15. Read the activity labels 
			      a. activity <- activity_labels.txt
		    16. The y_total has the numeric value of the activity labels
			17. Find all rows which correspond to each numeric value of activity and substitute the  labels     
			      y_total[a,] = as.character(label[i])
				  
			18. Create a vector with all columns with the string 'mean and 'std'
			      m <= columns with the string 'std'
				  n <= columns with the string 'mean'
			19. Combine the vectors in a single vector '0'
			20. Subset only these columns from the total numbwr of columns
			        X_measures <= X_total[o,]
			21. Merge the subjects and the labeled activity columns
			22. Merge these 2 columns to the X_measures
			23. Call dplyr group by subject, activity and summarise_each by calling the mean for each column
			24. Move up the directory tree
			25. Call write table to write the results in mean_measures.txt
			26. Verify the output by read the table and calling View
				  
			