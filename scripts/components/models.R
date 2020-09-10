##### models

### run data_import script first


# These use the auto.arima function in the package forecast which conducts an 
# automatic search over all possible orders of ARIMA models specified. where
# stationarity assumptions are violated, it differences the data until
# stationarity is attained. model parameters are automatically selected by 
# minimizing aic's.
# models fit to the raw data
hz_1hr_temp_arima <- hz_ts_1hr_temp %>%
  auto.arima
hz_12hr_temp_arima <- hz_ts_12hr_temp %>%
  auto.arima
hz_24hr_temp_arima <- hz_ts_24hr_temp %>%
  auto.arima
hz_1hr_roll_arima <- hz_ts_1hr_roll %>%
  auto.arima
hz_12hr_roll_arima <- hz_ts_12hr_roll %>%
  auto.arima
hz_24hr_roll_arima <- hz_ts_24hr_roll %>%
  auto.arima
pr_1hr_temp_arima <- pr_ts_1hr_temp %>%
  auto.arima
pr_12hr_temp_arima <- pr_ts_12hr_temp %>%
  auto.arima
pr_24hr_temp_arima <- pr_ts_24hr_temp %>%
  auto.arima
pr_1hr_roll_arima <- pr_ts_1hr_roll %>%
  auto.arima
pr_12hr_roll_arima <- pr_ts_12hr_roll %>%
  auto.arima
pr_24hr_roll_arima <- pr_ts_24hr_roll %>%
  auto.arima

# models fit to trend components
hz_12hr_temp_arima_tr <- hz_ts_12hr_temp_trend %>%
  auto.arima
hz_1hr_temp_arima_tr <- hz_ts_1hr_temp_trend %>%
  auto.arima
hz_12hr_roll_arima_tr <- hz_ts_12hr_roll_trend %>%
  auto.arima
hz_1hr_roll_arima_tr <- hz_ts_1hr_roll_trend %>%
  auto.arima
pr_12hr_temp_arima_tr <- pr_ts_12hr_temp_trend %>%
  auto.arima
pr_1hr_temp_arima_tr <- pr_ts_1hr_temp_trend %>%
  auto.arima
pr_12hr_roll_arima_tr <- pr_ts_12hr_roll_trend %>%
  auto.arima
pr_1hr_roll_arima_tr <- pr_ts_1hr_roll_trend %>%
  auto.arima

# models fit to trend + seasonal components
hz_12hr_temp_arima_trse <- (hz_ts_12hr_temp_trend + hz_ts_12hr_temp_seasonal) %>%
  auto.arima
hz_1hr_temp_arima_trse <- (hz_ts_1hr_temp_trend + hz_ts_1hr_temp_seasonal) %>%
  auto.arima
hz_12hr_roll_arima_trse <- (hz_ts_12hr_roll_trend + hz_ts_12hr_roll_seasonal) %>%
  auto.arima
hz_1hr_roll_arima_trse <- (hz_ts_1hr_roll_trend + hz_ts_1hr_roll_seasonal) %>%
  auto.arima 
pr_12hr_temp_arima_trse <- (pr_ts_12hr_temp_trend + pr_ts_12hr_temp_seasonal) %>%
  auto.arima
pr_1hr_temp_arima_trse <- (pr_ts_1hr_temp_trend + pr_ts_1hr_temp_seasonal) %>%
  auto.arima
pr_12hr_roll_arima_trse <- (pr_ts_12hr_roll_trend + pr_ts_12hr_roll_seasonal) %>%
  auto.arima
pr_1hr_roll_arima_trse <- (pr_ts_1hr_roll_trend + pr_ts_1hr_roll_seasonal) %>%
  auto.arima 

# models fit to trend + random components
hz_12hr_temp_arima_des <- (hz_ts_12hr_temp_trend + hz_ts_12hr_temp_random) %>%
  auto.arima
hz_1hr_temp_arima_des <- (hz_ts_1hr_temp_trend + hz_ts_1hr_temp_random) %>%
  auto.arima
hz_12hr_roll_arima_des <- (hz_ts_12hr_roll_trend + hz_ts_12hr_roll_random) %>%
  auto.arima
hz_1hr_roll_arima_des <- (hz_ts_1hr_roll_trend + hz_ts_1hr_roll_random) %>%
  auto.arima 
pr_12hr_temp_arima_des <- (pr_ts_12hr_temp_trend + pr_ts_12hr_temp_random) %>%
  auto.arima
pr_1hr_temp_arima_des <- (pr_ts_1hr_temp_trend + pr_ts_1hr_temp_random) %>%
  auto.arima
pr_12hr_roll_arima_des <- (pr_ts_12hr_roll_trend + pr_ts_12hr_roll_random) %>%
  auto.arima
pr_1hr_roll_arima_des <- (pr_ts_1hr_roll_trend + pr_ts_1hr_roll_random) %>%
  auto.arima 
