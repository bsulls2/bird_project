##### visualizations


### run data_import script first


### plot time series and assess stationarity
# temp
hz_ts_1hr_temp %>%
  ggtsdisplay(main = "hz_ts_1hr_temp")
hz_ts_12hr_temp %>%
  ggtsdisplay(main = "hz_ts_12hr_temp") 
hz_ts_24hr_temp %>%
  ggtsdisplay(main = "hz_ts_24hr_temp")
pr_ts_1hr_temp %>%
  ggtsdisplay(main = "pr_ts_1hr_temp")
pr_ts_12hr_temp %>%
  ggtsdisplay(main = "pr_ts_12hr_temp")
pr_ts_24hr_temp %>%
  ggtsdisplay(main = "pr_ts_24hr_temp")
# roll
hz_ts_1hr_roll  %>%
  ggtsdisplay(main = "hz_ts_1hr_roll")
hz_ts_12hr_roll %>%
  ggtsdisplay(main = "hz_ts_12hr_roll")
hz_ts_24hr_roll %>%
  ggtsdisplay(main = "hz_ts_24hr_roll")
pr_ts_1hr_roll %>%
  ggtsdisplay(main = "pr_ts_1hr_roll")
pr_ts_12hr_roll %>%
  ggtsdisplay(main = "pr_ts_12hr_roll")
pr_ts_24hr_roll %>%
  ggtsdisplay(main = "pr_ts_24hr_roll")



### variable distributions by hour
# boxplots for hzchicken
hzchicken %>%
  select(tempPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, tempPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "HZ Chicken temperature distribution by hour")
hzchicken %>%
  select(rollPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, rollPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "HZ Chicken roll distribution by hour")
hzchicken %>%
  select(pitchPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, pitchPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "HZ Chicken pitch distribution by hour")
hzchicken %>%
  select(YawPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, YawPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "HZ Chicken yaw distribution by hour")

# boxplots for pr parrot
puerto %>%
  select(tempPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, tempPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "PR Parrot temperature distribution by hour")
puerto %>%
  select(rollPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, rollPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "PR Parrot roll distribution by hour")
puerto %>%
  select(pitchPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, pitchPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "PR Parrot pitch distribution by hour")
puerto %>%
  select(YawPer1Hour, hour_num) %>%
  ggplot(aes(hour_num, YawPer1Hour)) +
  geom_boxplot(aes(group = hour_num)) +
  labs(title = "PR Parrot yaw distribution by hour")

