## run_analysis.R
##    This script reads data from "Human Activity Recognition Using Smartphones Dataset"
##  It creates a Tidy-Data based on training and test datasets
##    This an assignment pertaining to Data Specialization course for the Data Cleaning section
##  Created October 28th 2023

run_analysis<- function(directory = "UCI HAR Dataset") {
	currpath<- getwd()
	setwd(directory)
	
	## read activity labels
	act_levls<-read.table("activity_labels.txt")
	
	feats<-read.table("features.txt")
	
	## Extracting test set data

	y_test_lbls<-read.table("test/y_test.txt")
	x_test_set<-read.table("test/X_test.txt")
	
	subject<-read.table("test/subject_test.txt")
	
  ## adding features as column names to data set
	
  names(x_test_set)<-feats$V2
	
	## replace data labels with activity names
	y_test_lbls<-factor(y_test_lbls$V1,labels = act_levls$V2)
	## convert label factor to character vector in order to insert it into 
	## original data set
	activity<-as.character(y_test_lbls)

	x_test_set<-cbind(subject=subject$V1,x_test_set)	
	
	##insert activity labels to data set
	x_test_set <-cbind(activity,x_test_set)
	## adding set type label
	x_test_set<-cbind(set_type = "test",x_test_set)
	
	
	
	## Extracting train set data
	
	y_train_lbls<-read.table("train/y_train.txt")
	x_train_set<-read.table("train/X_train.txt")
	
  ## adding features as column names to data set
	
  names(x_train_set)<-feats$V2
	## replace data labels with acivity names
	y_train_lbls<-factor(y_train_lbls$V1,labels = act_levls$V2)
	## convert label factor to character vector in order to insert it into 
	## original data set
	activity<-as.character(y_train_lbls)
	
	## add subject label
	subject<-read.table("train/subject_train.txt")
		
	x_train_set<-cbind(subject=subject$V1,x_train_set)	
	
	##insert activity labels to data set
	x_train_set <-cbind(activity,x_train_set)
	## adding set type label
	x_train_set<-cbind(set_type = "train",x_train_set)
	
	## merging dataframes
	full_data_set<-rbind(x_test_set,x_train_set)


	## Extract mean and standard deviation for each measurement
	tidy_data_set1<- full_data_set %>% select(contains(c("set_type","activity","subject","mean","std")))
  ## Extract Second Tidy data set
	
	tidy_data_set2<-tidy_data_set1 %>% select(contains(c("activity","subject","mean")))
  ## writing tidy data sets to files
	write.csv(tidy_data_set1,"TidyData files/assgn4_tidy_data1.csv")
	write.csv(tidy_data_set2,"TidyData files/assgn4_tidy_data2.csv")
	setwd(currpath)
}
