---
title: "Cookbook"
author: "Maria FG"
date: "25 Jul 2015"

---

#CookBook

This cookbook describes the inputs, outputs and transformations performed by the run_analysis.R script on the UCI HAR Dataset.

##Input Data

The scripts assumes that the UCI dataset has been dowloaded and unzipped in the current working directory. Through the unzip process a directory "UCI HAR Dataset" will be automatically created where all the data input files are stored.

Data Set Information (From UCI MAchine Learning Repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


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

Also note that variables are provided for X-Y-Z when applicable.

Activity.Name variables are the following:

LAYING 
SITTING 
STANDING 
WALKING 
WALKING_DOWNSTAIRS 
WALKING_UPSTAIRS

There are 30 Subject.ID divided into test (9) and train (21) datasets. 


##Transformations

The script run_analysis.R performs the following transformations:

- Loads the various files with raw data from the UCI dataset
- Creates a smaller dataset by selecting only mean and standard deviation variables
- Merges the three test and three train files into a single data table 
- Applies textual column names where possible
- Computes the mean of the smaller dataset, grouped by subject ID and by Activity.
- Saves this last data set into "./tidy_mean_data.txt"
