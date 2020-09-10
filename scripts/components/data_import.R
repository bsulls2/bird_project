##### data import and preparation


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
