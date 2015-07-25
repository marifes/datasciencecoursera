---
title: "Cookbook"
author: "Maria FG"
date: "25 Jul 2015"

---

#CookBook

This cookbook describes the inputs, outputs and transformations performed by the run_analysis.R script on the UCI HAR Dataset.

##Input Data

The scripts assumes that the UCI dataset has been dowloaded and unzipped in the current working directory. Through the unzip process a directory "UCI HAR Dataset" will be automatically created where all the data input files are stored.


##Output Data

The output data is stored in a "tidy_mean_data.txt" file in the current directory.
The file contains the mean of the following variables per Subject.ID and per Activity.Name:
                
tBodyAcc-mean               
tBodyAcc-std               
tGravityAcc-mean            
tGravityAcc-std            
tBodyAccJerk-mean           
tBodyAccJerk-std           
tBodyGyro-mean             
tBodyGyro-std             
tBodyGyroJerk-mean          
tBodyGyroJerk-std         
tBodyAccMag-mean              
tBodyAccMag-std              
tGravityAccMag-mean           
tGravityAccMag-std           
tBodyAccJerkMag-mean          
tBodyAccJerkMag-std          
tBodyGyroMag-mean             
tBodyGyroMag-std             
tBodyGyroJerkMag-mean         
tBodyGyroJerkMag-std         
fBodyAcc-mean               
fBodyAcc-std               
fBodyAcc-meanFreq           
fBodyAccJerk-mean          
fBodyAccJerk-std            
fBodyAccJerk-meanFreq      
fBodyGyro-mean             
fBodyGyro-std             
fBodyGyro-meanFreq          
fBodyAccMag-mean             
fBodyAccMag-std               
fBodyAccMag-meanFreq         
fBodyBodyAccJerkMag-mean      
fBodyBodyAccJerkMag-std      
fBodyBodyAccJerkMag-meanFreq  
fBodyBodyGyroMag-mean        
fBodyBodyGyroMag-std
fBodyBodyGyroMag-meanFreq    
fBodyBodyGyroJerkMag-mean     
fBodyBodyGyroJerkMag-std     
fBodyBodyGyroJerkMag-meanFreq


##Transformations

The script run_analysis.R performs the following transformations:

- Loads the various files with raw data from the UCI dataset
- Creates a smaller dataset by selecting only mean and standard deviation variables
- Merges the three test and three train files into a single data table 
- Applies textual column names where possible
- Computes the mean of the smaller dataset, grouped by subject ID and by Activity.
- Saves this last data set into "./tidy_mean_data.txt"
