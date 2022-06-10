
# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr,
  sf
)


# Read Data ---------------------------------------------------------------

adm2 <- st_read("./data/idn_admbnda_adm2_bps_20200401.shp")


# Data Wrangling ----------------------------------------------------------

# Get rid of naming inconsistencies

adm2[adm2$ADM2_EN == "Karang Asem", 3] <- "Karangasem"
adm2[adm2$ADM2_EN == "Mahakam Hulu", 3] <- "Mahakam Ulu"
adm2[adm2$ADM2_EN == "Pangkajene Dan Kepulauan", 3] <- "Pangkajene dan Kepulauan"

# Change variable names

adm2 <- adm2 %>%
  rename(cr_name = ADM2_EN,
         cr_code = ADM2_PCODE,
         cr_statecode = ADM1_PCODE)

# Drop irrelevant variables

adm2 <- adm2 %>%
  dplyr::select(cr_code, cr_name, cr_statecode) %>%
  drop_na()


# Save Data ---------------------------------------------------------------

save(adm2, file = "./data/adm2.Rdata")

