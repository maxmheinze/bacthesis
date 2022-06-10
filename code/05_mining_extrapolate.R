
# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  sf,
  raster,
  rgdal,
  mapview
)


# Load Data ---------------------------------------------------------------

# Night light data

nl12 <- raster("./data/idn_nightlights_2012.tif")
nl13 <- raster("./data/idn_nightlights_2013.tif")
nl14 <- raster("./data/idn_nightlights_2014.tif")
nl15 <- raster("./data/idn_nightlights_2015.tif")
nl16 <- raster("./data/idn_nightlights_2016.tif")
nl17 <- raster("./data/idn_nightlights_2017.tif")
nl18 <- raster("./data/idn_nightlights_2018.tif")
nl19 <- raster("./data/idn_nightlights_2019.tif")
nl20 <- raster("./data/idn_nightlights_2020.tif")

# Data about mines

load("./data/mining.Rdata")

# List of night light file names

nl_list <- c("nl12", "nl13", "nl14", "nl15", "nl16",
             "nl17", "nl18", "nl19", "nl20")

# Mine locations, but buffered, buffer is 10 arc seconds ~ 309 meters
# at equator

mining_buffered <- st_buffer(mining, 0.00277777777778)


# Extract points that intersect with buffered mining polygons -------------

# For each NL year, extract night light activity that is within the
# buffered mining polygons

for(nlyr in nl_list) {
  a <- extract(eval(parse(text = nlyr)), mining_buffered)
  assign(paste("mines_b_", nlyr, sep = ""), a)
  print(paste(nlyr, " done", sep = ""))
}


# Concatenate  ------------------------------------------------------------

# Create a matrix in which to store median night light values per year and
# mine

mines_b_nl_medians <- matrix(ncol = length(nl_list), nrow = nrow(mining_buffered))

# For all night light years, store the median of all NL points that are
# within the corresponding mining polygon inside the proper column and row
# in the matrix

i = 1

for(nlyr in nl_list) {
  a <- lapply(eval(parse(text = paste("mines_b_", nlyr, sep = ""))), FUN=median)
  a <- unlist(a)
  mines_b_nl_medians[,i] <- a
  i = i + 1
  print(paste(nlyr, " done", sep = ""))
}

# Convert matrix to a data frame and adjust column names

mines_b_nl_medians <- as.data.frame(mines_b_nl_medians)

colnames(mines_b_nl_medians) <- nl_list


# Create Mining Index -----------------------------------------------------

# Bind night light values to original mining data and adjust the format
# for further processing. Standardize night light values by dividing
# by sd()

mining_values_prepare <- cbind(mines_b_nl_medians, mining) %>%
  dplyr::select(-ISO3_CODE) %>%
  mutate(minecode = paste("mine_", 1:nrow(mining), sep = "")) %>%
  pivot_longer(nl12:nl20, names_prefix = "nl") %>%
  mutate(year = 2000 + as.numeric(name)) %>%
  mutate(value = value / sd(value)) %>%
  dplyr::select(minecode, year, value, AREA)

# Create a vector of codes for mines that have at least one year where
# NL activity is not 0

mines_with_data <- mining_values_prepare %>%
  group_by(minecode) %>%
  summarize(value = sum(value)) %>%
  filter(value != 0) %>%
  pluck("minecode")

# Calculate median NL activity for mines for each year. Only use
# mines in mines_with_data for that

median_nl_per_year <- mining_values_prepare %>%
  filter(minecode %in% mines_with_data) %>%
  group_by(year) %>%
  summarize(median_value = median(value))

# Subset mines with data, do nothing more to them

mining_values_1 <- mining_values_prepare %>%
  filter(minecode %in% mines_with_data)

# Subset mines without data and assign yearly median values as NL 
# values to those

mining_values_2 <- mining_values_prepare %>%
  filter(!(minecode %in% mines_with_data)) %>%
  left_join(median_nl_per_year, by = "year") %>%
  mutate(value = median_value) %>%
  dplyr::select(-median_value)

# Bind both subsets together and calculate a mining index as the 
# product of mine area and NL activity

mining_values <- rbind(mining_values_1, mining_values_2) %>%
  mutate(mining_value = value * AREA) %>%
  dplyr::select(minecode, year, mining_value)


# Save Data ---------------------------------------------------------------

save(mining_values, file = "./data/mining_values.Rdata")


            