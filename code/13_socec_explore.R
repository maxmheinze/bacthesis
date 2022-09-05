
# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  stargazer,
  tikzDevice,
  sf,
  ggcorrplot
)


# Load Data ---------------------------------------------------------------

load(file = "./data/data_full.RData")


# Correlation Matrix ------------------------------------------------------

data_full %>%
  select(hdi, exp_schooling, mean_schooling, life_exp_birth, expenditure) %>%
  cor() %>%
  round(1) %>%
  ggcorrplot(lab = TRUE)

ggsave("./output/figures/13_correlations.png", height = 3, width = 4)

