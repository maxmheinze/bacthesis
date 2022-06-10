

# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  plm
)

load("./data/data_full.Rdata")


# Basic Panel Model -------------------------------------------------------

model1 <- plm(area_tree_cover ~ mining_value + hdi,
    data = data_full,
    model = "within",
    index = c("cr_code", "year"))

summary(model1)

model2 <- plm(area_tree_cover ~ mining_dummy + hdi,
              data = data_full,
              model = "within",
              index = c("cr_code", "year"))

summary(model2)

model3 <- plm(tree_cover ~ mining_value + hdi,
              data = data_full,
              model = "within",
              index = c("cr_code", "year"))

summary(model3)

model4 <- plm(tree_cover ~ mining_dummy + hdi,
              data = data_full,
              model = "within",
              index = c("cr_code", "year"))

summary(model4)
