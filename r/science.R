# packages------------------------
library(dplyr)
library(readr)
library(tidyr)
# experiment data------------------
ecg <- read_csv("data/raw/ecg.csv")
# diff-----------------------------
ecg_diff <- 
  ecg %>% 
  mutate(diff = post - pre) %>% 
  select(-pre, -post)
# pre-process----------------------
science_ecg <- 
  ecg_diff %>% 
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
    HB = ecg_diff$diff,
    S = ecg_diff$diff,
    De = ecg_diff$diff,
    W = ecg_diff$diff
  )
# write----------------------------
write_csv(ecg_diff, "data/processed/ecg-diff.csv")
write_csv(science_ecg, "data/processed/science.csv")
write_csv(sharp_null, "data/processed/science-sharp.csv")
# log return-----------------------
ecg_log <- 
  ecg %>% 
  mutate_at(vars(pre, post), ~log(.)) %>% 
  mutate(diff = post - pre) %>% 
  select(-pre, -post)
# sharp null-----------------------
sharp_log <- 
  ecg_log %>% 
  select(-date) %>% 
  mutate(
    trt = case_when(
      coffee == 1 ~ "HB",
      coffee == 2 ~ "S",
      coffee == 3 ~ "De",
      coffee == 4 ~ "W"
    )
  ) %>%
  pivot_wider(names_from = trt, values_from = diff) %>% 
  mutate(
    HB = ecg_log$diff,
    S = ecg_log$diff,
    De = ecg_log$diff,
    W = ecg_log$diff
  )
# write----------------------------
write_csv(ecg_log, "data/processed/ecg-logreturn.csv")
write_csv(sharp_log, "data/processed/science-sharp-log.csv")
