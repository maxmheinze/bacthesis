

# Header ------------------------------------------------------------------

# rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr,
  sf
)



# Prepare DF --------------------------------------------------------------


indonesia_land_use_socec <- socec %>%
  left_join(
    lu %>%
      rename(cr_code = ADM2_PCODA) %>%
      replace(is.na(.), 0),
    by = c("cr_code", "year")
  ) %>%
  relocate(year, .before = cr_code) %>%
  mutate(area = st_area(geometry)) %>%
  relocate(area, .before = cropland_rainfed) %>%
  as_tibble() %>%
  select(-geometry) %>%
  mutate(area = area * as.numeric(10^-6))

write.csv(indonesia_land_use_socec, "~/Downloads/indonesia_land_use_socec.csv")
write_rds(indonesia_land_use_socec, "~/Downloads/indonesia_land_use_socec.rds")


