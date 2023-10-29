# Data-Cleaning-LB
This assignmemt based on the original data is from from the Human Activity Recognition Using 
 Smartphones Dataset Version 1.0
link to the original data:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Data Layout and description

  ## Analysis performed by the run_analysis.R script
  
  The script creates a function named run_analysis that receives a parameter named directory that is used to set the correct path of all the files needed.
  
   Then it reads the activity_labels.txt file and stores it in a dataframe
   It also reads the features.txt file and stores it in another dataframe
  1. I also read the test files X_test.txt and y_test.txt and places them in their own dataframes
  2.  After that I read the subject_test.txt file into an additional dataframe
   
  3. Then I take the second column of the activity label dataframe and turn it into factors for the test label set data. This matches the test labels with their full activity description.
   
  4. I used the subject data and merge it with the main data set (read from the X_test.txt file) into a new dataframe then i added the activity and description values as the first columns of the data frame
  5. And finally I added and additional column named "set_type" with constant value of "test" to all observations of the resulting merged test dataframe
  
  I repeat steps 1 - 5 for the train data set.
  
  I merged the train and test data set into a bigger datframe
  
  Then I filter the columns set_type,activity,subject and all columns that calculate the mean and standard deviation from all the variables calculated during the experiment into a final data frame for the first tidy data set. Then I write the results to a file named assgn4_tidy_data1.csv.
  For the second tidy data set I filter the activiy, subject and mean related variables from the first tidy data set into a the second tidy data set dataframe and I write it to a file named assgn4_tidy_data2.csv
  
