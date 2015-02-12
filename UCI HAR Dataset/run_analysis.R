# trainData<-read.table("/Users/geoffreystephens/uwazac/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt")
# testData<-read.table("/Users/geoffreystephens/uwazac/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt")
# yTrain<-read.table("/Users/geoffreystephens/uwazac/Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt")
# yTest<-read.table("/Users/geoffreystephens/uwazac/Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt")
# trainSubjects<-read.table("/Users/geoffreystephens/uwazac/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt")
# testSubjects<-read.table("/Users/geoffreystephens/uwazac/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt")
# interimData<-rbind(trainData, testData)
# charfeatures<-as.character(features[,2])
# colnames(interimData)<-charfeatures
# trainTestDesc<-rbind(yTrain, yTest)
# mergedData<-cbind(trainTestDesc, interimData)
# colnames(mergedData)[[1]]<-"Activities"
# subJects<-rbind(trainSubjects, testSubjects)
# mergedData<-cbind(subJects, mergedData)
# colnames(mergedData)[1]<-"Subjects"
labelSub<-function(mergedData1){
  for (i in 1:dim(mergedData1)[1])
    {
    if (mergedData1$Activities[i]=="1")
        {mergedData1$Activities[i]="STANDING"}
    else if (mergedData1$Activities[i]=="2")
        {mergedData1$Activities[i]="WALKING_UPSTAIRS"}
    else if (mergedData1$Activities[i]=="3")
        {mergedData1$Activities[i]="WALKING_DOWNSTAIRS"}
    else if (mergedData1$Activities[i]=="4")
        {mergedData1$Activities[i]="SITTING"}
    else if (mergedData1$Activities[i]=="5")
        {mergedData1$Activities[i]="STANDING"}
    else if(mergedData1$Activities[i]=="6")
        {mergedData1$Activities[i]="LAYING"}
    }
return(mergedData1)
}
tidyData<-group_by(mergedData, Subjects, Activities)
tidyColNamer<-function(){
  
  funTime<-summarise(tidyData, count = n(), mean(tidyData$"tBodyAcc-mean()-Z", na.rm=TRUE))
  
return(funTime)
}

