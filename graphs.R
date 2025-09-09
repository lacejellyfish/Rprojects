#Various graphs

#Scatter plot with linear regression
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = 6),show.legend = FALSE) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linewidth = 4),show.legend = FALSE, se = FALSE)

#Scatter plot with multiple lines of regression
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = 2.5), show.legend = FALSE) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), linewidth = 3, se = FALSE)

#Scatter plot and lines in color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv), size = 6) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv), se = FALSE, size = 3)

#Colored scatterplot with linear regression
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv), size = 6) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE, size = 3)

#Colored scatterplot with dashed and dotted lines of regression
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv), size = 6) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE, size = 2.5)

#Plain color scatterplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv), size = 6)
