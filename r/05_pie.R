source(here::here("r", "00_libs.R"))
source(here::here("r", "01_load_data.R"))

pie <- pie_df %>%
  ggplot(
    aes(
      x = "",
      y = total_time_spent,
      fill = type)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y") +
  theme_void() +
  geom_label_repel(aes(label = label), position = position_stack(vjust = 0.8)) +
  labs(
    title = "Percentage"
  )
pie