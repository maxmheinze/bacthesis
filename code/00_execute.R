

# Header ------------------------------------------------------------------

rm(list = ls())



# Prepare Data ------------------------------------------------------------

# Read in the shapefile and prepare it for further use

source("./code/01_shapefile_prepare.R")

# Read in socio-demographic data and prepare it for further use

source("./code/02_socec_prepare.R")

# Read in land use data and prepare it for further use

source("./code/03_landuse_prepare.R")

# Read in data about mines and prepare it for further use

source("./code/04_mines_prepare.R")

# Create a mining index that is available as a time series

source("./code/05_mining_extrapolate.R")

# Aggregate mines on city/regency level

source("./code/06_mining_intersect.R")

# Merge all data to one data frame

source("./code/07_merge_data.R")


# Data Exploration and Plots ----------------------------------------------




# Modeling ----------------------------------------------------------------


