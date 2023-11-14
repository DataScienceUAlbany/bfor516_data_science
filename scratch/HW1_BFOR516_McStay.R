# BFOR 516 HW1

#### Complete the following questions:

#-   What is a barplot? Draw barplot for the 'drv' variable using R or Python.
#-   What is a histogram? Draw histograms for highway miles per gallon. One for each drv type using R/Python. The histograms should be on the same scale for visual comparison.
#-   What is a box plot? Draw box plots for highway miles per gallon variable - one for each drv type in R/Python. The box plots should be on the same scale for visual comparison. What can you conclude from this box plot?
  
  ##### Load Packages
  
  ```{r, message = FALSE}
library(tidyverse)
library(knitr)
library(DT)
library(dplyr)
```

##### Load Data

```{r}
dat_mpg <- mpg
dim(dat_mpg)
dat_mpg %>% head() %>% knitr::kable()
```

## What is a barplot? Draw a barplot for the 'drv' variable using R or Python.

a)  a graph that shows the  relationships between a  selected value and a category.

```{r}
ggplot() + geom_bar(data = dat_mpg,
                    mapping = aes(x = drv), width = .3) +
  theme(legend.position = "none",
        text = element_text(size = 20),
        axis.text.x = element_text(angle = 0))
```

## What is a histogram? Draw histograms for highway miles per gallon. One for each drv type using R/Python. The histograms should be on the same scale for visual comparison.

#a)   a graph which shows the frequency of a results occurance across a category.
#b)  Drive type Forward is displayed in blue, drive type 4 is displayed in green, and drive type rear is displayed in red

```{r}
drvF <- dplyr::filter(dat_mpg, drv %in% c('f'))
drv4 <- dplyr::filter(dat_mpg, drv %in% c('4'))
drvR <- dplyr::filter(dat_mpg, drv %in% c('r'))

drvFhist <- hist(drvF$hwy, main = "Front wheel drive Highway MPG")
drv4hist <- hist(drv4$hwy, main = "All wheel drive Highway MPG")
drvRhist <- hist(drvR$hwy, main = "Rear wheel drive Highway MPG")

plot(drvFhist, col = "blue", xlim = c(12, 45), ylim = c(0,64), main = "All Drive Types MPG")
plot(drv4hist, col = "green", add = TRUE)
plot(drvRhist, add = TRUE, col = "red")
```

## What is a box plot? Draw box plots for highway miles per gallon variable - one for each drv type in R/Python. The box plots should be on the same scale for visual comparison. What can you conclude from this box plot?

#a) A graph designedto show the spread and skew of data points whithin a dataset useful for determining outliers.

```{r}
boxDrvF <- drvF$hwy
boxDrv4 <- drv4$hwy
boxDrvR <- drvR$hwy

boxplot(boxDrvF, boxDrv4, boxDrvR, main = "Boxplots for each drv type", 
        names = c("Drv F", "Drv 4", "Drv R"), col = c("orange", "red", "blue"), 
        horizontal = TRUE)

```

#b)  Frontwheel drive has the highest mpg on average. The largest interquartile range belongs to the rear wheel drive vehicles. The median of mpg for 4-wheel drive vehicles was the lowest, but it also had the greatest range, between the min and max
  

  