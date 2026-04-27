iris_data <- iris

numeric_data <- iris_data[, 1:4]

cov_matrix <- cov(numeric_data)
cat("Covariance Matrix:\n")
print(cov_matrix)

cor_matrix <- cor(numeric_data)
cat("\nCorrelation Matrix:\n")
print(cor_matrix)

cor_values <- cor_matrix[lower.tri(cor_matrix)]

max_cor <- max(cor_values)
min_cor <- min(cor_values)

which_max <- which(cor_matrix == max_cor, arr.ind = TRUE)
which_min <- which(cor_matrix == min_cor, arr.ind = TRUE)

cat(
  "\nHighest Positive Correlation:",
  max_cor,
  "between",
  colnames(cor_matrix)[which_max[1, 1]],
  "and",
  colnames(cor_matrix)[which_max[1, 2]],
  "\n"
)

cat(
  "Highest Negative Correlation:",
  min_cor,
  "between",
  colnames(cor_matrix)[which_min[1, 1]],
  "and",
  colnames(cor_matrix)[which_min[1, 2]],
  "\n"
)

plot(
  iris_data$Sepal.Length,
  iris_data$Petal.Length,
  main = "Scatter Plot: Sepal Length vs Petal Length",
  xlab = "Sepal Length",
  ylab = "Petal Length",
  pch = 19,
  col = "blue"
)

model <- lm(Petal.Length ~ Sepal.Length, data = iris_data)

abline(model, col = "red", lwd = 2)

cor_val <- cor(iris_data$Sepal.Length, iris_data$Petal.Length)

cat(
  "\nCorrelation between Sepal.Length and Petal.Length:",
  cor_val,
  "\n"
)
