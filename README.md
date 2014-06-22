Documentation for the script tidyData.R
=======================================
the script contains five functions
1. Merge
2. getMeanStd
3. setNames
4. createTable
5. tidyData  

merge
-----
        The program start by getting all the dat from the files in the folder
        test, and for the large data set I've set colClasses to 'numeric' to
        reduce the load time. 
        It then combines the three datasets into on dataset called 'test.com'
        The function then does the same thing for the files in the folder train.
        the two datasets 'test.com, train.com' is then combinded in the global
        variable complete.
        Then the function get's the feature names from the data set and
        asigns them to the names of the global variable complete.  

getMeanStd
----------
        This function is used to find the mean and standard deviation of all the
        different variables in the dataset results.
        First the function finds the means and std variable useing GREP and then
        add them to a vector used in the loop to get the columns that contains
        the data for the mean and std. 
        In the loop it takes the column number for the different variables and
        then transfers them to a new data frame called MeanStd which is a global
        variable.
        
setNames
--------
        this function takes the names ofthe activies from the file in the data
        set as a matrix. 
        Then it makes a vector for the activity lables.
        In the loop below it set name of the avtivity in the vector
        Activity.name compared with the number that is in the dataset   

createTable
-----------
        This is a pretty standard function and the function works in the way
        that it takes the data as variable X, and the output file is the
        variable "file".
        Then it takes the variables and creates a table in a .txt format which
        is tab separated 

tidyData
--------
        This is the most complicated function of them all, first it makes a
        variable that makes a reference list to the columns containing the data.
        Then it makes a subject list and a list of activities.
        The function then makes the dataframe results as a global variable.
        Now the function goes into the first loop this loop runs through the
        variable. It then makes a vector with the numbers in the column from
        MeanStd, and a column that is as long as the amount of subjects times
        the amount of activities.
        The next loop then runs through the subjects.
        The last loop runs through the activities.
        Inside the loop it then gets the number that fits the subject and the
        ativity puts them in a vector and takes the mean of that vector.
        That mean is then put in the variable "col".
        Then after haveing gone through all the subjects it binds the column to
        the data frame results, and in the last part it set the names of the
        data frame according to the names in the data frame MeanStd.
