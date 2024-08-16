source(here::here("r", "00_libs.R"))
source(here::here("r", "01_load_data.R"))

bar <- timetables2 %>%
  ggplot(
    aes(
      fill = type,
      y = time_spent,
      x = type
    )
  ) +
  geom_bar(stat = "identity") +
  labs(
    x = "Task Type",
    y = "Time Spent (minutes)"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust=1))

ggsave(bar, filename = here("figures","bar.png"),width = 10, height = 6)
