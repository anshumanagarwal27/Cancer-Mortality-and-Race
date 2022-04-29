# SIMULATION

# This file is used to simulate data used for the analysis

library(ggplot2)

set.seed(27)

county = rep(letters[1:10])

col1 = rnorm(n = 5, mean = 50, sd = 10)
col2 = rnorm(n = 5, mean = 50, sd = 10)
col3 = rnorm(n = 5, mean = 50, sd = 10)
col4 = rnorm(n = 5, mean = 50, sd = 10)
col5 = rnorm(n = 5, mean = 50, sd = 10)
col6 = rnorm(n = 5, mean = 50, sd = 10)
col7 = rnorm(n = 5, mean = 50, sd = 10)

sdf <- data.frame(states, col1, col2, col3, col4, col5, col6, col7)

ggplot(df, aes(county, col7)) +
  geom_point()