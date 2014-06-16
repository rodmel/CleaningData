CleaningData
============

Getting and Cleaning Data 


### Introduction

An experiment was conducted regarding the recognition of the human activity using the smart phones. The experiment is carried out by 30 volunters wearing smartphones on their waist while performing daily living activities. From this experiment, a `Human Activity Recognition Database` has been built from from the recordings of accelerometer and gyroscope of smartphones. The database has two types of data set: the test data and training data.

This repository contains *"R" scripts* that reads the `Human Activity Recognition Database` merging both test and training data, partially extracts some variables of the readings (particularly means and standard deviation only), renames variable names into more readable format and outputs a separate dataset that gives the average of each variable for each activity and each subject. 

For more information on this experiment and how the database was built, please refer to the following link: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 


### Data Set Information

This dataset extracts information from the ‘Human Activity Recognition Database’. It merges the training and test sets and extracts only the mean and standard deviation for each measurement.

A second data set is also created with the average of each variable for each activity and each subject.


 
### Source Data Sets:

The source database has the following files and subfolders:
* `activity_labels.txt` – activity ID and description of activity
* `features.txt` – names of the 561 variables correspond to data sets

Training Data Sets:
* `train/x_train.txt` – training set with 561 variables
* `train/y_train.txt` – the activity ID for each training observation
* `train/subject_train.txt` – the subject ID who performed the activity for each training observation

Test Data Sets:
* `test/x_test.txt` – test set with 561 variables
* `test/y_test.txt` – the activity ID for each test observation
* `test/subject_test.txt` – the subject ID who performed the activity for each test observation



### Output Data Sets
This repository contains R script file named **`run_analysis.R`**. When the script is ran in the same working directory where the `Human Activity Recognition Database` is stored, it will generate two output data:
* **`averages.txt`** -- this file contains the average for each variable for each activity for each subject.
* **`mergedset.txt`** -- this is the optional file to show the main data source of the **`aveages.txt`** to analyze further how each average in `averages.txt` is obtained. This file contains the merged **training** and **test** data sets of `Human Activity Recognition Database` with various mean and standard deviation readings. It also contains a variable called `settype` to identify records from test set and training set.


### CodeBook

For more information on how the data are extracted and how the cleanup is peformed as well as the structure of the output file, Please refer to the document [**CodeBook.md**](https://github.com/rodmel/CleaningData/blob/master/CodeBook.md).


