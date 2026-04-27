
# Read CSV files
sales_q1 <- read.csv("sales_q1.csv", stringsAsFactors = FALSE)
sales_q2 <- read.csv("sales_q2.csv", stringsAsFactors = FALSE)

# Verify column structure
if (!identical(colnames(sales_q1), colnames(sales_q2))) {
  stop("Column structures do not match!")
}

# Add Quarter column
sales_q1$Quarter <- "Q1"
sales_q2$Quarter <- "Q2"

# Combine datasets
sales_data <- rbind(sales_q1, sales_q2)

# Calculate total sales per row
sales_data$Sales <- sales_data$Units.Sold * sales_data$Unit.Price

# Calculate total sales per quarter
total_sales <- aggregate(Sales ~ Quarter, data = sales_data, sum)

# Create bar plot
bp <- barplot(
  total_sales$Sales,
  names.arg = total_sales$Quarter,
  col = c("steelblue", "orange"),
  xlab = "Quarter",
  ylab = "Total Sales",
  main = "Total Sales Comparison by Quarter",
  ylim = c(0, max(total_sales$Sales) * 1.25),
  yaxt = "n"
)

# Add axis
axis(2)

# Add labels on bars
text(
  bp,
  total_sales$Sales,
  labels = format(round(total_sales$Sales, 2), big.mark = ","),
  pos = 3
)

# Add border
box()
