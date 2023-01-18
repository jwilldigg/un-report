library(tidyverse)
getwd()
gapminder_data <- read_csv("data/gapminder_data.csv")

summarize(gapminder_data, averagelifeExp=mean(lifeExp))

#Learning to Pipe %>%

gapminder_summary <-  gapminder_data %>% summarize(averageLifeExp=mean(lifeExp))

#filtering

gapminder_data %>% filter(year == 2007)
# double equal sign is a logical operator sign like equivalent to. !=2007 means year not equal to 2007, everything but 2007 aka

gapminder_summary_2007 <- gapminder_data %>% filter(year == 2007) %>% summarize(average = mean(lifeExp))

view(gapminder_data, "year")

gapminder_data %>% summarize( Firstyear = min(year))

gapminder_data %>%
  filter(year == 1952) %>%
  summarize(average_gdp=mean(gdpPercap))

#Using group_by() accumulates all the same values together for that particular group. Allows the group to be summarized together

gapminder_data %>%
  group_by(year, continent) %>% summarize(average = mean(lifeExp), error=sd(lifeExp))

#Mutate, adds a new column onto the data frame

gapminder_data %>% mutate(gdp= pop * gdpPercap)


#mutate new column which is population in millions

gapminder_data %>% mutate(populaioninmillions=pop/1000000)

#Use select function

gapminder_data %>% select(pop, year)

# pivot wider (human version)

gapminder_data %>%
  select(country, continent, year, lifeExp) %>%
  pivot_wider(names_from = year, values_from = lifeExp) %>%
  View()

"co2-un-data.csv" <- read_csv("co2-un-data.csv")

co2_emissions_dirty <- read_csv("co2-un-data.csv", skip = 2,
         col_names = c("region", "country", "year", "series", "value", "footnotes", "source"))

co2_emissions_dirty %>% 
  select(country, year, series, value) %>%
  mutate(series = recode(series "Emissions (thousands metric tons of carbon dioxide)" = "total emissions", "Emissions per capita ("metric tons of carbon dioxide))

co2_emissions_dirty %>% 
  select(country, year, series, value) %>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions",
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions"))

co2_emissions_dirty %>%
  select(country, year, series, value) %>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emission",
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emission")) %>%
  pivot_wider(names_from=series, values_from=value)

#combine two data tables using common variables. Make sure values match

co2_2005 <- co2_emissions_dirty %>% select(country, year, series, value) %>% filter(year==2005)

view(co2_2005)

#filter is to select rows, select is to select column
co2_2005 <- co2_emissions_dirty %>% select(country, series, value) %>% filter(year==2005) %>% mutate(-year)
view(co2_2005)

co2_2005 <- co2_emissions_dirty %>%
  select(country, year, series, value) %>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total",
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita")) %>%
  pivot_wider(names_from=series, values_from=value) %>%
  filter(year==2005) %>%
  select(-year)

#bring in 2007 population data

gapminder_data_2007 <- read_csv("data/gapminder_data.csv") %>%
  filter (year==2007) %>%
  select(country, pop, lifeExp, gdpPercap)

inner_join(co2_2005, gapminder_data_2007, by = "country")

anti_join(co2_2005, gapminder_data_2007, by = "country")

anti_join(gapminder_data_2007, co2_2005, by = "country")

full_join(co2_2005, gapminder_data_2007) %>% View

co2_2005 %>% 
  left_join(gapminder_data_2007)

join_co2_pop <- inner_join(co2_2005, gapminder_data_2007)

#write csv

write_csv(join_co2_pop, file = "data/joined_co2_pop.csv")
