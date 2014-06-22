#dataTidy.R

#This script includes the following programs 
#merge, getMeanStd, setNames, createTable, tidyData
#all the functions are shortly distribed below before the function and discribed
#in depth in the documentation tidyData.md


#the function merge takes all the values from the test and training set and,
#merges them into one data set

merge<-function() {
    test<-read.table("UCI_HAR_Dataset//test/X_test.txt",colClasses="numeric")
    subject.test<-read.table("UCI_HAR_Dataset/test/subject_test.txt")
    activity.test<-read.table("UCI_HAR_Dataset/test/y_test.txt")
    test.com<-cbind(test,subject.test,activity.test)
    
    train<-read.table("UCI_HAR_Dataset/train/X_train.txt", colClasses="numeric")
    subject.train<-read.table("UCI_HAR_Dataset/train/subject_train.txt")
    activity.train<-read.table("UCI_HAR_Dataset/train/y_train.txt")
    train.com<-cbind(train,subject.train,activity.train)
    
    complete<<-rbind(test.com,train.com)
    x<-read.table("UCI_HAR_Dataset/features.txt")
    name<-as.character(x$V2)
    names(complete)<<-c(name,"subject","activity")
}

#the function getMeanStd is used to extract the mean and standard diviation,
#from the data set created in the merge function

getMeanStd<-function() {
    mean<-grep("mean()",names(complete),value=F,fixed=T)
    std<-grep("std()",names(complete),perl=T,value=F)
    get<-c(mean,std)
    MeanStd<<-data.frame(subject=complete$subject,activity=complete$activity)
    for (i in 1:length(get)) {
        x<-complete[,get[i]]
        MeanStd<<-cbind(MeanStd,x)
    }
    names(MeanStd)<<-c("Subject","Activity",names(complete)[get])
}

#the function setNames is giving the mean and Std data set proper names for the
#activities i.e; walking, sitting, etc.

setNames <- function() {
    activity<-read.table("UCI_HAR_Dataset/activity_labels.txt",colClasses="character")
    activity.name<-numeric(length(MeanStd$activity))
    for(i in 1:length(MeanStd$activity)){
        activity.name[i]<-activity$V2[MeanStd$activity[i]]
    }
    MeanStd$activity<<-activity.name
}

#the function createTable pretty much does what it says, it takes the table that,
#is being inputtet and creates a table that are tab separated

createTable <- function(x,file) {
    write.table(x,file,col.names=T, sep="\t")
}

#the last function tidyData, takes the mean of all the different activities ofr
#each person, and creates a table containing them, look in the dokumentation,
#for more details 

tidyData <- function() {
    variables<-3:length(names(MeanStd))
    subjects<-levels(as.factor(MeanStd$subject))
    activities<-levels(as.factor(MeanStd$activity))    
    results<<-data.frame(subjects=c(rep(subjects,each=length(activities))),activities=c(rep(activities,times=30)),check.names=F)
    for (i in 1:length(variables)) {
        temp<-MeanStd[,variables[i]]
        col<-numeric(length(subjects)*length(activities))
        for (j in 1:length(subjects)){
            for (k in 1:length(activities)) {                
                temp2<-temp[MeanStd$subject==subjects[j] & MeanStd$activity==activities[k]]
                col[(j-1)*6+k]<-mean(temp2)
            }
        }
        results<<-cbind(results,col)
    }
    names(results)<<-names(MeanStd)
}