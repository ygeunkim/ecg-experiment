# packages------------------------
library(dplyr)
library(readr)
library(tidyr)
# experiment data------------------
ecg <- read_csv("data/raw/ecg.csv")
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
  pivot_wider(names_from = trt, values_from = bpm)
# sharp null of no effect----------
sharp_null <- 
  science_ecg %>% 
  mutate(
    HB = ecg$bpm,
    S = ecg$bpm,
    De = ecg$bpm,
    W = ecg$bpm
  )
# write----------------------------
write_csv(science_ecg, "data/processed/science.csv")
write_csv(sharp_null, "data/processed/science-sharp.csv")
