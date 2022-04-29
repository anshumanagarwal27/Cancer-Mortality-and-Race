# The Relationship between Mortality from Cancer and Race
This repository contains the R project and the necessary file for the paper titled: "Socio-economic Inequality Due to Race Fails to Explain Variation of Cancer Mortality in US counties"

### Folders
This repository contains the following folders: 
- **input**: This folder contains the raw data that was accquired from the US Census data and National Cancer Institute data. It also contains the scripts used to clean the data, the exploratory data analysis and the regression models. 
- **output**: This folder contains the cleaned data and the paper in the PDF format, the R Markdown file and the references file. 


### Instructions to generate paper
- Open the R-project 
- Open the R-markdown file in the output folder
- Run the first chunk of code which is commented as setup. This will load all the required libraries if they are required. 
- Run all individual chunks to see for errors associated with the version of R the project is being run on, or if LaTex is not installed. 
- Knit the R markdown file to generate the PDF. 



If more help is needed please contact: anshuman.agarwal@mail.utoronto.ca


Data Sources: 

- Population: U.S. Census Bureau, (2020) Decennial Census. [Data file]. Retrieved from:https://data.census.gov/cedsci/table?q=United%20States&t=Populations%20and %20People&g=0100000US%240500000&tid=DECENNIALPL2020.P1&hidePrevie w=true
- Insurance: U.S. Census Bureau, (2020) 2015-2019 American Community Survey 5- Year Estimates [Data file]. Retrieved from: https://data.census.gov/cedsci/table?q=United%20States&t=Health%20Insurance&g= 0100000US%240500000&tid=ACSST5Y2019.S2701&hidePreview=true
- Income & Poverty: U.S. Census Bureau, (2020) 2015-2019 American Community Survey 5-Year Estimates [Data file]. Retrieved from: https://data.census.gov/cedsci/table?q=United%20States&t=Poverty&g=0100000US %240500000&tid=ACSST5Y2019.S1701&hidePreview=true
- Incidence: National Cancer Institute, (2020) SEER program. [Data file]. Retrieved from:https://statecancerprofiles.cancer.gov/incidencerates/index.php?stateFIPS=00&a reatype=county&cancer=001&race=00&sex=0&age=001&stage=999&year=0&type =incd&sortVariableName=rate&sortOrder=desc&output=1
- Mortality: National Cancer Institute, (2020) SEER program. [Data file]. Retrieved from:https://statecancerprofiles.cancer.gov/deathrates/index.php?stateFIPS=00&areat ype=county&cancer=001&race=00&sex=0&age=001&year=0&type=death&sortVari ableName=rate&sortOrder=desc&output=1
- SVI: Centers for Disease Control and Prevention/ Agency for Toxic Substances and Disease Registry/ Geospatial Research, Analysis, and Services Program. CDC/ATSDR Social Vulnerability
Index [2018] Database [US]. https://www.atsdr.cdc.gov/placeandhealth/svi/data_docu mentation_download.html. Accessed on [20-04-2022].
