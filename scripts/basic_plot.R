library(tidyverse)

# Read in the data and have a look at what is available. The first row
# is skipped because it is descriptive rather than useful. Missing values
# are given as *** which R does not understand so we need to say what ***
# represents.
data <- read_csv("data/GLB.Ts+dSST.csv", skip = 1, na = "***") 
View(data)

# For the purposes of this exercise we only need the data for the year
# wich is represented by J-D and the Year.
data <- data %>% 
  select(year = Year, t_diff = 'J-D') %>% 
  arrange(year) # We want the year to be in order so we arrange the data by year.

# We can now plot the data as a line graph
data %>% 
  ggplot(aes(x = year, 
             y = t_diff)) +
  geom_line()

# There is an warning message that there is a row with missing values
# so we should get rid of it

data <- data %>% na.omit(.)
data %>% 
  ggplot(aes(x = year, 
             y = t_diff)) +
  geom_line()
# The error message no longer appears

# Pretty the graph up and give it a title
data %>% 
  ggplot(aes(x = year,
             y = t_diff)) +
  geom_line(colour = "gray") +
  geom_point() + 
  geom_vline(xintercept = 1938) +
  labs(x = "Year",
       y = "Difference in temperature from the 1938 value set as zero",
       title = "Change in the earth's global temperature since 1880") +
  theme_bw()
