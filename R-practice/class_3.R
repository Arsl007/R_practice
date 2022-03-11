# Load libraries
library(readxl)

# Load data
data <- read_excel("D:/R/test1/test1/data.xlsx", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
# View data
View(data)

# Strip Chart 
stripchart(data$Height)

# Between two variable of same type
stripchart(data$Height~data$Weight)

# Histogram
hist(data$Height)
hist(data$Weight) # histogram Also gives you the frequency of the data set

# Plot (Also known as scatter plot)
plot(data$Weight, data$Height)

# QQnorm-plot
qqnorm(data$Height)

# Bar plot
barplot(data$Height)


# Mosaic plot
mosaicplot(data$Crop~data$Height)

# Box Plot
boxplot(data$Height~data$Crop)
