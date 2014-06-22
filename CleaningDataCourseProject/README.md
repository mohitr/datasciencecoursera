### Getting and Cleaing Data | Course Project
============

#### Script to generate clean and tidy data.
Assumption: data has been downloaded and current working directory has been set to "~/Downloads/UCI HAR Dataset"

##### Following actions are performed in script 
* read features and activity labels and assign names to them
* read test and training data and merge them
* features which are mean/std has been filtered out
* mean of all features calculated by subject_id and activity_name
* data set is dumped to "tidy_data.txt" in working directory
* attached file 'features.txt' lists down all the variable names present

#### Following are the code book to understand tidy data set
```
Group.1	subject_id
Group.2	activity_name
tBodyAcc-mean()-X	mean of feature 'tBodyAcc-mean()-X' for given 'subject_id' and 'activity_name'
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
...<br>
...<br>
fBodyBodyGyroJerkMag-meanFreq()
```
