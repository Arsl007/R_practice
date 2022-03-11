#Recommended book: Introduction to R, data analysis and prediction algorithm with R

# Why data wrangling is so important?
# 1. if your data is not set then no matter how many visualization graph you made
# graph structure will be change, std will be so big you can't calculate difference.
# 2. if you are using using your data as it is mean without transformation the statistic
# analysis will be not so good.
# 3. most impotently you will not know your data structure. 

# what is tibble?
# basically its a kind of table in stat we called it tibble, tuple etc. You will
# data structure or DF in console window of R.

# Data wrangling and data transformation 

install.packages("tidyverse")
install.packages("tidyr")
library(tidyverse)
library(tidyr)
?tidyverse
#bultin datasets in R
data()

#Data types
##numeric
num <- 2.2
class(num) #class function use to see data type

##character
chr <- "RwithAammar"
class(chr)

##Logical
logi <- TRUE
class(logi)

#how to confirm a class/type of variable:
num
is.numeric(num)
is.character(num)

chr
is.character(chr)

logi
is.logical(logi)

#how to transform a data type
num1 <- "3.2"
class (num1)

num1 <- as.numeric(num1) #use this to convert data type
class(num1)

num2 <- c(1,2, 3,4,5) # vector is who increase continuously 
num2
class(num2)

num2 <- as.logical(num2)
class (num2)

num2 <- c(1,2, 3,4,5,0) # when you use logical operator only value of 0 will be false
num2
class(num2)

num2 <- as.logical(num2)
class (num2)
num2

num2 <- as.character(num2)
class(num2)
print(num2) #or num2 only are same things

#data types are more important than data itself....
#data structure is more important than data significance....

###step-1- set your home directory (Ctrl+sift+H)
###Step-2- Import your data in R (readx1, readcsv)
###step-3- Data Structure and Types
###step-4- Data Transformation and tidy tips and tricks
###step-5-

##step-3- Data Structure and Types

###Data types
###numeric
num <- 2.2
class(num) #class function use to see data type

###character
chr <- "RwithAammar"
class(chr)

###Logical
logi <- TRUE
class(logi)

###how to confirm a class/type of variable:
num
is.numeric(num)
is.character(num)

chr
is.character(chr)

logi
is.logical(logi)

###how to transform a data type
num1 <- "3.2"
class (num1)

num1 <- as.numeric(num1) #use this to convert data type
class(num1)

num2 <- c(1,2, 3,4,5) # vector is who increase continuously 
num2
class(num2)

num2 <- as.logical(num2)
class (num2)

num2 <- c(1,2, 3,4,5,0) # when you use logical operator only value of 0 will be false
num2
class(num2)

num2 <- as.logical(num2)
class (num2)
num2

num2 <- as.character(num2)
class(num2)
print(num2) #or num2 only are same things

#Data struture
data()
data("diamonds")
x <- diamonds
head (x)
str(x)
view(x)
class(x$carat)
class(x$price) # class int because its whole number
class(x$x) 

# difference between tibble and data frame 
# lets take example of diamond data if we melt down "carat, cut, color, clarity"
# into one column and name it as diamond characteristics then we created a data frame.
# in the form of table it we can call it tibble 

class(x["carat"])
as.data.frame (x) # not use mostl y to see data 
as_tibble(x) # tibble adjust its column according to how widely your console window is open'
glimpse(x) # this function give you overview or bird eye view of your data 


###step-4- Data Transformation and tidy tips and tricks

#Data Transformation
data()
data("diamonds")
x <- diamonds
head (x)
str(x)
view(x)
class(x$carat)
class(x$price) # class int because its whole number
class(x$x) 

# difference between tibble and data frame 
# lets take example of diamond data if we melt down "carat, cut, color, clarity"
# into one column and name it as diamond characteristics then we created a data frame.
# in the form of table it we can call it tibble 

class(x["carat"])
as.data.frame (x) # not use moslty to see data 
as_tibble(x) # tibble adjust its column according to how widely your console window is open'
glimpse(x) # this function give you overview or bird eye view of your data 

#convert into right data type?
x$carat <- as.numeric(x$carat, x$depth)
class(x$table)
glimpse(x)
str(x)

#vector
vecl <- c(1,2,3,4,6,9,0,-1,0.5)
class (vecl)
#Factor
vec2  <- c("blue", "red", "purple", 'green') # can be use a in color command to give color to different variable on x axis sequence wise
class(vec2)
vec2_fac <- as.factor(vec2)
class(vec2_fac )

#tidy means to collect data and make it usable for statistics in R
x <- CO2
glimpse(x)
as_tibble(x)
as.data.frame (x)
x1 <- chickwts
as_tibble(x1)

# #manipulating data
install.packages ("dslabs")
library (dslabs)
x <- diamonds

#add a column
as_tibble(x)
x <- mutate(x, a = x+y)
as_tibble(x)
x2<- mutate (x, sd=  sd(y+z))
as_tibble(x2)


# #subsetting
as_tibble(x)
x_al <- filter(x, a == 7.93)
as_tibble(x_al) 

X_a2 <- filter(x, cut=="Ideal")#subsetting a character variable
as_tibble(X_a2)

#subsetting using select function
as_tibble(x)
x1 <- select(x, cut, color, x)
as_tibble(x1)

#task for attendees
x <- murders
as_tibble(x)
#data= murders
#criterial= pop > 5^6
#region = south
#Plots for both send to whatsapp inbo

x2 <- filter(x, region=="West", population>5000000)
as_tibble(x2)

plot(x2)


#Less code for more output
install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
#dplyr pipe X- ctrl+shift+m
# object
## murders
# # filter
## select
## mutate

x <- murders %>% 
  filter(region=="West") %>% 
  select(region, population) %>% 
  mutate(population_2=population+2)
x
















