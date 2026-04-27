set.seed(123)

random_numbers <- sample(1:100, 100, replace = TRUE)

isPerfectSquare <- function(x) {
  sqrt_x <- sqrt(x)
  sqrt_x == floor(sqrt_x)
}

perfect_squares <- random_numbers[
  sapply(random_numbers, isPerfectSquare)
]

average <- mean(perfect_squares)
std_dev <- sd(perfect_squares)

cat("Original Vector:\n", random_numbers, "\n\n")
cat("Perfect Squares Identified:\n", perfect_squares, "\n\n")
cat("Average of Perfect Squares:", average, "\n")
cat("Standard Deviation of Perfect Squares:", std_dev, "\n")
