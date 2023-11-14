# Load the dataset
mpg <- read.csv("mpg.csv")

# barplot creation
barplot(table(mpg$drv), 
        main = "DRV barplot",
        xlab = "drv",
        ylab = "Frequency",
        col = "orange")
