cars_df <- read.csv("C:/Users/CSE/Downloads/mtcars.csv")

head(cars_df)
str(cars_df)

# Histogram of mpg
hist(cars_df$mpg,
     main = "Histogram of Miles Per Gallon (MPG)",
     xlab = "Miles Per Gallon",
     ylab = "Frequency",
     col = "skyblue",
     border = "black")

box()

# Convert cyl to factor
cars_df$cyl <- as.factor(cars_df$cyl)

# Boxplot
boxplot(mpg ~ cyl,
        data = cars_df,
        main = "MPG Distribution by Cylinder Count",
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon",
        col = c("lightgreen", "lightblue", "lightpink"))

# Scatter plot
plot(cars_df$wt, cars_df$mpg,
     main = "Scatter Plot of MPG vs Weight",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles Per Gallon",
     pch = 19,
     col = "darkblue")

# Add regression line
model <- lm(mpg ~ wt, data = cars_df)
abline(model, col = "red", lwd = 2)

# Calculate Mean & SD (comment added properly)
# Calculate Mean & SD

mean_hp <- tapply(cars_df$hp, cars_df$cyl, mean)
sd_hp <- tapply(cars_df$hp, cars_df$cyl, sd)

bar_pos <- barplot(mean_hp,
                   main = "Average Horsepower by Cylinder",
                   xlab = "Number of Cylinders",
                   ylab = "Average Horsepower",
                   col = c("orange", "purple", "cyan"),
                   ylim = c(0, max(mean_hp + sd_hp) + 20))

arrows(x0 = bar_pos,
       y0 = mean_hp - sd_hp,
       x1 = bar_pos,
       y1 = mean_hp + sd_hp,
       angle = 90,
       code = 3,
       length = 0.1,
       lwd = 2)

