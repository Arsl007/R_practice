# Scatter plot in r
 library(ggplot2)
 
# Create between two numeric variables
data("cars")
View(cars) 

ggplot(data=cars, aes(x=speed, y=dist))+geom_point()+
  geom_smooth(method = "lm", se=T, leve=0.95)


# Scatter plot with multiple lines
data("Orange")
View(Orange)

ggplot(Orange, aes(age, circumference))+
  geom_point()

# Colour the vises of tress
ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=4)

# change the size and shapes of the points
ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=4, shape= 19)

# Sperate by shapes
ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=4, aes(shape=Tree))

# use previous
ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=4, shape=19)+
  geom_line(linetype=1, size=1)

# Change the line type
ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=4, shape=19)+
  geom_line(linetype=2, size=1)

# using aes
ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_point(size=4, shape=19)+
  geom_line(aes(linetype=Tree), size=1)+
  labs(x="age", y=" circumference", title = "Scatter plot")



# Bubble plots
install.packages("viridis")
library(viridis)
data("quakes")
View(quakes)
nrow(quakes)

# large data set so we take sample
q_sample <- quakes[seq(from=1, to=1000, by=10),]
?viridis

# Checking rows
nrow(q_sample)

# Creating graph
ggplot(data = q_sample, aes(x=lat, y=long))+
  geom_point()

# Changes
ggplot(data = q_sample, aes(x=lat, y=long))+
  geom_point(aes(size=mag, color=mag))+
  guides(size=F)+
  scale_color_viridis_b(option = "B")+
  scale_size_continuous(range = c(1,9))+
  labs(x="Latitude", y=" Longitude", title = "Bubble plot")+
  ggsave("bubbleplot.pdf")


# jjtter graph
data("diamonds")
View(diamonds)
nrow(diamonds)

# Taking sample
d_sample <- diamonds[seq(from=1, to= 49000, by=10), ]
nrow(d_sample)

# Creating jjtter grapg

# ggplot(d_sample, aes(cut, price))+geom_point()

ggplot(d_sample, aes(cut, price, color= cut))+geom_jitter()
