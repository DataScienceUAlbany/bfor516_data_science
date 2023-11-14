# Load the dataset

mpg <- read.csv('mpg.csv')

ggplot() + 
  geom_boxplot(data = mpg, 
               mapping = aes(x = drv, y = hwy, fill= drv)) +
  theme(text = element_text(size = 12), legend.position = "top") 
