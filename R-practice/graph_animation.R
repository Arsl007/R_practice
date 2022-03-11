#Animation?


#Rapid display of Sequence of images
#. Illusion of movement
#. Optical Illusion due to static eye
#Motion picture or Video
#. 2D or 3D animation

# Packages needs to be installed
#install.packages("ggplot2")
#install.packages('gganimate')
#install.packages ("gifski")
#install.packeges("av")

#load libaraies
library(ggplot2)
library(gifski)
library(av)
library(gapminder)
library(gganimate)
theme_set(theme_bw())

# dataset

head(gapminder)

# Static plot

p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p

# Transition through distinct states in time

p + transition_time(year) +
  labs(title = "Year: {frame_time}")

# Create facets by continent

p + facet_wrap(~continent) +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

# Let the view follow the data in each frame
p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  view_follow(fixed_y = TRUE)

# Show preceding frames with gradual falloff

p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)

# Show the original data as background marks

p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  shadow_mark(alpha = 0.3, size = 0.5)

#Reveal data along a given dimension
# Static plot

p <- ggplot(
  airquality,
  aes(Day, Temp, group = Month, color = factor(Month))
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Day of Month", y = "Temperature") +
  theme(legend.position = "top")
p

## Reveal by day (x-axis)
p + transition_reveal(Day)

# Reveal by day (x-axis)

p + 
  geom_point() +
  transition_reveal(Day)

# Points can be kept by giving them a unique group

p + 
  geom_point(aes(group = seq_along(Day))) +
  transition_reveal(Day)

# Transition between several distinct stages of the data
library(dplyr)
mean.temp <- airquality %>%
  group_by(Month) %>%
  summarise(Temp = mean(Temp))
mean.temp

# Create a bar plot of mean temperature
p <- ggplot(mean.temp, aes(Month, Temp, fill = Temp)) +
  geom_col() +
  scale_fill_distiller(palette = "Reds", direction = 1) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "white"),
    panel.ontop = TRUE
  )
p

# transition_states()
p + transition_states(Month, wrap = FALSE) +
  shadow_mark()

#enter_grow() + enter_fade()

p + transition_states(Month, wrap = FALSE) +
  shadow_mark() +
  enter_grow() +
  enter_fade()
anim_save("barplot.gif")
















