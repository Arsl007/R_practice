# bulitin datasets in r

# How to use bulit in data sets in r
data() # All data sets in r

# co2 dataset
View(CO2) # to view data set in Console

#other dataset
View(PlantGrowth)
View(iris)
View(mtcars)
View(trees)
View(npk) # NPK data for factorial design 

# check data set
head(CO2) # to show first 6 rows of data
names(CO2) # to show the names of column
nrow(CO2)# to look for the total number of rows (sample size)
ncol(CO2) # to look for the number of columns ( number of variables)

# to Save the bulit in data set in xlsx
install.packages("writexl")

library(writexl)
write_xlsx(CO2, path = "D:\\R\\R-practice\\CO2.xlsx")

# gg plot 2
library(ggplot2)

ggplot(trees,aes(Girth, Height))+
  geom_point()+
  geom_smooth() # Scatter plot

# linear trend
library(ggplot2)

ggplot(trees,aes(Girth, Height))+
  geom_point()+
  geom_smooth(method = "lm")
