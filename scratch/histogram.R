# Load the dataset
mpg <- read.csv("mpg.csv")
ggplot() + 
  geom_histogram(data = mpg, 
                 mapping = aes(x=hwy), 
                 color="green", bins = 20) +
  theme(text = element_text(size = 15)) 
