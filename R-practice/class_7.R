# Data visualization 
install.packages("ggplot2")
library(ggplot2)

# ggplot (function)
# Data
# Mapping(x-axis, y-axis)
# Geometry(name of graph, like scatter, box, line etc)

library(readxl)
x <- read_excel("D:/R/test1/test1/ggdata.xlsx", 
                     col_types = c("text", "numeric", "text", 
                                   "text"))
View(ggdata)

# ggplot
ggplot(data = x, mapping = aes(x=crop, y=height))+ geom_point()

# in ggplot it knowns what is meant by data, aes etc.
ggplot(x, aes(crop, height))+
  geom_point(size=3)+
  geom_line()

# box plot
ggplot(x, aes(crop, height))+
  geom_boxplot()+
  geom_point(size=3, colour="red", alpha= 0.8)

# other variable
ggplot(x, aes(crop, height, color= water))+
  geom_boxplot()

# inside filling
ggplot(x, aes(crop, height, fill= water))+
  geom_boxplot()

# Divide according to fert.type
ggplot(x, aes(crop, height, fill= water))+
  geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Crop Type", y="Plant height (cm)",
      title = "Plant Growth")+
  theme_bw()+
  ggsave("ggplot.tiff", units = "in", width = 8, height = 6, dpi = 300, compression = "lzw")
  
# variation
ggplot(x, aes(crop, height, fill= water))+
  geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Crop Type", y="Plant height (cm)",
       title = "Plant Growth")+
  theme_bw()+
  coord_flip()+
  ggsave("ggplot.tiff", units = "in", width = 8, height = 6, dpi = 300, compression = "lzw")
