
# Header ------------------------------------------------------------------

pacman::p_load(
  tidyverse,
  sf,
  raster,
  rgdal,
  mapview
)


# Load Data ---------------------------------------------------------------

nl12 <- raster("./data/idn_nightlights_2012.tif")
nl13 <- raster("./data/idn_nightlights_2013.tif")
nl14 <- raster("./data/idn_nightlights_2014.tif")
nl15 <- raster("./data/idn_nightlights_2015.tif")
nl16 <- raster("./data/idn_nightlights_2016.tif")
nl17 <- raster("./data/idn_nightlights_2017.tif")
nl18 <- raster("./data/idn_nightlights_2018.tif")
nl19 <- raster("./data/idn_nightlights_2019.tif")
nl20 <- raster("./data/idn_nightlights_2020.tif")

nl_list <- c("nl12", "nl13", "nl14", "nl15", "nl16",
             "nl17", "nl18", "nl19", "nl20")

# load("./data/mining.Rdata")

mining_buffered <- st_buffer(mining, 0.00277777777778) #10 arc seconds ~ 309 meters at equator


# Extract points that intersect with mining polygons ----------------------

# for(nlyr in nl_list) {
#   a <- extract(eval(parse(text = nlyr)), mining)
#   assign(paste("mines_", nlyr, sep = ""), a)
#   print(paste(nlyr, " done", sep = ""))
# }

# save(mines_nl12, file = "./data/mines_nl12.Rdata")
# save(mines_nl13, file = "./data/mines_nl13.Rdata")
# save(mines_nl14, file = "./data/mines_nl14.Rdata")
# save(mines_nl15, file = "./data/mines_nl15.Rdata")
# save(mines_nl16, file = "./data/mines_nl16.Rdata")
# save(mines_nl17, file = "./data/mines_nl17.Rdata")
# save(mines_nl18, file = "./data/mines_nl18.Rdata")
# save(mines_nl19, file = "./data/mines_nl19.Rdata")
# save(mines_nl20, file = "./data/mines_nl20.Rdata")


# Extract points that intersect with buffered mining polygons -------------

# for(nlyr in nl_list) {
#   a <- extract(eval(parse(text = nlyr)), mining_buffered)
#   assign(paste("mines_b_", nlyr, sep = ""), a)
#   print(paste(nlyr, " done", sep = ""))
# }

# save(mines_b_nl12, file = "./data/mines_b_nl12.Rdata")
# save(mines_b_nl13, file = "./data/mines_b_nl13.Rdata")
# save(mines_b_nl14, file = "./data/mines_b_nl14.Rdata")
# save(mines_b_nl15, file = "./data/mines_b_nl15.Rdata")
# save(mines_b_nl16, file = "./data/mines_b_nl16.Rdata")
# save(mines_b_nl17, file = "./data/mines_b_nl17.Rdata")
# save(mines_b_nl18, file = "./data/mines_b_nl18.Rdata")
# save(mines_b_nl19, file = "./data/mines_b_nl19.Rdata")
# save(mines_b_nl20, file = "./data/mines_b_nl20.Rdata")


# Concatenate -------------------------------------------------------------


# load("./data/mines_nl12.Rdata")
# load("./data/mines_nl13.Rdata")
# load("./data/mines_nl14.Rdata")
# load("./data/mines_nl15.Rdata")
# load("./data/mines_nl16.Rdata")
# load("./data/mines_nl17.Rdata")
# load("./data/mines_nl18.Rdata")
# load("./data/mines_nl19.Rdata")
# load("./data/mines_nl20.Rdata")
# 
# mines_nl_means <- matrix(ncol = length(nl_list), nrow = nrow(mining))
# i = 1
# 
# for(nlyr in nl_list) {
#   a <- lapply(eval(parse(text = paste("mines_", nlyr, sep = ""))), FUN=mean)
#   a <- unlist(a)
#   mines_nl_means[,i] <- a
#   i = i + 1
# }
# 
# mines_nl_means <- as.data.frame(mines_nl_means)
# colnames(mines_nl_means) <- nl_list
# 
# save(mines_nl_means, file = "./data/mines_nl_means.Rdata")
# write_csv(mines_nl_means, "./data/mines_nl_means.csv")
# write_rds(mines_nl_means, "./data/mines_nl_means.rds")
# 
# load("./data/mines_nl_means.Rdata")



# Concatenate buffered ----------------------------------------------------


load("./data/mines_b_nl12.Rdata")
load("./data/mines_b_nl13.Rdata")
load("./data/mines_b_nl14.Rdata")
load("./data/mines_b_nl15.Rdata")
load("./data/mines_b_nl16.Rdata")
load("./data/mines_b_nl17.Rdata")
load("./data/mines_b_nl18.Rdata")
load("./data/mines_b_nl19.Rdata")
load("./data/mines_b_nl20.Rdata")

