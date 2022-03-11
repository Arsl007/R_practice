# publication ready graph
install.packages("ggthemes")
install.packages("multcompView")
install.packages("dplyr")

# load libraries
library(ggplot2)
library(ggthemes)
library(multcompView)
library(dplyr)

## 1- load or import your data
data("chickwts")
tibble(chickwts)

# 2- Calculate the "means" of you of treatment group and the SD 
#to show the error bars as functions

# feed our treatment in this example
mean_data <- group_by(chickwts, feed) %>% 
  summarise(weight_mean= mean(weight), sd = sd(weight))%>% 
  arrange(desc(weight_mean))#to arrange in descending order
tibble(mean_data)

# 3- This step involves performing analysis of variance "ANOVA"

# using the built in function ***aov()*** .
anova <- aov(weight~feed, data = chickwts)
summary(anova)

# 4- If the ANOVA is significantly different then,

# we will draw the multiple mean comparison 
tukey <- TukeyHSD(anova)
tukey

# 5- Draw the Multiple comparison letters using "multcomp" 

# R packages are as follows:
group_letter <- multcompLetters4(anova, tukey)
group_letter

# Extracting group letters
group_letter <- as.data.frame.list(group_letter$feed)
group_letter

# Adding to the mean data
mean_data$group_letters <- group_letter$Letters
tibble(mean_data)

# 6- Draw the publication ready Barplot* in ggplot2
p <- ggplot(mean_data, aes(x = feed, y = weight_mean))+
  # Bar plot
   geom_bar(stat = "identity", aes(fill = feed), show.legend = FALSE, width = 0.6)+
  geom_errorbar(# this argument is putting SD as error bars
    aes(ymin = weight_mean-sd, ymax = weight_mean+sd), width = 0.1)+
  # Adding letters
  geom_text(aes(label = group_letters, y = weight_mean+sd), vjust = -0.4)+
  scale_fill_brewer(palette = "BrBG", direction = 1)+ #theme setting
  labs(# This will add labels
    x = "Feed Type",
    y = "Chicken Weight(g)",
    title = "Publication read bar plot",
    subtitle = "Made by # Rwith Aammar",
    fill = "Feed Type")+
  ylim(0,410)+ # Change your y axis limits based on the letters
  ggthemes::theme_par();p

# 7- Saving up-to 4k bar plot in R

tiff("Bar plot.tiff", units = "in", width = 10, height = 6,
     res = 300, compression = "lzw")
p
dev.off()




  