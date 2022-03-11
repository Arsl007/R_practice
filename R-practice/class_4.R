# Load libraries
library(readxl)

# Load data
data <- read_excel("D:/R/test1/test1/data.xlsx", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
# View data
View(data)

# In previous classes we just plot the data without any other format, in this class we will see how to class, gives title and so on.

# Box Plot
boxplot(data$Height~data$Crop)
# Labeling

boxplot(Height~Crop, data = data)

# Main means title of the plot
boxplot(Height~Crop, data = data, main="Boxplot of experiment")

# Labeling x and y-axis
boxplot(Height~Crop, data = data, main="Boxplot of experiment",
        xlab = "Crop Type", ylab = "Plant Height(cm)")

# Coloring 
# Inside Coloring
boxplot(Height~Crop, data = data, main="Boxplot of experiment",
        xlab = "Crop Type", ylab = "Plant Height(cm)",
        col= "gray")

# Broder coloring 
boxplot(Height~Crop, data = data, main="Boxplot of experiment",
        xlab = "Crop Type", ylab = "Plant Height(cm)",
        col= "gray", border= "red")

# We can also use the color which we like.
boxplot(Height~Crop, data = data, main="Boxplot of experiment",
        xlab = "Crop Type", ylab = "Plant Height(cm)",
        col= "#0ea0cc", border= "#021217")

# Grouping of treatment

# Box Plot
boxplot(data$Height~data$Crop)

# if you want to add new column in the graph use * OR + sign
boxplot(data$Height~data$Crop*data$Water)

# if we select the name of crops according to your own desire by simple manipulation
data$Crop <- factor(data$Crop, levels = c("Wheat", "Maize", "Rice", "Potato"))

# Again Box plot
boxplot(data$Height~data$Crop*data$Water,
        main = "Boxplot of Experiment",
        xlab = "Crop&Water",
        ylab = "Height")
