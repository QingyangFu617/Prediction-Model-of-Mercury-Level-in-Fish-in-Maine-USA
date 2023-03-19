# Prediction Model of Mercury Level in Fish in Maine USA

## Executive Summary

This study aims to design a prediction model for the Department of Agriculture, Conservation and Forestry (DACF) in Maine, USA to predict the level of mercury in fish and understand the factors that cause high mercury levels. The study uses data cleaning, clustering, multiple linear regression and stepwise regression to build the model. The optimal model includes five significant factors: elevation, surface area, lake type, lake stratification indicator, and location of the lake. The model explains the variation in mercury level in fish reasonably well and has a low mean squared error. The study has certain limitations, such as a limited number of observations and possible data bias. Nonetheless, it can help DACF predict the level of mercury in fish and improve water and fish safety in Maine.

## Introduction

The mercury levels in fish in Maine are definitely worth attention, as they may have significant health and mental impacts on people, especially infants and teenagers (Ruggieri et al., 2017). Therefore, reliable methods are necessary for predicting the mercury levels and controlling the effects of pollution. In this study, a prediction model is designed for DACF to predict the mercury level in fish, as well as understand factors that might causes the high mercury level in fish. 

## Methods

In this study, we first removed all NaN and null values from the dataset. Next, we converted all categorical data into factors, such as Lake Type (LT), Lake Stratification Indicator (ST), and Presence of Human Infrastructure (DAM). We also cleaned the geographical data, specifically the latitude and longitude, by converting them from degrees, minutes, and seconds to standard decimal coordinates.

The proximity of the lake to the city or nearby factories is a critical factor in this study, as it can affect the level of mercury in fish, as shown in Figure 1. Therefore, we used the K-means algorithm to cluster all of the lakes into 10 zones (Figure 2). The K-mean method groups coordinates by dividing data into clusters based on similarities and repeatedly moving cluster centers until all of the coordinates are grouped together optimally. This can help us identify the relationship between the mercury level in fish and the location of the lakes.


![A3pic1](https://user-images.githubusercontent.com/100692852/226150835-5ffba5cf-e475-4fd0-a145-6e3d15ad5caf.png)
Figure 1 Mercury Level in Different Area
![A3pic2](https://user-images.githubusercontent.com/100692852/226150836-05ecdfa5-4510-4c2e-bb7b-5074f89c1e78.png)
Figure 2 Mercury Level in 10 Zones


To train a model with strong predictive power, we first split our data into training and testing sets with a ratio of 0.85. Then, we fit a multiple linear regression with all of the factors to examine their relationship with the mercury level in fish. The proportion of mercury level in fish that can be explained by the factors (adjusted R-squared) and the significance (p-value) of each predictor are used to test whether the model is adequate.

After fitting the full model with all factors, we used stepwise selection on our full model to find the optimal model that predicts mercury level in fish. Stepwise selection is a method that finds the most important factors that affect the fish mercury level using statistical criteria AIC. Then, we used the model to predict on the testing dataset and utilized the mean squared error (MSE) as a measure of how accuracy the predicted mercury levels compares to the real levels in our records.

## Result

The full model, which uses mercury level in fish as the response and all factors as predictors, is shown in Table 1. It only has three moderately significant (p-value < 0.1) predictors: ELV, SA, and ST. The adjusted R-squared value was 0.2233, indicating that all factors explain only 22.3% of the variation in mercury level in fish. Since only three factors are slightly significant, they cannot explain the mercury level well.

![Screenshot 2023-03-18 213508](https://user-images.githubusercontent.com/100692852/226150914-954d3c10-24f9-4def-937b-9dd8e9bcd6f2.png)  
Table 1. Full Model Summary

Therefore, stepwise selection was used to select important variables to improve the performance of the model. By using stepwise regression, we obtained an optimal model with only 5 factors (ELV, SA, LT, ST, and Zone), and the adjusted R-squared increased from 0.2233 to 0.2584 (Table 2). This increase shows that the optimal model can explain more variation in fish mercury level in Maine, USA. The mean squared error (MSE) of 0.148 indicates that our errors of predicted values compared to observed values are quite small, proving the robustness of our model.

![Screenshot 2023-03-18 213709](https://user-images.githubusercontent.com/100692852/226150924-5cc41675-7370-425b-86da-ff50ec14549c.png)   
Table 2. Optimal Model Summary

Therefore, the optimal model with elevation (ELV), surface area (SA), lake type (LT), lake stratification indicator (ST), and location of the lake (Zone) can reasonably explain the mercury level in fish in Maine.

## Discussion

This study has certain limitations. Firstly, the data may be biased since we cannot verify how it was collected. Secondly, the dataset only contains around 100 observations which may lead to overfitting. This occurs when a model fits the noise in the data instead of the true pattern and relationships. Lastly, the limited number of observations reduces the predictive power of our model. We do not have enough data to train our model and improve its accuracy and precision.

## Conclusion

Although there are certain limitations to the study and the optimal model, it can still greatly help the DACF to predict the level of mercury in fish in Maine based on only five factors that can be easily and inexpensively collected. This can significantly reduce the difficulty of controlling pollution and improve water and fish safety in Maine, USA.

Ruggieri, F., Majorani, C., Domanico, F., & Alimonti, A. (2017, May 12). *Mercury in children: Current state on exposure through human biomonitoring studies*. International journal of environmental research and public health. Retrieved March 18, 2023, from https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5451970/
