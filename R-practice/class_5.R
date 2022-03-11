# Load libraries
library(readxl)

# Load data
data <- read_excel("D:/R/test1/test1/data.xlsx", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
# View data
View(data)

# Descriptive statistics 
mean(data$Height)
mean(data$Weight)
median(data$Height)
median(data$Weight)

min(data$Height)
max(data$Height)

# Range 
range(data$Height)

# Quatiles
quantile(data$Height, 0.25)
quantile(data$Height, 0.75)

sd(data$Height)
var(data$Height)

# find the descriptive statistics for both variables
lapply(data[, 2:3], mean)
lapply(data[, 2:3], sd)
lapply(data[, 2:3], var)

# find the descriptive statistics
summary(data)

# ANOVA (analysis of variance )

# Check the difference between the height by crop wise
aov(data$Height~data$Crop)
a1 <- aov(data$Height~data$Crop)

# to check the significance of anova or not
summary(a1)

# Which one id differ
TukeyHSD(a1)

# Group avova
a2<- aov(data$Height~data$Crop*data$Water)
summary(a2)
TukeyHSD(a2)

# Lettering automatic then use package(Agricolae)


