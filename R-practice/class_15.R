# 1- Heat map
View(mtcars)
x <- mtcars
heatmap(mtcars)

# Data should be in numeric matrix
x <- as.matrix(mtcars)
heatmap(x)

# Blance units of data
heatmap(x, scale = "column")

# gplots
library(gplots)

heatmap.2(x, scale = "column", col = bluered(100))

# Remove tracing 
heatmap.2(x, scale = "column", col = bluered(100),
          trace = "none")

# Help
?heatmap.2()

# 3- pheatmap
# install.packages("pheatmap")
library(pheatmap)

pheatmap(x, scale = "column")

# cut after 4 rows
pheatmap(x, scale = "column", cutree_rows = 4)

# cut in cloumns
pheatmap(x, scale = "column", cutree_cols = 2)

#4- method
library(ggplot2)

# load data
y <- iris

# for reshape dta intall package
install.packages("reshape")
library(reshape)
y1 <- melt(iris)

ggplot(y1, aes(y1$Species, y1$variable, fill= y1$value))+
  geom_tile()+
  scale_fill_gradient(low = "red", high = "green")
