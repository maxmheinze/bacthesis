

# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  plm
)

load("./data/data_full.Rdata")



# Estimate Panel Models ---------------------------------------------------


model1 <- plm(area_tree_cover ~ mining_dummy + expenditure + exp_schooling + life_exp_birth,
              data = data_full,
              effect = "twoway", 
              model = "within",
              index = c("cr_code", "year"))

summary(model1)

model2 <- plm(tree_cover ~ mining_dummy + expenditure + exp_schooling + life_exp_birth,
              data = data_full,
              effect = "twoway", 
              model = "within",
              index = c("cr_code", "year"))

summary(model2)

model3 <- plm(area_tree_cover ~ mining_value + expenditure + exp_schooling + life_exp_birth,
    data = data_full,
    effect = "twoway", 
    model = "within",
    index = c("cr_code", "year"))

summary(model3)

model4 <- plm(tree_cover ~ mining_value + expenditure + exp_schooling + life_exp_birth,
              data = data_full,
              effect = "twoway", 
              model = "within",
              index = c("cr_code", "year"))

summary(model4)

omit_cr <- data_full %>%
  filter(mining_value > 60) %>%
  pluck("cr_code") %>%
  unique()

data_omitted <- data_full %>%
  filter(!(cr_code %in% omit_cr))

model5 <- plm(area_tree_cover ~ mining_value + expenditure + exp_schooling + life_exp_birth,
              data = data_omitted,
              effect = "twoway", 
              model = "within",
              index = c("cr_code", "year"))

summary(model5)

model6 <- plm(tree_cover ~ mining_value + expenditure + exp_schooling + life_exp_birth,
              data = data_omitted,
              effect = "twoway", 
              model = "within",
              index = c("cr_code", "year"))

summary(model6)




