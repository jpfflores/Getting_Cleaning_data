Code Book
====================

#### Data Set 

* The tidy data set contains the mean of all mean and std values of each subject and each activity.
* The data set is stored as a txt file using one space(";") as the delimiter.
* The first line of the data is the variable name of the data, the names are all quoted by '"'.

#### Variables

* subject, each subject identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* activity, each activity identifies a specific activity subject did. It has 6 different type of activities, including "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", and "LAYING"
* all other variables are measurement that come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* the variable name convention is like the following
  * All variable names start with "t" or "f"
    * prefix 't' to denote time, they were time domain signals captured at a constant rate of 50 Hz.
    * prefix 'f' to indicate frequency domain signals, they were applied by a Fast Fourier Transform (FFT) of the original signal.
	
  * The column has the fragment "mean()" or "std()", to tell if it is a "mean" or "standard deviation" measurement.
  * If the variable end with ".X" or ".Y" or ".Z", means it is the measurement of X/Y/Z direction of a 3-axial singals.  

  E.G.:
	tBodyAcc-std()-X
	t - time
	std() - standard deviation measure
	X - x axis


#### Transformation 

The data set is a transformation of the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
   
The transformation process is like the following:

* Assumptions:
	* the data is already downloaded in local file system
	* the data is already located at "working directory"
	* the data is already unzippedat "UCI HAR Dataset" directory
* All the is loaded before transformed	
* Merged the ( TableXTest | TableXTrain ), ( TableYTest | TableYTrain ) and ( TableSubjTest | TableSubjTrain ) 
* All the columns are named 
* The columns that reprensents "-mean" or "-std" are marked at the table of features (TableFtres)
* The table DataX is filtered using the the vector created before to define which column is valid  
* The three tables are merged, creating the first tidy data
* The tidy data is rearranged based upon the meaning of the values 
* Write the result dataset to local file system ("tidy_data.txt).