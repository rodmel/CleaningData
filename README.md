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


Please refer to the document **CodeBook.md** for the structure and definition of the `averages.txt` and `mergedset.txt` data sets.


## **run_analysis.R** script
### How the data are extracted and merged

* **PREPARE THE VARIABLE NAMES**

Each record of the *test* and *training* data sets has 561 variables of smartphone readings. The script will only need to extract those readings with mean and standard deviation variables. The complete list of variables are stored in `features.txt` file. The script will load into the data set the 561 variable names into `features`, then will add a new column called `features$varname` with the corrected variable names. Variable names are corrected by removing non-alphanumeric character, remove redundant words, and add underscores for some parts of the name to make it more readable and program friendly. 

From the `features` data set, it will extract proper variable names selecting only those with mean (`mean()`) and standard deviation (`std()`) within the original variable names. In this case, out of the 561 only 66 variables are selected which are stored in vector called **`measures`**.  


* **Combine the Test Data Sets**

Combine the three **Test Data Sets** (`x_test.txt`, `y_test.txt` and `subject_test.txt` into one dataset.
First load the `x_test.txt` temporarily (into `xtest`) then read extract into another temporary object selecting only the 66 variables (into `testsubset`).
For `y_test.txt`, it needs to be merged with `activity_labels.txt (actlabel)` in order to get the description of the activity. When loading the `ytest.txt`, a sequence number is explicitly added in order to maintain the sequence of the record when merging it with labels. The mered `ytest` with label is store in `testactivity`.

Finally, combine into the data frame the `subject_test`, `testactivity`, `settype` (with a value of `'test'`, and the  `testsubset`. (The `settype` variable column is added to indicate record from test data set).

The resulting combined data frame is stored temporarily to data frame `testdata`

* **Combine the Train Data Set** 

Combining the Train Data Set is also very similar to Test Data Sets except for the `settype` value of `train`. 
The resulting combined train data is stored in data frame called **`mergedset`**.

* **Append the Test Data into Training Data sets**

After creating the Train Data Set into `mergedset` data frame, append to it the `testdata`.
At this point, the end result of `mergedset` is the combined and merged means and standard deviations of training and test data sets. This data frame is written as an output file with name **`mergedset.txt'**.

* **Generate the Summarized Average Data Sets**

Finally, generate a separate data set with the average of each variable as group by subject and each activity.
The dataset in the script that holds this averages is called **`averages`** and it is generated as an output of the script with the file named **averages.txt**.

