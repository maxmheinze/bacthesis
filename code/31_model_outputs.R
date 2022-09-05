
# Header ------------------------------------------------------------------

rm(list = ls())

pacman::p_load(
  tidyverse,
  stargazer
)



# Source Modeling Script --------------------------------------------------

source("./code/21_modeling.R")



# Model Outputs -----------------------------------------------------------

stargazer(model1, model2, model3, model4, model5, model6,
          type = "latex",
          float = FALSE,
          column.sep.width = "5pt",
          add.lines=list(c("C/R fixed effects", "Yes","Yes", "Yes", "Yes"),
                         c("Year fixed effects", "Yes","Yes", "Yes", "Yes")),
          out = "./output/tables/31_outputs.tex")
