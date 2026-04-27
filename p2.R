findMedian <- function(numbers) {
  median(numbers)
}

isPalindrome <- function(str) {
  clean_str <- gsub(" ", "", tolower(str))
  clean_str == paste(rev(strsplit(clean_str, NULL)[[1]]), collapse = "")
}

triangleArea <- function(base, height) {
  0.5 * base * height
}

vec <- c(10, 20, 30, 40, 50)

median_result <- findMedian(vec)

palindrome_result1 <- isPalindrome("madam")
palindrome_result2 <- isPalindrome("Hello")

area_result <- triangleArea(10, 5)

cat("Vector:", vec, "\n")
cat("Median of vector:", median_result, "\n\n")

cat("Is 'madam' a palindrome?", palindrome_result1, "\n")
cat("Is 'Hello' a palindrome?", palindrome_result2, "\n\n")

cat("Area of triangle with base=10 and height=5:", area_result, "\n")
