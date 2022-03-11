# Principal component analysis
# how perform in R
 
data("iris")
View(iris)

#PCA
x <- prcomp(iris[, -5], center = TRUE, scale. = TRUE)
print(x)
summary(x)

# ggplot2
library(ggplot2)

iris <- cbind(iris, x$x)

ggplot(iris, aes(PC1, PC2, col=iris$Species, fill= iris$Species))+
  stat_ellipse(geom = "polygon", col= "black", alpha=0.5)+
  geom_point(shape=21, col="black")

# PCA PLOT
install.packages("factoextra")
install.packages("FactoMineR")
library(factoextra)
library(FactoMineR)

# PCA Table
iris.pca <- PCA(iris[, -5], graph = TRUE, scale.unit = TRUE)

# Scree plot
fviz_eig(iris.pca, addlabels = TRUE, ylim=c(0,70))

# PCA plot
fviz_pca_var(iris.pca, col.var = "cos2", 
             gradient.col= c("#FFCC00", "#CC9933", "#660033", "#330033"),
             repel = TRUE)+
  labs(title = "PCA of Prarmeter", x= "PC1(49%)", y= "PC2(23.9%)",
       colour= "cos2")+
  ggsave("PCA.png",  units = "in", width=6.5, height=5.5)
