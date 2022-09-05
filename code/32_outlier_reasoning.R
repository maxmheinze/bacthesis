

# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  stargazer
)



# Source Modeling Script --------------------------------------------------

source("./code/21_modeling.R")
load("./data/mining_values.Rdata")
load("./data/mining_i.Rdata")
load("./data/adm2.Rdata")



# Number of mines by c/r --------------------------------------------------

data_full %>%
  filter(cr_code %in% omit_cr)

number_of_mines <- mining_i %>%
  group_by(cr_code) %>%
  summarize(number_mines = n()) %>%
  right_join(adm2) %>%
  select(-geometry) %>%
  arrange(desc(number_mines))

avg_mining_value <- data_full %>%
  group_by(cr_code) %>%
  summarize(avg_mining = mean(mining_value)) %>%
  right_join(number_of_mines) %>%
  drop_na()

number_of_mines %>%
  ggplot() +
  geom_histogram(aes(x = number_mines)) +
  labs(title = "",
       x = "Number of Mines",
       y = "Count") +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("./output/figures/32_number_mines.png", width = 3, height = 3)

avg_mining_value %>%
  ggplot() +
  geom_histogram(aes(x = avg_mining)) +
  labs(title = "",
       x = "Mining Index (yearly avg.)",
       y = "Count") +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("./output/figures/32_avg_mining_value.png", width = 3, height = 3)
