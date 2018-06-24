#Simple regression

# -*- coding: utf-8 -*-
"""
Created on Sun Jun 24 23:49:15 2018

@author: karta
"""
#importing libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importing datasets
dataset = pd.read_csv("Salary_Data.csv")

x = dataset.iloc[:,:-1].values
y = dataset.iloc[:,1].values

#Spliting the data into training and test set
from sklearn.cross_validation import train_test_split
x_train,x_test,y_train,y_test = train_test_split(x,y,test_size = 1/3, random_state = 0)

from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(x_train,y_train)