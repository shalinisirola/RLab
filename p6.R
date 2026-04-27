setwd("C:/Users/YourName/Documents/R")

library(moments)

mtcars_data <- read.csv("mtcars.csv")

mpg <- mtcars_data$mpg

mean_mpg   <- mean(mpg)
median_mpg <- median(mpg)

get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mode_mpg <- get_mode(mpg)

variance_mpg <- var(mpg)
sd_mpg       <- sd(mpg)
range_mpg    <- range(mpg)
iqr_mpg      <- IQR(mpg)

skewness_mpg <- skewness(mpg)
kurtosis_mpg <- kurtosis(mpg)

cat("Mean of mpg:", mean_mpg, "\n")
cat("Median of mpg:", median_mpg, "\n")
cat("Mode of mpg:", mode_mpg, "\n")
cat("Variance of mpg:", variance_mpg, "\n")
cat("Standard Deviation of mpg:", sd_mpg, "\n")
cat("Range of mpg:", range_mpg[1], "to", range_mpg[2], "\n")
cat("Interquartile Range (IQR) of mpg:", iqr_mpg, "\n")
cat("Skewness of mpg:", skewness_mpg, "\n")
cat("Kurtosis of mpg:", kurtosis_mpg, "\n")

if (skewness_mpg > 0) {
  cat("Interpretation: The mpg distribution is positively skewed (right-tailed).\n")
} else if (skewness_mpg < 0) {
  cat("Interpretation: The mpg distribution is negatively skewed (left-tailed).\n")
} else {
  cat("Interpretation: The mpg distribution is symmetric.\n")
}

if (kurtosis_mpg > 3) {
  cat("Interpretation: The mpg distribution is leptokurtic (sharper peak, heavier tails).\n")
} else if (kurtosis_mpg < 3) {
  cat("Interpretation: The mpg distribution is platykurtic (flatter peak, lighter tails).\n")
} else {
  cat("Interpretation: The mpg distribution is mesokurtic (similar to normal distribution).\n")
}
