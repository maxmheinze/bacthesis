
# Header ------------------------------------------------------------------

# rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr
)


# Read Data ---------------------------------------------------------------

lu <- readRDS("./data/landuse.RDS")
load("./data/adm2.Rdata")


# Transform ---------------------------------------------------------------

lu[is.na(lu)] <- 0

lu <- lu %>% 
  rename(cr_code = ADM2_PCODA) %>%
  mutate(cropland = 
           cropland_rainfed +
           cropland_rainfed_herbaceous_cover +
           cropland_rainfed_tree_or_shrub_cover +
           cropland_irrigated,
         tree_cover = 
           tree_broadleaved_evergreen_closed_to_open +
           tree_cover_flooded_fresh_or_brakish_water +
           tree_cover_flooded_saline_water +
           tree_needleleaved_deciduous_closed_to_open,
         urban =
           urban,
         water =
           water,
         other_veg =
           shrubland +
           shrubland_evergreen +
           mosaic_cropland +
           mosaic_natural_vegetation +
           mosaic_herbaceous +
           mosaic_tree_and_shrub +
           sparse_vegetation +
           grassland,
         .keep = "unused") %>%
  dplyr::select(cr_code, year, tree_cover, cropland, other_veg, urban, water)

lu <- lu %>%
  left_join(adm2, by = "cr_code") %>%
  mutate(area_total = units::set_units(st_area(geometry) / 10^9, NULL)) %>%
  dplyr::select(-geometry, -cr_name, -cr_statecode) %>%
  mutate(area_tree_cover = tree_cover * area_total,
         area_cropland = cropland * area_total,
         area_other_veg = other_veg * area_total,
         area_urban = urban * area_total,
         area_water = water * area_total)


# Save Data ---------------------------------------------------------------

save(lu, file = "./data/lu.Rdata")
