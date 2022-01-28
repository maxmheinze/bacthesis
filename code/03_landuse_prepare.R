
# Header ------------------------------------------------------------------

# rm(list = ls())

pacman::p_load(
  tidyverse,
  magrittr
)


# Read Data ---------------------------------------------------------------

lu <- readRDS("./data/landuse.RDS")


# # Save Data ---------------------------------------------------------------
# 
# save(lu, file = "./dp/lu.Rdata")
