

## Read into memory both the training and the test sets

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("UCI HAR Dataset/features.txt")[,2]
#Extracts only the mean and the standard deviation for each measurement
features_mean_sd <- grepl("mean|std", features)

## Processing of TEST DATA 

        #Load test data
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


        #rename X_test with the right feature names
        names(X_test) = features
        names(subject_test) = "Subject.ID"
        # selects only the columns with mean and sd variables
        X_test <- X_test[,features_mean_sd]
        
        Y_test[,2] = activity_labels[Y_test[,1]]
        names(Y_test) = c("Activity.ID", "Activity.Name")
        
        #  Column bind together the subject ID, the X table and the Y table
        
        test_data <- cbind (subject_test, X_test, Y_test)

## Processing of the TRAIN DATA
        
        #Load train data
        X_train <- read.table("UCI HAR Dataset/train/x_train.txt")
        Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        
        
        #rename X_test with the right feature names
        names(X_train) = features
        names(subject_train) = "Subject.ID"
        # selects only the columns with mean and sd variables
        X_train <- X_train[,features_mean_sd]
        Y_train[,2] = activity_labels[Y_train[,1]]
        names(Y_train) = c("Activity.ID", "Activity.Name")
        
        #  Column bind together the subject ID, the X table and the Y table
        train_data <- cbind (subject_train, X_train, Y_train)
        

#Merge the test and the train data
merged_data <- rbind(test_data, train_data)

#aggregate by subject.ID and Activity.Name
aggregated_data <- aggregate(. ~ Subject.ID + Activity.Name, data = merged_data, FUN = mean)

#write out final tidy data set from aggregated data
write.table(aggregated_data, file = "./tidy_mean_data.txt", row.names = FALSE)
