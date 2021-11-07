
# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr
)


# Read Data ---------------------------------------------------------------

adm2 <- st_read("./data/idn_admbnda_adm2_bps_20200401.shp")

cr_keys <- read_csv("./data/city_regency_keys.csv")


# Data Wrangling ----------------------------------------------------------

adm2[adm2$ADM2_EN == "Karang Asem", 3] <- "Karangasem"
adm2[adm2$ADM2_EN == "Mahakam Hulu", 3] <- "Mahakam Ulu"
adm2[adm2$ADM2_EN == "Pangkajene Dan Kepulauan", 3] <- "Pangkajene dan Kepulauan"

adm2 %<>%
  rename(cr_name = ADM2_EN) %>%
  left_join(cr_keys, by = "cr_name")


# # Check if only uninhabited landmarks have an NA value as ID
# 
# adm2 %>%
#   filter(is.na(cr_id)) %>%
#   pluck("cr_name") %>%
#   unique() %>%
#   sort()

adm2 %<>%
  select(-(4:14)) %>%
  drop_na()

adm2 %<>%
  drop_na()

adm2 %<>%
  relocate(4:3, 5:7, 1:2, 8)


# Save Data ---------------------------------------------------------------

save(adm2, file = "./dp/adm2.Rdata")
