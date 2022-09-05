

# Header ------------------------------------------------------------------

pacman::p_load(
  tidyverse,
  sf,
  viridis
)

### File paths in this script are intended for rstudio.kuschnig.eu


# Load Data ---------------------------------------------------------------

load("~/visualization/adm2.Rdata")
load("~/visualization/data_full.RData")



# Plot Shapefile ----------------------------------------------------------

adm2 %>%
  ggplot() +
  geom_sf(size = 0.25) +
  labs(title = "",
       x = "",
       y = "") +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_plain.png", width = 6, height = 2)

adm2 %>%
  mutate(cr_type = ifelse(grepl("Kota", cr_name, fixed = TRUE), "city", "regency")) %>%
  ggplot() +
  geom_sf(aes(fill = cr_type), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "C/R Type") +
  scale_fill_manual(values = c("#eb6d59", "#dddddd")) +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_cr_type.png", width = 6, height = 2)



# Plot Different Choropleth Maps ------------------------------------------

data_full_with_shp <- adm2 %>%
  right_join(data_full, c("cr_code", "cr_name", "cr_statecode"))

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = expenditure), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "Expenditure") +
  scale_fill_viridis() +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_expenditure.png", width = 6, height = 2)

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = mean_schooling), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "Mean Schooling") +
  scale_fill_viridis() +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_mean_scholing.png", width = 6, height = 2)

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = exp_schooling), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "Exp. Schooling") +
  scale_fill_viridis() +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_exp_schooling.png", width = 6, height = 2)

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = hdi), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "HDI") +
  scale_fill_viridis() +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_hdi.png", width = 6, height = 2)

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = life_exp_birth), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "Life Exp.") +
  scale_fill_viridis() +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_life_exp_birth.png", width = 6, height = 2)

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = tree_cover), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "Tree Cover (%)") +
  scale_fill_viridis() +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_tree_cover.png", width = 6, height = 2)

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = as.factor(mining_dummy)), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "Mines") +
  scale_fill_manual(values = c("#dddddd", "#eb6d59"), labels = c("no", "yes")) +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_mining_dummy.png", width = 6, height = 2)

data_full_with_shp %>%
  filter(year == 2020) %>%
  ggplot() +
  geom_sf(aes(geometry = geometry, fill = mining_value), size = 0.25) +
  labs(title = "",
       x = "",
       y = "",
       fill = "Mining Activity") +
  scale_fill_viridis() +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("~/visualization/12_shapefile_mining_value.png", width = 6, height = 2)

