orders <- read.csv("orders1.csv", stringsAsFactors = FALSE)

head(orders)

orders$order_date <- as.Date(orders$order_date, format = "%d-%m-%Y")

orders$year_month <- format(orders$order_date, "%Y-%m")

monthly_sales <- aggregate(
  total_amount ~ year_month,
  data = orders,
  sum
)

print("Total Sales Revenue for Each Month:")
print(monthly_sales)

category_count <- table(orders$product_category)
most_popular_category <- names(which.max(category_count))

print("Most Popular Product Category:")
print(most_popular_category)

avg_order_value <- aggregate(
  total_amount ~ customer_id,
  data = orders,
  mean
)

print("Average Order Value for Each Customer:")
print(avg_order_value)

monthly_sales$year_month <- as.Date(
  paste0(monthly_sales$year_month, "-01")
)

plot(
  monthly_sales$year_month,
  monthly_sales$total_amount,
  type = "o",
  xlab = "Month",
  ylab = "Total Sales Revenue",
  main = "Trend of Total Sales Revenue Over Time"
)





