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