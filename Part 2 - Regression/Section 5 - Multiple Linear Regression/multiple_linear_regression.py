# -*- coding: utf-8 -*-
"""
Created on Mon Jun 25 10:32:27 2018

@author: karta
"""

#importing libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importing datasets
dataset = pd.read_csv("50_Startups.csv")

x = dataset.iloc[:,:-1].values
y = dataset.iloc[:,4].values

#Categorial data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelEncoder_x = LabelEncoder()
x[:,3] = labelEncoder_x.fit_transform(x[:,3])
oneHotEncoder = OneHotEncoder(categorical_features = [3])
x = oneHotEncoder.fit_transform(x).toarray()

#Avoiding the dummy variable trap
x = x[:, 1:]
 

#Spliting the data into training and test set
from sklearn.cross_validation import train_test_split
x_train,x_test,y_train,y_test = train_test_split(x,y,test_size = 0.2, random_state = 0)

# #Feature scaling
# from sklearn.preprocessing import StandardScaler
# sc_x = StandardScaler()
# x_train = sc_x.fit_transform(x_train)
# x_test = sc_x.transform(x_test)

from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(x_train,y_train)

# Predicting test results
y_pred = regressor.predict(x_test)