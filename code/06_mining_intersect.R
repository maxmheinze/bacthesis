

# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr,
  sf,
  lwgeom
)

load("./data/mining.Rdata")
load("./data/adm2.Rdata")
load("./data/mining_values.Rdata")

sf_use_s2(FALSE)

# Intersect ---------------------------------------------------------------

# Give every mine an unique id in order to later be able to identify mines
# that transcend city/regency boundaries

mining %<>%
  mutate(minecode = paste("mine_", 1:nrow(mining), sep = "")) %>%
  dplyr::select(-1, -2)

# Intersect city/regency polygons with centroids of mining polygons

mining_i <- st_intersection(adm2, st_centroid(mining)) %>%
  st_drop_geometry() %>%
  dplyr::select(cr_code, minecode)

# Join with mining values to get one value per c/r and year

mining_cr <- mining_values %>%
  left_join(mining_i, by = "minecode") %>%
  group_by(cr_code, year) %>%
  summarize(mining_value = sum(mining_value)) %>%
  drop_na() %>%
  ungroup()


# Save Data ---------------------------------------------------------------

save(mining, file = "./data/mining.Rdata")
save(mining_cr, file = "./data/mining_cr.Rdata")


 