Code book that describes the variables, the data, and any transformations or work that was performed to generate the data.

* All data from the training sets is read and combined in a single training set.
* All data from the tests set is read and combined into a single training set.
* The training sets and test sets are combined into a single data set.
* Activity labels are read.
* Features of the data set are read and following transformation is performed -
  * -mean replaced with Mean
  * -std replaced with Std
  * -() is stripped out
* Required column names are picked up and a vector containg names of expected columns is generated.
* data is reduced to required mean and std dev variables.
* column names are assigned to the combined data.
* activity_value are replaced with corresposing labels.
* group the dataset along activity and subject categories.
* Compute the mean of each variable for each activity and subject.
