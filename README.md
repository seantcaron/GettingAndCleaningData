Coursera Getting and Cleaning Data Final Project
------------------------------------------------
Sean Caron

scaron@umich.edu

Usage
-----
Extract the UCI HAR data. Place this script at the root of the extracted data. Run R and execute
the script.

Theory of Operation
-------------------
First, the script reads in the activity labels, to map the activity ID codes to text descriptions.

The script then applies the following process for each of the test data and training data sets:

1. Reads in the data set from the flat text file.

2. Creates a new data frame with the desired columns and descriptive column names

3. Merges the activity names with the data frame we generated in (2)

Once both the test data and training data have been loaded and labeled, the two tables are
concatenated using rbind().

The activity.id field, made redundant by the merge, is removed from the data set.

Finally, an output data frame showing the mean of our desired columns grouped by each participant
and each activity, is generated using reshape2.

This output is written to a file using write.tables

License
-------
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
