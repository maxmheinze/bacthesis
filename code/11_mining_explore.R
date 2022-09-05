
# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  stargazer,
  tikzDevice,
  sf
)


# Load Data ---------------------------------------------------------------

load(file = "./data/mining_values_prepare.Rdata")
load(file = "./data/mining_values.Rdata")
load(file = "./data/mining.Rdata")


# Mining Index ------------------------------------------------------------



table(cut(mining_values_prepare$value, breaks = c(-Inf, 0, 0.125, 0.25, 0.5, 1, 2, 5, 10, Inf)))

table(cut(mining_values$mining_value, breaks = c(-Inf, 0, 0.125, 0.25, 0.5, 1, 2, 5, 10, Inf)))

tikz("./output/tikz/histogram_mining_value_original.tex",standAlone=FALSE)
hist(mining_values_prepare$value, main = "Aggregated Night Light Values for Individual Mines, All Years", xlab = "Night Light Value")
dev.off()

mining_values_prepare
ggplot(data = mining_values_prepare) +
  geom_bar()

mining_values_prepare %>%
  filter(value <= 1) %>%
  filter(value >= 0) %>%
  ggplot() +
  geom_histogram(aes(x = value), binwidth = 0.01) +
  labs(title = "",
       x = "Value",
       y = "Count") +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("./output/figures/11_mining_values_before.png", width = 3, height = 3)

mining_values %>%
  filter(value <= 1) %>%
  filter(value >= 0) %>%
  ggplot() +
  geom_histogram(aes(x = value), binwidth = 0.01) +
  labs(title = "",
       x = "Value",
       y = "Count") +
  theme_bw() +
  theme(text = element_text(size = 12))

ggsave("./output/figures/11_mining_values_after.png", width = 3, height = 3)



# Shapefile ---------------------------------------------------------------

load("./data/adm2.Rdata")

nrow(adm2)
