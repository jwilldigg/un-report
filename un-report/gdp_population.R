# Analyze with gapminder data life expectancy and CO2 emissions vs population
# Jan 17, 2023
# Author: Jessica Willdigg
2+2

# loda packages for analysis
library("tidyverse")

# read data for analysis
gapminder_1997 <- read_csv("gapminder_1997")
read_csv <- ("gapminder_1997.csv")
gapminder_1997 <- read_csv("gapminder_1997.csv")
name <- Ben
name <- "Ben"
name
age <- "26"
name <- "Harry Potter"
name
age
round(3.1415)
round(3.1415,3)
round(x = 3.1415)
round (x = 3.1415, digits = 2)
round(2, 3.1415)
round(x=3.1415)
install.packages("readxl")
library("readxl")

#Plotting data for visualization 

ggplot(data = gapminder_1997) + 
  aes(x = gdpPerCap)
rlang::last_error()
ggplot(data = gapminder_1997)
ggplot(data = gapminder_1997) + 
  aes(x = gdpPerCap)
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) + 
  labs(x = "GDP Per Capita") + 
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") + 
  geom_point() + 
  labs(title = "Do People in Wealth Countries Live Longer?") +
  aes(color = continent) +
  scale_color_brewer(palette = "Set1")  +
  aes(size = pop) +
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)") +
  aes(shape = continent)

#short handed ggPlot

ggplot(data = gapminder_1997,
        aes(x = gdpPercap, y = lifeExp, color = continent, shape = continent, size = pop)) +
  labs(x = GDP per Capita, y = Life Expectancy, title = "Do People in wealthy countries life linger?" , size = "Population (in millions")

# Read in all data from gapminder (more years)

gapminder_data <- read_csv("gapminder_data.csv")
 # View command, indicates console is waiting, there might be a hanging paranthesis, Press "Esc" in the console to reset the console
# to view table, go to env and double click table icon to open table in new tab.
dim(gapminder_data)
head(gapminder_data)
tail(gapminder_data)

ggplot(data = gapminder_data) + aes( x= year, y = lifeExp, color = continent, group = country) + geom_line()

# learn about data, str shows attributes of the data. $ indicates columns. Num data is non whole numbers
# can use aes function "group" to data is grouped. 
str(gapminder_data)

ggplot(data = gapminder_1997) + aes(x = continent, y = lifeExp) +
  labs( x = "Life Expectancy", y = "Continent", title = "Life Expectancy vs Continent") +
  aes( color = continent) +
  geom_jitter(aes(size = pop)) +
  geom_violin() 
  
# Make a histogram to understand the range of the data

ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20) +
  theme_classic()

install.packages("ggprism")
library("ggprism")
?theme_ggprism

lifeExp_his <- ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20) +
  theme_classic()

# load in packages necessary for analysis at top of script usling library(package name)

#facet wrap makes multiple graphs based on a specified variable 
ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() +
  facet_wrap(vars(continent))

ggsave("awesome_plot.tiff", device = tiff, width = 6, height = 4)
?ggsave

ggsave("lifeExp_his.jpg")

library(ggplot)
library(ggplot2)

#facet wrap makes multiple graphs based on a specified variable 
ggplot(gapminder_1997) + aes(x = gdpPercap, y = lifeExp) + geom_point() +
  facet_wrap(vars(continent))

