# Load libraries
library(readxl)

# Load data
x <- read_excel("D:/R/test1/test1/data.xlsx", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text"))
# View data
View(data)

# Box plot
boxplot(x$Height~x$Crop)
boxplot(Height~Crop, data = x)

# multiple comparison of means

# 1- Tu-key-HSD test (firstly we install packages)
install.packages("agricolae")
library(agricolae)

# If you want to check the history of this packages use "help"command to see the whole document regarding this pacakge.
help("agricolae-package")
?`agricolae-package`

# Make model 
model <- aov(Height~Crop, data = x)

# Applying test
out <- HSD.test(model, "Crop", group = TRUE, console = TRUE, main = "Tukey test")

# plot
plot(out)

#2- LSD Test

# Make model 
model <- aov(Height~Crop, data = x)

# Applying test
out <- LSD.test(model, "Crop", group = TRUE, console = TRUE, main = "LSD test")

# plot
plot(out)

#3- Duncan test

# Make model 
model <- aov(Height~Crop, data = x)

# Applying test
out <- duncan.test(model, "Crop", group = TRUE, console = TRUE, main = "Duncan test")

# plot
plot(out)


# Grouping
boxplot(Height~Crop*Water, data = x, las=2, xlab = "")
model1 <- aov(Height~Crop*Water, data = x)

# Applying test
out1 <- HSD.test(model1, c("Crop", "Water"), group = TRUE, console = TRUE, main = "Tukey test")

# plot
plot(out1, horiz = TRUE, las=2)
plot(out1, las=2)


# String is a character or categorical variable.

# save in super quality graph.
jpeg(filename = "Tukey test.tiff",
     width = 6, height = 4, units = "in", res = 300)
boxplot(Height~Crop*Water, data = x, las=2, xlab = "")
dev.off()

# letter graph saving 
jpeg(filename = "Tukey testplot.tiff",
     width = 6, height = 4, units = "in", res = 300)
plot(out1, horiz = TRUE, las=2)
dev.off()

