dataset = read.csv("Salary_Data.csv")

# Spliting dataset into test and training
# install.packages('caTools')
library(caTools)

set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset,split == FALSE)

#Feature scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

#Regressor fitting
regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)

y_pred = predict(regressor, newdata = test_set)

#VISUALISING
#install.packages('ggplot2')
library(ggplot2)

# Training set
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),color='red')+
  geom_line(aes(x = training_set$YearsExperience,y=predict(regressor, newdata = training_set)),color='blue')+
  ggtitle("Salary vs Experience (Training set)")+
  xlab("Experience")+
  ylab("Salary")

# Test set
ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),color='red')+
  geom_line(aes(x = test_set$YearsExperience,y=predict(regressor, newdata = test_set)),color='blue')+
  ggtitle("Salary vs Experience (Training set)")+
  xlab("Experience")+
  ylab("Salary")



