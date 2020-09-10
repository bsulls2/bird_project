
##### load required packages
library(tidyverse)
library(stats)
library(forecast)


##### load in datasets 
### data is in csv format here
hzchicken <- read_csv("~/consulting/woodman/HZchicken.csv")
puerto <- read_csv("~/consulting/woodman/puerto04.csv")


##### for each dataset select variables of interest and convert to time series
hz_ts_24hr_temp <- hzchicken %>%
  select(tempPer1Hour) %>%
  ts(frequency = 1)
hz_ts_12hr_temp <- hzchicken %>%
  select(tempPer1Hour) %>%
  ts(frequency = 2)
hz_ts_1hr_temp <- hzchicken %>%
  select(tempPer1Hour) %>%
  ts(frequency = 24)

hz_ts_24hr_roll <- hzchicken %>%
  select(rollPer1Hour) %>%
  ts(frequency = 1)
hz_ts_12hr_roll <- hzchicken %>%
  select(rollPer1Hour) %>%
  ts(frequency = 2)
hz_ts_1hr_roll <- hzchicken %>%
  select(rollPer1Hour) %>%
  ts(frequency = 24)

pr_ts_24hr_temp <- puerto %>%
  select(tempPer1Hour) %>%
  ts(frequency = 1)
pr_ts_12hr_temp <- puerto %>%
  select(tempPer1Hour) %>%
  ts(frequency = 2)
pr_ts_1hr_temp <- puerto %>%
  select(tempPer1Hour) %>%
  ts(frequency = 24)

pr_ts_24hr_roll <- puerto %>%
  select(rollPer1Hour) %>%
  ts(frequency = 1)
pr_ts_12hr_roll <- puerto %>%
  select(rollPer1Hour) %>%
  ts(frequency = 2)
pr_ts_1hr_roll <- puerto %>%
  select(rollPer1Hour) %>%
  ts(frequency = 24)


##### decompose time series
hz_ts_12hr_temp_decomp <- hz_ts_12hr_temp %>%
  decompose
# split into trend, seasonal, and random
hz_ts_12hr_temp_trend <- hz_ts_12hr_temp_decomp$trend
hz_ts_12hr_temp_seasonal <- hz_ts_12hr_temp_decomp$seasonal
hz_ts_12hr_temp_random <- hz_ts_12hr_temp_decomp$random

hz_ts_1hr_temp_decomp <- hz_ts_1hr_temp %>%
  decompose
# split into trend, seasonal, and random
hz_ts_1hr_temp_trend <- hz_ts_1hr_temp_decomp$trend
hz_ts_1hr_temp_seasonal <- hz_ts_1hr_temp_decomp$seasonal
hz_ts_1hr_temp_random <- hz_ts_1hr_temp_decomp$random

hz_ts_12hr_roll_decomp <- hz_ts_12hr_roll %>%
  decompose
# split into trend and seasonal, and random
hz_ts_12hr_roll_trend <- hz_ts_12hr_roll_decomp$trend
hz_ts_12hr_roll_seasonal <- hz_ts_12hr_roll_decomp$seasonal
hz_ts_12hr_roll_random <- hz_ts_12hr_roll_decomp$random

hz_ts_1hr_roll_decomp <- hz_ts_1hr_roll %>%
  decompose
# split into trend and seasonal, and random
hz_ts_1hr_roll_trend <- hz_ts_1hr_roll_decomp$trend
hz_ts_1hr_roll_seasonal <- hz_ts_1hr_roll_decomp$seasonal
hz_ts_1hr_roll_random <- hz_ts_1hr_roll_decomp$random

pr_ts_12hr_temp_decomp <- pr_ts_12hr_temp %>%
  decompose
# split into trend, seasonal, and random
pr_ts_12hr_temp_trend <- pr_ts_12hr_temp_decomp$trend
pr_ts_12hr_temp_seasonal <- pr_ts_12hr_temp_decomp$seasonal
pr_ts_12hr_temp_random <- pr_ts_12hr_temp_decomp$random

