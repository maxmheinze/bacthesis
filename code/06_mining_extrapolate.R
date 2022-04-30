
# Header ------------------------------------------------------------------

pacman::p_load(
  tidyverse,
  sf,
  raster,
  rgdal
)


# Load Data ---------------------------------------------------------------

# nl12 <- raster("./data/idn_nightlights_2012.tif")
# nl13 <- raster("./data/idn_nightlights_2013.tif")
# nl14 <- raster("./data/idn_nightlights_2014.tif")
# nl15 <- raster("./data/idn_nightlights_2015.tif")
# nl16 <- raster("./data/idn_nightlights_2016.tif")
# nl17 <- raster("./data/idn_nightlights_2017.tif")
# nl18 <- raster("./data/idn_nightlights_2018.tif")
# nl19 <- raster("./data/idn_nightlights_2019.tif")
# nl20 <- raster("./data/idn_nightlights_2020.tif")

nl_list <- c("nl12", "nl13", "nl14", "nl15", "nl16",
             "nl17", "nl18", "nl19", "nl20")

load("./data/mining.Rdata")


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

load("./data/mines_nl12.Rdata")
load("./data/mines_nl13.Rdata")
load("./data/mines_nl14.Rdata")
load("./data/mines_nl15.Rdata")
load("./data/mines_nl16.Rdata")
load("./data/mines_nl17.Rdata")
load("./data/mines_nl18.Rdata")
load("./data/mines_nl19.Rdata")
load("./data/mines_nl20.Rdata")

mines_nl_means <- matrix(ncol = length(nl_list), nrow = nrow(mining))
i = 1

for(nlyr in nl_list) {
  a <- lapply(eval(parse(text = paste("mines_", nlyr, sep = ""))), FUN=mean)
  a <- unlist(a)
  mines_nl_means[,i] <- a
  i = i + 1
}

mines_nl_means <- as.data.frame(mines_nl_means)
colnames(mines_nl_means) <- nl_list

# save(mines_nl_means, file = "./data/mines_nl_means.Rdata")
# write_csv(mines_nl_means, "./data/mines_nl_means.csv")
# write_rds(mines_nl_means, "./data/mines_nl_means.rds")
