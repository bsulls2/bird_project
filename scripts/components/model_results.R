##### residual check and ljung-box test interpretation

##### run data_import and models scripts first

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