pr_ts_1hr_temp_decomp <- pr_ts_1hr_temp %>%
  decompose
# split into trend, seasonal, and random
pr_ts_1hr_temp_trend <- pr_ts_1hr_temp_decomp$trend
pr_ts_1hr_temp_seasonal <- pr_ts_1hr_temp_decomp$seasonal
pr_ts_1hr_temp_random <- pr_ts_1hr_temp_decomp$random

pr_ts_12hr_roll_decomp <- pr_ts_12hr_roll %>%
  decompose
# split into trend and seasonal, and random
pr_ts_12hr_roll_trend <- pr_ts_12hr_roll_decomp$trend
pr_ts_12hr_roll_seasonal <- pr_ts_12hr_roll_decomp$seasonal
pr_ts_12hr_roll_random <- pr_ts_12hr_roll_decomp$random

pr_ts_1hr_roll_decomp <- pr_ts_1hr_roll %>%
  decompose
# split into trend and seasonal, and random
pr_ts_1hr_roll_trend <- pr_ts_1hr_roll_decomp$trend
pr_ts_1hr_roll_seasonal <- pr_ts_1hr_roll_decomp$seasonal
pr_ts_1hr_roll_random <- pr_ts_1hr_roll_decomp$random


##### plot time series and assess stationarity
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


###### fit models
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



##### check residuals
# raw data models
hz_1hr_temp_arima %>%
  checkresiduals
hz_12hr_temp_arima %>%
  checkresiduals
hz_24hr_temp_arima %>%
  checkresiduals
hz_1hr_roll_arima %>%
  checkresiduals
hz_12hr_roll_arima %>%
  checkresiduals
hz_24hr_roll_arima %>%
  checkresiduals
pr_1hr_temp_arima %>%
  checkresiduals
pr_12hr_temp_arima %>%
  checkresiduals
pr_24hr_temp_arima %>%
  checkresiduals
pr_1hr_roll_arima %>%
  checkresiduals
pr_12hr_roll_arima %>%
  checkresiduals
pr_24hr_roll_arima %>%
  checkresiduals

# trend
hz_1hr_temp_arima_tr %>%
  checkresiduals
hz_12hr_temp_arima_tr %>%
  checkresiduals
hz_1hr_roll_arima_tr %>%
  checkresiduals
hz_12hr_roll_arima_tr %>%
  checkresiduals
pr_1hr_temp_arima_tr %>%
  checkresiduals
pr_12hr_temp_arima_tr %>%
  checkresiduals
pr_1hr_roll_arima_tr %>%
  checkresiduals
pr_12hr_roll_arima_tr %>%
  checkresiduals

# trend + seasonal
hz_1hr_temp_arima_trse %>%
  checkresiduals
hz_12hr_temp_arima_trse %>%
  checkresiduals
hz_1hr_roll_arima_trse %>%
  checkresiduals
hz_12hr_roll_arima_trse %>%
  checkresiduals
pr_1hr_temp_arima_trse %>%
  checkresiduals
pr_12hr_temp_arima_trse %>%
  checkresiduals
pr_1hr_roll_arima_trse %>%
  checkresiduals
pr_12hr_roll_arima_trse %>%
  checkresiduals

# trend + random
hz_12hr_temp_arima_des %>%
  checkresiduals
hz_1hr_temp_arima_des %>%
  checkresiduals
hz_12hr_roll_arima_des %>%
  checkresiduals
hz_1hr_roll_arima_des %>%
  checkresiduals
pr_12hr_temp_arima_des %>%
  checkresiduals
pr_1hr_temp_arima_des %>%
  checkresiduals
pr_12hr_roll_arima_des %>%
  checkresiduals
pr_1hr_roll_arima_des %>%
  checkresiduals



##### interpretation of Ljung-Box Test
# if p value > 0.05, there is not enough evidence to reject the null hypothesis 
# that values are dependent. so we cannot assume they are dependent on one 
# another.
# if p values < .05. we can reject null hypothesis and assume values show 
# dependence on one another. 



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


