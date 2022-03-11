# install packages
install.packages("ggplot2")
install.packages("ggpval")

# load packages 
library(ggpval)
library(ggplot2)
library(ggthemes)

# Draw plot
data("ToothGrowth")

p <- ggplot(ToothGrowth)+
  aes(x= supp, y= len, fill= supp)+
  geom_boxplot(shape = "circle", width=0.5)+
  stat_boxplot(geom = "errorbar", width=0.1)+
  scale_fill_viridis_d(option = "inferno", direction = 1)+
  labs(x= "Supplement", y= "Length", fill= "Supplement")+
  ggthemes::theme_par()+
  facet_wrap(vars(dose));p

# Add p_value
add_pval(p, pairs = list(c(1,2)),
         test = "t.test")

# for more information
help("add_pval")
