# Load timetables data
timetables <- read_csv(here('timetables','timetables.csv'))
timetables$time_from <- format(as.POSIXct(timetables$time_from, format = "%H:%M"), "%H:%M")
timetables$time_to <- format(as.POSIXct(timetables$time_to, format = "%H:%M"), "%H:%M")

# Load task type description data
task_types <- read_csv(here('timetables','task_types.csv'))

# New col for total time spent on each individual task
timetables2 <- timetables
timetables2$time_from <- as.POSIXct(timetables$time_from, format = "%H:%M")
timetables2$time_to <- as.POSIXct(timetables$time_to, format = "%H:%M")
timetables2 <- timetables2 %>%
  mutate(
    time_spent = as.numeric(difftime(time_to,time_from,units = "mins")),
    type = factor(type)
  )

# Create df for total time spent on each task category
pie_df <- timetables2 %>%
  group_by(type) %>%
  summarize(total_time_spent = sum(time_spent)) %>%
  mutate(
    percentage = total_time_spent / sum(total_time_spent) * 100,
    label = paste0(round(percentage, 1), "%")
  )