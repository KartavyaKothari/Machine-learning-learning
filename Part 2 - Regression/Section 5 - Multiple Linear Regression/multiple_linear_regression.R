dataset = read.csv("50_Startups.csv")

# Spliting dataset into test and training
# install.packages('caTools')
library(caTools)

dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

#Fitting multiple regression model 
regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend+State,
               data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend,
               data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend+Marketing.Spend,
               data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = training_set)
summary(regressor)
