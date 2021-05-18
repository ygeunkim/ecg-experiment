# Observed outcomes----------------------------
# input without useless column e.g. id, date, trt
gen_table <- function(data, row, col, out, add_mean = FALSE) {
  latin <- 
    data %>% 
    mutate(row = !!ensym(row)) %>% 
    group_by(row) %>% 
    mutate(
      row = str_c("row", !!ensym(row)),
      col = str_c("col", !!ensym(col))
    ) %>% 
    select(-!!ensym(row), -!!ensym(col)) %>% 
    pivot_wider(names_from = col, values_from = !!ensym(out))
  if (add_mean) {
    latin %>% 
      column_to_rownames(var = "row") %>% 
      mutate(Mean = rowMeans(.)) %>% 
      bind_rows(Mean = colMeans(.)) %>% 
      rownames_to_column(var = "row") %>% 
      mutate(row = str_replace_all(row, pattern = str_c("\\...", nrow(.)), replacement = "Mean"))
  } else {
    latin
  }
}
# print----------------------------------------
print_obs <- function(tibble, format = "latex", caption = "Observed Outcomes", ...) {
  tibble %>% 
    mutate(row = str_remove_all(row, pattern = "^row")) %>% 
    column_to_rownames(var = "row") %>% 
    kable(
      format = format,
      escape = FALSE,
      caption = caption,
      row.names = TRUE,
      ...
    ) %>% 
    kable_styling(full_width = FALSE, latex_options = c("striped", "HOLD_position")) %>% 
    row_spec(
      (tibble %>% nrow()), color = "red"
    ) %>% 
    column_spec(
      (tibble %>% ncol()), color = "red"
    )
}
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
