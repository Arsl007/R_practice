# bulitin datasets in r
data()

# co2 dataset
View(CO2)

#other datasets
View(PlantGrowth)
View(iris)
View(mtcars)
View(trees)
View(npk)

# check data set
head(CO2)
names(CO2)
nrow(CO2)
ncol(CO2)

# Save the bulitin data set
install.packages("writexl")

library(writexl)
write_xlsx(CO2, path = "D:\\R\\R-practice\\CO2.xlsx")

# gg plot 2
library(ggplot2)

ggplot(trees,aes(Girth, Height))+
  geom_point()+
  geom_smooth()

# linear trend

ggplot(trees,aes(Girth, Height))+
  geom_point()+
  geom_smooth(method = "lm")
