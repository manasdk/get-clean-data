Code book that describes the variables, the data, and any transformations or work that was performed to generate the data.

1) All data from the training sets is read and combined in a single training set.
2) All data from the tests set is read and combined into a single training set.
3) The training sets and test sets are combined into a single data set.
4) Activity labels are read.
5) Features of the data set are read and following transformation is performed -
   (i) -mean replaced with Mean
   (ii) -std replaced with Std
   (iii) -() is stripped out
6) Required column names are picked up and a vector containg names of expected columns is generated.
7) data is reduced to required mean* and std* variables.
8) column names are assigned to the combined data.
9) activity_value are replaced with corresposing labels.
10) group the dataset along activity and subject categories.
11) Compute the mean of each variable for each activity and subject.
