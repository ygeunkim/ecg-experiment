# ANOVA from observed data by LSD--------------
# input tidy data
# formula = output ~ row + col + trt
aov_lsd <- function(formula, data) {
  fact <- as.character(formula)[3]
  vars <- str_split(fact, pattern = " \\+ ")[[1]]
  data %>% 
    mutate_at(vars, factor) %>% 
    lm(formula, data = .) %>% 
    aov()
}
#---------------------------------------------
# Print in kable with kableExtra--------------
# Source, DF, Sum Sq, Mean Sq, F-Statistic
print_anova <- function(tibble, format = "latex", caption = "ANOVA Table") {
  tibble %>% 
    select(-p.value) %>% 
    add_row(
      tibble_row(term = "Total", df = sum(tibble$df), sumsq = sum(tibble$sumsq), meansq = NA, statistic = NA)
    ) %>% 
    kable(
      format = format, # latex or html
      escape = FALSE,
      col.names = c("Source", "DF", "Sum Sq", "Mean Sq", "F-Statistic"),
      caption = caption
    ) %>% 
    kable_styling(full_width = FALSE, latex_options = c("striped", "HOLD_position")) %>% 
    add_header_above(
      header = c(" " = 1, "Observed" = 3, " " = 1),
      escape = FALSE
    )
}
