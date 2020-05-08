library("dplyr")
hofstede <- read.csv(
  "https://geerthofstede.com/wp-content/uploads/2016/08/6-dimensions-for-website-2015-08-16.csv",
  stringsAsFactors = FALSE,
  sep = ";"
)

idv_data_df <- hofstede %>% 
  select(country,idv) %>%
  mutate(idv = as.numeric(idv)) %>%
  filter(!is.na(idv)) %>%
  arrange(idv)

idv_summary2_df <- idv_data_df %>% 
  summarise(avg_idv = mean(idv),
            min_idv = min(idv),
            max_idv = max(idv))

# find min and max idv countries

max_country2 <- idv_data_df %>%
  filter(idv == max(idv)) %>%
  pull(country)

min_country2 <- idv_data_df %>%
  filter(idv == min(idv)) %>%
  pull(country)
