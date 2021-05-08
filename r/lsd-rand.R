# Hypothesis Test sharp null based on Randomization------
# Input: imputed science table
# n > 1
permute_lsd <- function(n, size, ...) {
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
# FTre for each LSD-------------------------------------
# Next step: join the observed output
# calculate FTre