mines_b_nl_medians <- matrix(ncol = length(nl_list), nrow = nrow(mining_buffered))
i = 1

for(nlyr in nl_list) {
  a <- lapply(eval(parse(text = paste("mines_b_", nlyr, sep = ""))), FUN=median)
  a <- unlist(a)
  mines_b_nl_medians[,i] <- a
  i = i + 1
  print(paste(nlyr, " done", sep = ""))
}

mines_b_nl_medians <- as.data.frame(mines_b_nl_medians)
colnames(mines_b_nl_medians) <- nl_list

save(mines_b_nl_means, file = "./data/mines_b_nl_medians.Rdata")
write_csv(mines_b_nl_means, "./data/mines_b_nl_medians.csv")
write_rds(mines_b_nl_means, "./data/mines_b_nl_medians.rds")

load("./data/mines_b_nl_medians.Rdata")



# Quality Assurance: Buffered Data ----------------------------------------

# mines_nl_means %>%
#   mutate(mine_index = row_number()) %>%
#   relocate(mine_index, .before = nl12) %>%
#   pivot_longer(cols = nl12:nl20, names_prefix = "nl", names_to = "year", values_to = "nl_activity") %>%
#   mutate(year = as.integer(as.integer(year) + 2000),
#          mine_index = as.character(mine_index)) %>%
#   
#   ggplot() +
#   geom_line(aes(x = as.integer(year), y = nl_activity, group = mine_index)) +
#   ylim(c(0,2))
# 
# mines_b_nl_means %>%
#   mutate(mine_index = row_number()) %>%
#   relocate(mine_index, .before = nl12) %>%
#   pivot_longer(cols = nl12:nl20, names_prefix = "nl", names_to = "year", values_to = "nl_activity") %>%
#   mutate(year = as.integer(as.integer(year) + 2000),
#          mine_index = as.character(mine_index)) %>%
#   
#   ggplot() +
#   geom_line(aes(x = as.integer(year), y = nl_activity, group = mine_index)) +
#   ylim(c(0,2))
# 
# mines_test <- mines_b_nl_means %>%
#   filter(nl12 + nl13 + nl14 + nl15 + nl16 + nl17 + nl18 + nl19 + nl20 != 0)
# 
# mines_test %>%
#   mutate(mine_index = row_number()) %>%
#   relocate(mine_index, .before = nl12) %>%
#   pivot_longer(cols = nl12:nl20, names_prefix = "nl", names_to = "year", values_to = "nl_activity") %>%
#   mutate(year = as.integer(as.integer(year) + 2000),
#          mine_index = as.character(mine_index)) %>%
#   
#   ggplot() +
#   geom_line(aes(x = as.integer(year), y = nl_activity, group = mine_index)) +
#   ylim(c(0,10))
# 
# mines_test <- mines_b_nl_means %>%
#   filter(nl12 + nl13 + nl14 + nl15 + nl16 + nl17 + nl18 + nl19 + nl20 != 0)
# 
# mapview(mining)
# 
# mapview(nl12)



# Create Mining Index -----------------------------------------------------

mining_values_prepare <- cbind(mines_b_nl_medians, mining) %>%
  dplyr::select(-ISO3_CODE) %>%
  mutate(minecode = paste("mine_", 1:nrow(mining), sep = "")) %>%
  pivot_longer(nl12:nl20, names_prefix = "nl") %>%
  mutate(year = 2000 + as.numeric(name)) %>%
  mutate(value = value / sd(value)) %>%
  dplyr::select(minecode, year, value, AREA)

mines_with_data <- mining_values_prepare %>%
  group_by(minecode) %>%
  summarize(value = sum(value)) %>%
  filter(value != 0) %>%
  pluck("minecode")

median_nl_per_year <- mining_values_prepare %>%
  filter(minecode %in% mines_with_data) %>%
  group_by(year) %>%
  summarize(median_value = median(value))

mining_values_1 <- mining_values_prepare %>%
  filter(minecode %in% mines_with_data)

mining_values_2 <- mining_values_prepare %>%
  filter(!(minecode %in% mines_with_data)) %>%
  left_join(median_nl_per_year, by = "year") %>%
  mutate(value = median_value) %>%
  dplyr::select(-median_value)

mining_values <- rbind(mining_values_1, mining_values_2) %>%
  mutate(mining_value = value * AREA) %>%
  dplyr::select(minecode, year, mining_value)

save(mining_values, file = "./data/mining_values.Rdata")


            