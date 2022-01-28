

# Header ------------------------------------------------------------------

# rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr,
  sf
)


# Intersect ---------------------------------------------------------------

# give every mine an unique id in order to later be able to identify mines
# that transcend city/regency boundaries

mining %<>%
  mutate(minecode = paste("mine_", 1:nrow(mining), sep = "")) %>%
  select(-1, -2)


# intersect city_regency polygons with mining polygons

mining_i <- st_intersection(adm2, mining)


# # plausibility check: check which percentage of c/r contains mines
# 
# mining_i %>%
#   pluck("cr_code") %>%
#   unique() %>%
#   length() %>%
#   `/`(nrow(adm2))


# extract the number of mines per city/regency

mcr_n <- mining_i %>%
  as_tibble() %>%
  group_by(cr_code) %>%
  summarize(nmine = n())


# sum up the area of all mines per city/regency

mcr_a <- mining_i %>%
  mutate(area = st_area(geometry)) %>%
  as_tibble() %>%
  group_by(cr_code) %>%
  summarize(mining_area = sum(area))


# # Save Data ---------------------------------------------------------------
# 
# save(mining, file = "./dp/mining.Rdata")
# save(mining_i, file = "./dp/mining_i.Rdata")
# save(mcr_n, file = "./dp/mcr_n.Rdata")
# save(mcr_a, file = "./dp/mcr_a.Rdata")

 