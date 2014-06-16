CodeBook for **run_analysis.R** script
===============================


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


### Structure of the output file *averages.txt*

Variable Names:

  1. subject
      - integer - an identifier of the subject who performed the activity, ranges 1-30
  2. activity 
      - a character factor that describes the name of the activity. It has six factor levels with the following values: `LAYING`, `SITTING`, `STANDING` , `WALKING` , `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`

    
        The succeeding variables are all numeric and have the following convention:
        
        *   **t_** - denotes time domain
        *   **f_** - denotes frequency domain
        *   **bodyacc** - body acceleration signal in standard gravity unit 'g'
        *   **gravityacc** - gravity acceleration in standard gravity unit 'g'
        *   **bodygyro** - angular velocity vector measured by gyroscope in radians/second unit
        *   **jerk** - jerk signal
        *   **mag** - magnitude
        *   **mean** - mean value
        *   **std** - standard deviation
        *   **_x , _y, and _z** - denotes axial signals in x-axis, y-axis and z-axis respectively 

  3. t_bodyacc_mean_x
  4. t_bodyacc_mean_y
  5. t_bodyacc_mean_z
  6. t_bodyacc_std_x
  7. t_bodyacc_std_y
  8. t_bodyacc_std_z
  9. t_gravityacc_mean_x
  10. t_gravityacc_mean_y
  11. t_gravityacc_mean_z
  12. t_gravityacc_std_x
  13. t_gravityacc_std_y
  14. t_gravityacc_std_z
  15. t_bodyaccjerk_mean_x
  16. t_bodyaccjerk_mean_y
  17. t_bodyaccjerk_mean_z
  18. t_bodyaccjerk_std_x
  19. t_bodyaccjerk_std_y
  20. t_bodyaccjerk_std_z
  21. t_bodygyro_mean_x
  22. t_bodygyro_mean_y
  23. t_bodygyro_mean_z
  24. t_bodygyro_std_x
  25. t_bodygyro_std_y
  26. t_bodygyro_std_z
  27. t_bodygyrojerk_mean_x
  28. t_bodygyrojerk_mean_y
  29. t_bodygyrojerk_mean_z
  30. t_bodygyrojerk_std_x
  31. t_bodygyrojerk_std_y
  32. t_bodygyrojerk_std_z
  33. t_bodyaccmag_mean
  34. t_bodyaccmag_std
  35. t_gravityaccmag_mean
  36. t_gravityaccmag_std
  37. t_bodyaccjerkmag_mean
  38. t_bodyaccjerkmag_std
  39. t_bodygyromag_mean
  40. t_bodygyromag_std
  41. t_bodygyrojerkmag_mean
  42. t_bodygyrojerkmag_std
  43. f_bodyacc_mean_x
  44. f_bodyacc_mean_y
  45. f_bodyacc_mean_z
  46. f_bodyacc_std_x
  47. f_bodyacc_std_y
  48. f_bodyacc_std_z
  49. f_bodyaccjerk_mean_x
  50. f_bodyaccjerk_mean_y
  51. f_bodyaccjerk_mean_z
  52. f_bodyaccjerk_std_x
  53. f_bodyaccjerk_std_y
  54. f_bodyaccjerk_std_z
  55. f_bodygyro_mean_x
  56. f_bodygyro_mean_y
  57. f_bodygyro_mean_z
  58. f_bodygyro_std_x
  59. f_bodygyro_std_y
  60. f_bodygyro_std_z
  61. f_bodyaccmag_mean
  62. f_bodyaccmag_std
  63. f_bodyaccjerkmag_mean
  64. f_bodyaccjerkmag_std
  65. f_bodygyromag_mean
  66. f_bodygyromag_std
  67. f_bodygyrojerkmag_mean
  68. f_bodygyrojerkmag_std



### Structure of the optional output file *mergeset.txt*

Variable Names of the **mergeset.txt** is the same as in *averages.txt* except for additional variable called **settype**. It contains a 2 level factor with values "test" or "train" to determine test/train records. This variable is not used when generating *averages.txt* but included only in case it is needed in the future analyses.
  1. subject
  2. activity
  3. **settype**
  4. time_bodyacc_mean_xaxis
  5. time_bodyacc_mean_yaxis
  6. time_bodyacc_mean_zaxis
  7. time_bodyacc_std_xaxis
  8. time_bodyacc_std_yaxis
  9. time_bodyacc_std_zaxis
  10. time_gravityacc_mean_xaxis
  11. time_gravityacc_mean_yaxis
  12. time_gravityacc_mean_zaxis
  13. time_gravityacc_std_xaxis
  14. time_gravityacc_std_yaxis
  15. time_gravityacc_std_zaxis
  16. time_bodyaccjerk_mean_xaxis
  17. time_bodyaccjerk_mean_yaxis
  18. time_bodyaccjerk_mean_zaxis
  19. time_bodyaccjerk_std_xaxis
  20. time_bodyaccjerk_std_yaxis
  21. time_bodyaccjerk_std_zaxis
  22. time_bodygyro_mean_xaxis
  23. time_bodygyro_mean_yaxis
  24. time_bodygyro_mean_zaxis
  25. time_bodygyro_std_xaxis
  26. time_bodygyro_std_yaxis
  27. time_bodygyro_std_zaxis
  28. time_bodygyrojerk_mean_xaxis
  29. time_bodygyrojerk_mean_yaxis
  30. time_bodygyrojerk_mean_zaxis
  31. time_bodygyrojerk_std_xaxis
  32. time_bodygyrojerk_std_yaxis
  33. time_bodygyrojerk_std_zaxis
  34. time_bodyaccmag_mean
  35. time_bodyaccmag_std
  36. time_gravityaccmag_mean
  37. time_gravityaccmag_std
  38. time_bodyaccjerkmag_mean
  39. time_bodyaccjerkmag_std
  40. time_bodygyromag_mean
  41. time_bodygyromag_std
  42. time_bodygyrojerkmag_mean
  43. time_bodygyrojerkmag_std
  44. freq_bodyacc_mean_xaxis
  45. freq_bodyacc_mean_yaxis
  46. freq_bodyacc_mean_zaxis
  47. freq_bodyacc_std_xaxis
  48. freq_bodyacc_std_yaxis
  49. freq_bodyacc_std_zaxis
  50. freq_bodyaccjerk_mean_xaxis
  51. freq_bodyaccjerk_mean_yaxis
  52. freq_bodyaccjerk_mean_zaxis
  53. freq_bodyaccjerk_std_xaxis
  54. freq_bodyaccjerk_std_yaxis
  55. freq_bodyaccjerk_std_zaxis
  56. freq_bodygyro_mean_xaxis
  57. freq_bodygyro_mean_yaxis
  58. freq_bodygyro_mean_zaxis
  59. freq_bodygyro_std_xaxis
  60. freq_bodygyro_std_yaxis
  61. freq_bodygyro_std_zaxis
  62. freq_bodyaccmag_mean
  63. freq_bodyaccmag_std
  64. freq_bodyaccjerkmag_mean
  65. freq_bodyaccjerkmag_std
  66. freq_bodygyromag_mean
  67. freq_bodygyromag_std
  68. freq_bodygyrojerkmag_mean
  69. freq_bodygyrojerkmag_std

 

