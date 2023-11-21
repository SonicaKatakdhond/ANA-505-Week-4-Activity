#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice

data(Titanic)
Voyagers <- as.data.frame(Titanic)

#TASK: Write the function to see the top rows of the data
head(Voyagers,4)

#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library("dplyr")

#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
select(Voyagers,Survived,Sex)

#TASK: Write the function to save the two columns as one new dataset
#and give it a name
VoyagersNewDataset <- select(Voyagers,Survived,Sex)

#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
select(VoyagersNewDataset,Survived,-Sex)

#TASK: Write the function that renames 'Sex' to 'Gender'
rename(VoyagersNewDataset, Gender=Sex)

#TASK: Write the function that names a new dataset that includes the 'gender' column
VoyagersNew1<-mutate(Voyagers, Gender=Sex)

#TASK: Write the function that includes only rows that are 'male'
males<-filter(VoyagersNew1, Gender=="male")

#TASK: Write the function to group the data by gender (hint: arrange())
arrange(males, Freq)
group_by(males, Gender)

#TASK: Sum the Freq column
#TASK: After you run it, write the total here: 2201
sum(Voyagers$Freq)

#TASK: Write the function that includes only rows that are 'female'
females<-filter(VoyagersNew1, Gender=="female")

#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
union(males,females)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
freq_table <- table(VoyagersNewDataset$Survived, VoyagersNewDataset$Sex)
