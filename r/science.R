# packages------------------------
library(dplyr)
library(readr)
library(tidyr)
# experiment data------------------
ecg <- read_csv("data/raw/ecg.csv") %>% 
  mutate(diff = post - pre) %>% 
  select(-pre, -post)
# pre-process----------------------
science_ecg <- 
  ecg %>% 
  select(-date) %>% 
  mutate(
    trt = case_when(
      coffee == 1 ~ "HB",
      coffee == 2 ~ "S",
      coffee == 3 ~ "De",
      coffee == 4 ~ "W"
    )
  ) %>%
  pivot_wider(names_from = trt, values_from = diff)
# sharp null of no effect----------
sharp_null <- 
  science_ecg %>% 
  mutate(
    HB = ecg$diff,
    S = ecg$diff,
    De = ecg$diff,
    W = ecg$diff
  )
# write----------------------------
write_csv(ecg, "data/processed/ecg-diff.csv")
write_csv(science_ecg, "data/processed/science.csv")
write_csv(sharp_null, "data/processed/science-sharp.csv")
