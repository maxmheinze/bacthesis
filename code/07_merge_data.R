

# Header ------------------------------------------------------------------

# rm(list = ls())

pacman::p_load(
  tidyverse
)

load("./data/adm2.Rdata")
load("./data/socec.Rdata")
load("./data/lu.Rdata")
load("./data/mining_cr.Rdata")


# Merge Data --------------------------------------------------------------

adm2 %>%
  st_drop_geometry()

data_full <- socec %>%
  dplyr::select(-geometry) %>%
  left_join(lu, by = c("cr_code", "year")) %>%
  left_join(mining_cr, by = c("cr_code", "year"))

data_full[is.na(data_full)] <- 0


# Export Data -------------------------------------------------------------

save(data_full, file = "./data/data_full.RData")
write_rds(data_full, file = "./data/data_full.rds")
