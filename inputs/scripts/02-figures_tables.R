# This script creates the figures and tables using cleaned_data.csv available in the Outputs folder of the repo 

library(tidyverse)
library(ggplot2)
library(kableExtra)
library(MASS)
library(modelsummary)

data <- read_csv("cleaned_data.csv")

# Table 1: Slice of the dataset 
data[,-c(1,3,5)] |>
  slice(12:21) |> 
  kable(caption = "A slice of the Cancer Mortality Study Dataset", booktabs = T) |>
  kable_styling(latex_options = c("scale_down"))

################################################################################################################

# Scatterplots of Variables 

# death
data |>
  ggplot(mapping = aes(x = pct_w, y = death)) +
  geom_point() +
  geom_smooth(method = lm, colour = "green") +
  labs(x = "Percentage of White Residents in a county", y = "Age-adjusted death rate due to cancer (per 100,000)")

# incidence

# death
data |>
  ggplot(mapping = aes(x = incidence, y = death)) +
  geom_point() +
  geom_smooth(method = lm, colour = "red") +
  labs(x = "Age-adjusted incidence rate of all types of cancer (per 100,000)", y = "Age-adjusted death rate due to cancer (per 100,000)")
# pct_w
data |>
  ggplot(mapping = aes(x = pct_w, y = incidence)) +
  geom_point() +
  geom_smooth(method = lm, colour = "blue") +
  labs(x = "Percentage of White Residents in a county", y = "Age-adjusted incidence rate of all types of cancer (per 100,000)")

# insurance 

# death
data |>
  ggplot(mapping = aes(x = pct_unins , y = death)) +
  geom_point() +
  geom_smooth(method = lm, colour = "red") +
  labs(x = "Percentage of Residents without any kind of health insurance", y = "Age-adjusted death rate due to cancer (per 100,000)")
# pct_w
data |>
  ggplot(mapping = aes(x = pct_w, y = pct_unins)) +
  geom_point() +
  geom_smooth(method = lm, colour = "blue") +
  labs(x = "Percentage of White Residents in a county", y = "Percentage of Residents without any kind of health insurance")

# poverty

# death
data |>
  ggplot(mapping = aes(x = pct_pov , y = death)) +
  geom_point() +
  geom_smooth(method = lm, colour = "red") +
  labs(x = "Percentage of Residents living below poverty level", y = "Age-adjusted death rate due to cancer (per 100,000)")
# pct_w
data |>
  ggplot(mapping = aes(x = pct_w, y = pct_pov)) +
  geom_point() +
  geom_smooth(method = lm, colour = "blue") +
  labs(x = "Percentage of White Residents in a county", y = "Percentage of Residents living below poverty level")

# median income

# death
data |>
  ggplot(mapping = aes(x = med_inc , y = death)) +
  geom_point() +
  geom_smooth(method = lm, colour = "red") +
  labs(x = "Median Income of Households in a county", y = "Age-adjusted death rate due to cancer (per 100,000)")
# pct_w
data |>
  ggplot(mapping = aes(x = pct_w, y = med_inc)) +
  geom_point() +
  geom_smooth(method = lm, colour = "blue") +
  theme_minimal() +
  labs(x = "Percentage of White Residents in a county", y = "Median Income of Households in a county")

# SVI

# death
data |>
  ggplot(mapping = aes(x = svi , y = death)) +
  geom_point() +
  geom_smooth(method = lm, colour = "red") +
  labs(x = "Social Vulnerability Index ranking of the County", y = "Age-adjusted death rate due to cancer (per 100,000)")
# pct_w
data |>
  ggplot(mapping = aes(x = pct_w, y = svi)) +
  geom_point() +
  geom_smooth(method = lm, colour = "blue") +
  labs(x = "Percentage of White Residents in a county", y = "Social Vulnerability Index ranking of the County")

# population 

# death
data |>
  ggplot(mapping = aes(x = pop2020 , y = death)) +
  geom_point() +
  geom_smooth(method = lm, colour = "red") +
  labs(x = "Population of the County", y = "Age-adjusted death rate due to cancer (per 100,000)")
# pct_w
data |>
  ggplot(mapping = aes(x = pct_w, y = pop2020)) +
  geom_point() +
  geom_smooth(method = lm, colour = "blue") +
  labs(x = "Percentage of White Residents in a county", y = "Population of the County")

##############################################################################################################################

# Table 2 - Robust Regressions 

mod1 = lmrob(death ~ pct_w, data = data)
summary(mod1)

mod2 = lmrob(death ~ pct_w + incidence + pct_unins + pct_pov + med_inc + svi + pop2020, data = data)
summary(mod2)

models <- list("1" = mod1, "2" = mod2)

modelsummary(models, stars = TRUE, coef_omit = "Intercept", title = "Model Summary of a SLR case and the MLR case",
             coef_rename = c("pct_w" = "Percentage of White Residents", 
                             "incidence" = "Age-adjusted Incidence rate per 100,000",
                             "pct_unins" = "Percentage without Health Insurance",
                             "pct_pov" = "Percentage living below Poverty Level",
                             "med_inc" = "Median Income of Households",
                             "svi" = "Social Vulnerability Index of the county",
                             "pop2020" = "Population of the county",
                             exponentiate = FALSE)
)














