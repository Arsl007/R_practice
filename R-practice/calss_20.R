# Correlation
## Insatll packages
install.packages("psych")
install.packages("corrplot")
install.packages("RColorBrewer")

# read packages
library(psych)
library(corrplot)
library(RColorBrewer)

# Psych packages
data("iris")
View(iris)

# Naming
x <- corr.test(iris[,-5])

# for values or correlation matrix
x

# plot
pairs.panels(iris[-5])

# Corr plot package
# we are using "iris data again"
data("iris")

# Correlation
m <- cor(iris[,-5])

# plot
corrplot(m)

# 2nd corr plot
corrplot(m, type = "upper")
corrplot(m, type = "lower")

# commands to plot
corrplot(m, type = "upper", order = "hclust", method = "pie")

# different methods
corrplot(m, type = "upper", order = "hclust", method = "square")

# color
?RColorBrewer()
corrplot(m, type = "upper", order = "hclust", method = "pie",
         col = brewer.pal(n = 8, name = "RdYlBu"))
         
#  mixed Corr plot
corrplot.mixed(m)

# Make upper and lower in differently
corrplot.mixed(m, lower.col = "black", number.cex=0.7)

# one more differnt plot
corrplot.mixed(m, lower = "number", upper = "pie", t1.col="red")

# Change method of corr
?cor

m1 <- cor(iris[,-5], method = "spearman")

# plot
corrplot(m1)
# 2nd corr plot

corrplot(m1, type = "upper")
corrplot(m1, type = "lower")

# commands to plot
corrplot(m1, type = "upper", order = "hclust", method = "pie")

# different methods
corrplot(m1, type = "upper", order = "hclust", method = "square")

# color
?RColorBrewer()
corrplot(m1, type = "upper", order = "hclust", method = "pie",
         col = brewer.pal(n = 8, name = "RdYlBu"))
