# Vectorize (by row) LSD matrix--------------------------
vec_lsd <- function(x) {
  x %>% 
    t() %>% 
    as.numeric()
}
# Hypothesis Test sharp null based on Randomization------
# Input: imputed science table
# n > 1
permute_lsd <- function(n, size, fact_name = c("row", "col", "trt"), ...) {
  lsd <- rlatin(n = n, size = size, ...)
  lsd <- 
    lapply(
      seq_len(n), 
      function(x) {
        lsd[, , x] %>% 
          as.data.frame() %>% 
          add_column(row = 1:size, .before = "V1") %>% 
          pivot_longer(-row, names_to = "col", values_to = "trt") %>% 
          mutate(
            col = str_remove(col, pattern = "^V") %>% as.integer(),
            id = 1:n(),
            lsd_group = x
          )
      }
    ) %>% 
    bind_rows()
  lsd
}
#-------------------------------------------------------
# Hypothesis Test sharp null based on Randomization------
# x: imputed science table
# y_obs: Observed output
# LSD using rlatin
test_sharp <- function(x, y_obs, B = 1000, size = 4, fact_name = c("row", "col", "trt"), mc_core = 8) {
  row_obs <- x[[fact_name[1]]]
  col_obs <- x[[fact_name[2]]]
  trt_obs <- x[[fact_name[3]]]
  # permutation----------------------
  doMC::registerDoMC(cores = mc_core)
  foreach(b = seq_len(B), .combine = c) %dopar% {
    rand_trt <- rlatin(1, size = size) %>% vec_lsd()
    ecg_new <- tibble(
      row = row_obs,
      col = col_obs,
      trt = rand_trt,
      out = y_obs
    )
    aov_lsd(out ~ row + col + trt, data = ecg_new) %>% 
      broom::tidy() %>% 
      .$statistic %>% 
      .[3]
  }
}
