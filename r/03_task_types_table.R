source(here::here("r", "00_libs.R"))
source(here::here("r", "01_load_data.R"))

task_types_table <- kable(task_types, format = "latex") %>%
  kable_styling(full_width = FALSE)


writeLines(as.character(task_types_table),here("tables","task_types_table.tex"))
