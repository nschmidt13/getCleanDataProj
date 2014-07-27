####getCleanDataProj
####================

###Introduction
This R project tidies data from Samsung devices. The data is contained in many different files.

This R project combines the files and calculates the standard deviation and mean for each variable.

It then aggregate the values means by activity and subject.

The following is the activity values:
1 Walking
2 Walking_Upstairs
3 Walking_Downstairs
4 Sitting
5 Standing
6 Laying

###Pseudo code
##read in features which are the heading names for the X_test.txt file
##read in the X_test fie and set the colname using the feature vector
##read in the y_test fie
##read in the subject fie
##test data merged into tiny dataset
##read in the X_train fie and set the colname using the feature vector
##read in the y_train fie
##read in the subject fie
##train data merged into tidy dataset
##rbind the test and train datasets into one large tidy dataset
##reaplace the activity with readable values
##remove id's and activity data
##caclulate mean for each variable and put data in data.summary
##create sd for each variable and add column to data.summary
##create data.summary column names
##create summary.aggregate by activity and subject
##write data.summary and summary.aggregate out to files