# Load libraries
library(readxl)

# Load data
data <- read_excel("D:/R/test1/test1/data.xlsx", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
# View data
View(data)

# what are the structure of the data set
str(data)

head(data) # First 6 rows 

tail(data) # Last 6 rows

# Plot our data
plot(data)

# box plot
boxplot(data$Height, data$Weight)

boxplot(data$Crop, data$Weight) # Error because data type for both variable is different.

# For different type of variable box plot
boxplot(data$Height ~  data$Crop)

