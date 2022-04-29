# 01-clean-and-prepare 
# This script uses 7 datasets which are publicly available and merges necessary columns to create the final cleaned_data.csv 
# Raw datasets are available in the Inputs folder of the repo 

library(tidyverse)

# Population
# Reading Data
pop_data <- read_csv(here::here("inputs/data/pop2020.csv"))
# Retrieving necessary columns - total number of white non-Hispanic residents in a county (P1_003N); total population of the county (P1_001N)
pop_data = pop_data[,c(1,3,5)]
# Creating pct_w - percentage of white residents in the county variable
pop_data$pct_w = (as.numeric(pop_data$P1_003N)/as.numeric(pop_data$P1_001N))*100

# Poverty
# Reading Data
pov_data <- read_csv(here::here("inputs/data/pov2020.csv"))
# Retrieving necessary columns - pct below poverty level in a county (S1701_C03_001E)
pov_data = pov_data[,c(1,247)]

# Step 1: Merging Pop and Pov Datasets based on unique county identifier - GEO ID
step_1 <- merge(pop_data, pov_data, by = "GEO_ID")

# Median Income
# Reading Data
inc_data <- read_csv(here::here("inputs/data/inc2020.csv"))
# Retrieving necessary columns - Median Household Income (S1903_C03_001E)
inc_data = inc_data[,c(1,163)]

# Step 2: Merging Income with Step 1 using GEO ID
step_2 <- merge(step_1, inc_data, by = "GEO_ID")

# Health Insurance
# Reading Data
insurance_data <- read_csv(here::here("inputs/data/insurance.csv"))
# Retrieving necessary columns - Percentage without Health Insurance (S2701_C05_001E)
insurance_data = insurance_data[,c(1,491)]

# Step 3: Merging Step 2 with Insurance data using GEO ID
step_3 <- merge(step_2, insurance_data, by = "GEO_ID")

# Creating FIPS county identifier variable - the last 5 digits of FIPS
step_3$FIPS = substr(step_3$GEO_ID, 10, 14)
step_3$FIPS = as.numeric(step_3$FIPS)

# Delete observation for the entire US
step_3 = na.omit(step_3)

# Age-adjusted incidence rate of all types of cancer 
# Reading data
incd_data <- read_csv(here::here("inputs/data/incd.csv"))
# Retrieving necessary columns - Age-Adjusted Incidence Rate
incd_data = incd_data[,c(2,3)]
  ## Has missing observations - systemic reason addressed in the paper 

# Step 4: Merging Incidence data with Step 3 using FIPS county code
step_4 <- merge(step_3, incd_data, by = "FIPS")
 

# Age-adjusted mortality rate due to all types of cancer 
# Reading Data
death_data <- read_csv(here::here("inputs/data/death.csv"))
# Retrieving necessary columns - Age-Adjusted Mortality Rate
death_data = death_data[,c(2,3)]
  ## Has missing observations - systemic reason addressed in the paper 

# Step 5: Merging Death rate with Step 4 using FIPS county code
step_5 <- merge(step_4, death_data, by = "FIPS")

## Social Vulnerability Index
# Reading data
svi <- read_csv(here::here("inputs/data/SVI2018_US_COUNTY.csv"))
# Retrieving necessary columns - FIPS and SVI
svi = svi[,c(5,98)]

# Final Step: Merging SVI data with Step 5
cleaned_data = merge(step_5, svi, by = "FIPS")
colnames(cleaned_data) = c("FIPS", "GEO_ID", "pop2020", "pop2020_w", "pct_w", "pct_pov", "med_inc", "pct_unins", "incidence", "death","svi")

str(cleaned_data)
# incidence is class - chr (needs to be recoded)
# missing obs need to be deleted

# Re-coding incidence rates as numeric
cleaned_data$incidence = as.numeric(cleaned_data$incidence)

cleaned_data = na.omit(cleaned_data)

write_csv(cleaned_data, here("output/data/cleaned_data.csv"))


# END OF SCRIPT
























