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
        

setNames
--------

createTable
-----------

tidyData
--------
