## README.md - This file provides the steps to run the code
The code for this project is self-contained
	1. The R code creates a folder 'data'
	2. The code points to the URL where the data resides and downloads the zip file
	3. This is then unzipped
	4. The test and training samples are merged
	5. The features names for the columns and the activity labels are added
	6. The subjects and activity columns are added
	7. All columns with the string 'mean' & 'std' are selected 
	8. Finally the rows are grouped by subject, activity and the mean for each column is computed
	9. The results are written to a text file  mean_measures.txt
	10. The results are then validated by reading this data and then calling View on this data.