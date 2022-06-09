
# Header ------------------------------------------------------------------

# rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr
)


# Read Data ---------------------------------------------------------------

socec <- read_rds("./data/socec.RDS")


# Data Wrangling ----------------------------------------------------------

socec[socec$region == "Kep. Seribu", 1] <- "Kepulauan Seribu"
socec[socec$region == "Kota Makasar", 1] <- "Kota Makassar"
socec[socec$region == "Tojo UnaUna", 1] <- "Tojo Una-Una"
socec[socec$region == "ToliToli", 1] <- "Toli-Toli"

socec %<>%
  rename(cr_name = region) %>%
  left_join(adm2, by = "cr_name")

# Check if only level-1 or level-0 aggregates have an NA value as ID

# socec %>%
#   filter(is.na(cr_code)) %>%
#   pluck("cr_name") %>%
#   unique() %>%
#   sort()

socec %<>%
  drop_na()

socec %<>%
  relocate(8, 1, 9, 2:7)

socec %<>%
  dplyr::select(-geometry)


# Save Data ---------------------------------------------------------------

save(socec, file = "./data/socec.Rdata")
