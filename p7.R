head(airquality)

str(airquality)

summary(airquality)

colSums(is.na(airquality))

airquality <- na.omit(airquality)

cor(
  airquality[, c("Ozone", "Solar.R", "Wind", "Temp")]
)

plot(
  airquality$Temp,
  airquality$Ozone,
  main = "Ozone vs Temperature",
  xlab = "Temperature",
  ylab = "Ozone",
  pch = 19,
  col = "blue"
)

plot(
  airquality$Wind,
  airquality$Ozone,
  main = "Ozone vs Wind Speed",
  xlab = "Wind Speed",
  ylab = "Ozone",
  pch = 19,
  col = "red"
)

aggregate(
  Ozone ~ Month,
  data = airquality,
  mean
)

boxplot(
  Ozone ~ Month,
  data = airquality,
  main = "Monthly Ozone Distribution",
  xlab = "Month",
  ylab = "Ozone",
  col = "lightgreen"
)

airquality$Date <- as.Date(
  paste(
    1973,
    airquality$Month,
    airquality$Day,
    sep = "-"
  )
)

airquality <- airquality[order(airquality$Date), ]

plot(
  airquality$Date,
  airquality$Ozone,
  type = "l",
  col = "darkgreen",
  main = "Time Series of Ozone (1973)",
  xlab = "Date",
  ylab = "Ozone Level"
)

model <- lm(
  Ozone ~ Solar.R + Wind + Temp,
  data = airquality
)

summary(model)

hist(
  airquality$Ozone,
  main = "Distribution of Ozone",
  xlab = "Ozone Levels",
  col = "orange"
)
