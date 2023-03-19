library(ggplot2)
library(dplyr)
library(dplyr)

set.seed(888)
####################data clean and preprocessing ####################
#clean data import
data <- read.csv('after_clean.csv')

#get ride of the useless column
data2 = data[,-1]

#geographic data to standard
lat_decimal <- data$LAT1 + (data$LAT2/60) + (data$LAT3/3600)
long_decimal <- -(data$LONG1 + (data$LONG2/60) + (data$LONG3/3600))

# merge latitude and longitude into the data set 
df <- data2 %>%
  mutate(lat = lat_decimal, long = long_decimal)

##k mean to cluster locations into 10 zones
lat_long_data <- data.frame(latitude = df$lat, longitude = df$long)

# Perform KMeans clustering on the coordinates
k <- 10  # Number of clusters
clusters <- kmeans(lat_long_data, centers = k)

# Extract the cluster assignments
cluster_assignments <- clusters$cluster

# Transform the cluster assignments into categorical variables
categorical_variables <- cluster_assignments %>%
  factor(levels = 1:k) %>%
  as.data.frame()

# Add the categorical variables to the original data
data_kmean_lat_long <- cbind(df, categorical_variables)

#get the center of the zone
k_mean_center = clusters$centers

#drop columns
new_data <- subset(data_kmean_lat_long, select = -c(LAT1,LAT2,LAT3,LONG1,LONG2,LONG3,lat,long)) 
# the k-mean cluster the geo variables into 10 zones
names(new_data)[names(new_data) == "."] <- "zone"

#as factor
new_data$LT <- as.factor(new_data$LT)
new_data$ST <- as.factor(new_data$ST)
new_data$DAM <- as.factor(new_data$DAM)

##split data to train and test
train_indices <- sample(1:nrow(new_data), round(0.85 * nrow(new_data)), replace = FALSE)

# Create the training set
train <- new_data[train_indices,]

# Create the testing set
test <- new_data[-train_indices,]


########################fit models ###################################
# full model
lm = lm(HG ~ N + ELV + SA + Z + LT + ST + DA + RF + FR + DAM + zone -NAME, data = train)
summary(lm)

#variable selection
# explian up to 25.8% of the variation in data
bestmod_aic <- step(lm, direction = 'both', trace = 0)
summary(bestmod_aic)

####################### prediction ####################################
#exam the model 
pred <- predict(bestmod_aic, newdata = test[,3:13])
mse <- mean((test[,2] - pred)^2)
mse
