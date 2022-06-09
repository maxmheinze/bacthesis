
# Header ------------------------------------------------------------------

# rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr,
  sf
)


# Read Data ---------------------------------------------------------------

mining <- st_read("./data/global_mining_polygons_v1.gpkg")



# Data Wrangling ----------------------------------------------------------

mining %<>%
  filter(ISO3_CODE == "IDN") %>%
  dplyr::select(-2)



# # Save Data ---------------------------------------------------------------

 save(mining, file = "./data/mining.Rdata")
