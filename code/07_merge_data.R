

# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse
)

load("./data/adm2.Rdata")
load("./data/socec.Rdata")
load("./data/lu.Rdata")
load("./data/mining_cr.Rdata")


# Merge Data --------------------------------------------------------------

# Join all separate data sets together, filter for years after 2012 
# (because mining data starts in 2012)

data_full <- socec %>%
  left_join(lu, by = c("cr_code", "year")) %>%
  left_join(mining_cr, by = c("cr_code", "year")) %>%
  filter(year >= 2012)

# NA values occur only in the mining activity variable, and only for
# c/r with 0 mines. Therefore change them to 0

data_full[is.na(data_full)] <- 0

data_full <- data_full %>%
  mutate(mining_dummy = ifelse(mining_value == 0, 0, 1))


# Export Data -------------------------------------------------------------

save(data_full, file = "./data/data_full.RData")

write_rds(data_full, file = "./data/data_full.rds")

write_csv(data_full, file = "./data/data_full.csv")
