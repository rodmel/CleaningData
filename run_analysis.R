##==========================================##         
## PREPARE THE ACTIVITY AND VARIABLE NAMES  ##
##==========================================##      
  # read the activity label
  actlabel <- read.table(file="activity_labels.txt", header=FALSE,  sep=" ", col.names=c("id","activity"))

  # read the source variable names and create a revised variable name 
  features <- read.table(file="features.txt", header=FALSE, sep=" ", row.names=1,  col.names=c("id","feature"))
    # add a new column (varname) to revise the original variable name 
       # replace the hyphens with underscore for x,y,z axis indication
         features$varname =  gsub("-Z","_z",gsub("-Y","_y", gsub("-X","_x",features$feature)))
       # remove all non-alpha numeric characters (except underscore)  
         features$varname =  gsub("[^a-zA-Z0-9_]","",features$varname)
       # add underscore to "std" and "mean" to make it readable and fix the redundant "BodyBody"
          features$varname = tolower( gsub("std","_std", gsub("mean","_mean" , gsub( "BodyBody","Body",features$varname))))
       # add underscore to "f" and "t" prefixes to make it mre readable 
          features$varname =  gsub( "fbody","f_body", gsub( "tgrav", "t_grav", gsub("tbody","t_body",features$varname)))

  # create a vector list (measures) of varable names to be extracted 
  # basically only those with "mean()" and "std()" in original variable names 
  measures <- features[grep("((mean|std)\\(\\))",features$feature) ,2]

##=============================## 
## EXTRACT AND MERGE TEST SETS ##
##=============================## 

# Load the Test set to "xtest" 
  xtest <- read.table(file="./test/x_test.txt", header=FALSE, col.names=features$varname  )
  # and extract (to testsubset) only those variables as defined in "measures" vector
  testsubset <- xtest[ , measures ]
  rm(xtest)  # tidy up xtest immediately as it is no longer needed

# Load the corresponding Subjects for each Test Set
  subjecttest    <- read.table(file="./test/subject_test.txt", header=FALSE, sep=" ", col.name="subject")

# Load the corresponding activity IDs for each Test set to (ytest)
  ytest <-  read.table(file="./test/y_test.txt", header=FALSE, sep=" ", col.name="activity_id")
  # add a column to save the original sequence of records
  ytest$seq <- seq_along(1:nrow(ytest))

# create a data frame 'testactivity' from 'ytest' data but with new column for description of activity
  testactivity <- merge(ytest, actlabel, by.x="activity_id", by.y="id" , all=TRUE, sort=FALSE)
  rm(ytest)  #tidy up ytest immediately as it is no longer needed

# create the "testdata" data frame by combining the subject, activity and selected measures
  # note: additional factor column 'settype' is added to indicate that data is from test set
  #       created only for possible future use to distinguish test and train data 
  testdata <- data.frame(  subjecttest
                          ,activity=testactivity[ order(testactivity$seq), "activity"] 
                          ,settype=as.factor("test")
                          ,testsubset[ , measures ])
  
  rm(subjecttest,testactivity,testsubset) # tidy up 

##=================================## 
## EXTRACT AND MERGE TRAINING SETS ##
##=================================## 

# Load the Training set to 'xtrain"  
  xtrain <- read.table(file="./train/x_train.txt", header=FALSE, col.names=features$varname  )
  # and extract (to trainsubset) only those variables as dfined in "measures" vector
  trainsubset <- xtrain[ , measures ]
  rm(xtrain) # tidy up xtrain immediately
        
# Load the corresponding Subjects for each Train Set        
  subjecttrain    <- read.table(file="./train/subject_train.txt", header=FALSE, sep=" ", col.name="subject")

# Load the corresponding activity IDs for each Train set to (ytrain)
  ytrain <-  read.table(file="./train/y_train.txt", header=FALSE, sep=" ", col.name="activity_id")
  # add a column to save the original sequence of records
  ytrain$seq = seq_along(1:nrow(ytrain))

# create a data frame 'trainactivity' from 'ytrain' data but with new column for description of activity
  trainactivity <- merge(ytrain, actlabel, by.x="activity_id", by.y="id" , all=TRUE, sort=FALSE)
  rm(ytrain)  #tidy up ytest immediately as it is no longer needed

# combine the subject, activty and selected measures to "mergedset" data frame
  # note: additional factor column 'settype' is added to indicate that data is from train set
  mergedset = data.frame(subjecttrain
                         ,activity=trainactivity[ order(trainactivity$seq), "activity"]
                         , settype="train"
                         , trainsubset[ , measures ])

  rm(subjecttrain, trainactivity, trainsubset) # tidy up
##=================================================================================## 
## ADD THE TEST RECORDS TO TRAINING RECORS TO COMBINE BOTH SETS (mergedset)        ##
## THEN CREATE A SEPARATE DATA SET FOR AVERAGE FOR EACH ACTIVITY AND EACH SUBJECT  ##
##=================================================================================## 

#  add the testdata to training data
   mergedset = rbind(mergedset, testdata)
   rm(testdata)
  
# create a summary of the average of each variable for each activity and each subject
  averages <- aggregate( mergedset[,measures]
                        , by=list(mergedset$subject, mergedset$activity), FUN=mean)
  # rename the resulted grouping keys to descriptive name
    colnames(averages)[1]="subject"
    colnames(averages)[2]="activity"

##=================================================================================## 
## WRITE TO FILE THE MERGEDSET (optional) AND THE AVERAGE SUMMARY (averages)       ##
##=================================================================================## 
 write.table(mergedset,file='mergedset.txt')
 write.table(averages,file='averages.txt')

 rm(actlabel, features, measures)
 #rm(averages, mergedset) # uncomment to keep the output datasets 
