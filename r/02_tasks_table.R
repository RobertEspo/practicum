source(here::here("r", "00_libs.R"))
source(here::here("r", "01_load_data.R"))

tasks_table <- kable(timetables, format = "latex", booktabs = TRUE) %>%
  kable_styling(full_width = FALSE)
  

writeLines(as.character(tasks_table),here("tables","tasks_table.tex"))
