
# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse
)


# Read Data ---------------------------------------------------------------

socec <- read_rds("./data/socec.RDS")

load("./data/adm2.Rdata")


# Data Wrangling ----------------------------------------------------------

# Get rid of naming inconsistencies

socec[socec$region == "Kep. Seribu", 1] <- "Kepulauan Seribu"
socec[socec$region == "Kota Makasar", 1] <- "Kota Makassar"
socec[socec$region == "Tojo UnaUna", 1] <- "Tojo Una-Una"
socec[socec$region == "ToliToli", 1] <- "Toli-Toli"

# Change variable names and join with shapefile for c/r codes

socec <- socec %>%
  rename(cr_name = region) %>%
  left_join(adm2, by = "cr_name")

# Drop NA values

socec <- socec %>%
  drop_na()

# Relocate of variables

socec <- socec %>%
  relocate(cr_code, cr_name, cr_statecode, year:hdi)

# Remove geometry column

socec <- socec %>%
  dplyr::select(-geometry)


# Save Data ---------------------------------------------------------------

save(socec, file = "./data/socec.Rdata")
