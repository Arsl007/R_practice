# Violin plot

# geom_violin()
library(ggplot2)

# Load data set
data("diamonds")
View(diamonds)
nrow(diamonds)

# Taking sample
d_sample <- diamonds[seq(from=1, to= 53000, by=100), ]
nrow(d_sample)

# plot
p <- ggplot(data = d_sample, aes(x= cut, y= price, color=cut))+
  geom_violin()

p + geom_boxplot(width=0.1)+geom_jitter(size=0.5)
p+ggsave("box and violin plot.pdf")
 