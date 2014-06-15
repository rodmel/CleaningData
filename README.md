CleaningData
============

Getting and Cleaning Data 


### Introduction

An experiment was conducted regarding the recognition of the human activity using the smart phones. A “Human Activity Recognition Database” has been built from this experiment from the recordings of accelerometer and gyroscope of smartphones worn by 30 volunteers performing daily living activities. The database has been partitioned in test data and training data.

For more information on this experiment and how the database was built, please refer to the following link: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 


### Data Set Information

This dataset extracts information from the ‘Human Activity Recognition Database’. It merges the training and test sets and extracts only the mean and standard deviation for each measurement.

A second data set is also created with the average of each variable for each activity and each subject.


 
### How the data are extracted and summarized:

The source database has the following files and subfolders:

‘activity_labels.txt’ – activity ID and description of activity
‘features.txt’ – names of the 561 variables correspond to data sets

Training Data Sets:
‘train/x_train.txt’ – training set with 561 variables
‘train/y_train.txt’ – the activity ID for each training observation
‘train/subject_train.txt’ – the subject ID who performed the activity for each training observation

Test Data Sets:
‘test/x_test.txt’ – test set with 561 variables
‘test/y_test.txt’ – the activity ID for each test observation
‘test/subject_test.txt’ – the subject ID who performed the activity for each test observation


MERGING TEST DATA SETS:
Combine the 3 ‘Test Data Sets’ (x_test.txt, y_test.txt and subject_test.txt’ into one dataset but out of the 561 variables from the x_test.txt, it only extracts 66 variables correspond to the mean and standard deviation for each measurement.

The names of the 561 variables are originally referred from ‘features.txt’ file but in the resulting merged data set, the variable names are slightly revised to remove some redundant words, make it more descriptive, readable and removed some characters that might cause problem in future programming.

A new column called ‘settype’ is also added to indicate what type of data set each record came from. In this case, it has a value of ‘test’ to indicate the records are from ‘test data sets’. This column is optional and included only just in case if there is requirement in the future to analyze separately the test and train data.

Combining the 3 ‘Train Data Sets’ are very similar on how the ‘Test Data Sets’ are combined with the same structure except for the ‘settype’ value of ‘train’.

After combining the ‘Train Data Sets’, the ‘Test Data Set’ is appended afterwards giving the result of the merged Train and Test data sets.


From this merged data, a separate data set is created with the average of each variable for each activity and each subject.


