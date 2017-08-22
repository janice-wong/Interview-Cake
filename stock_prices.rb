a = [10, 7, 5, 8, 11, 9]
b = [11, 0, 5, 8, 10, 9]
c = [11, 10, 9, 8, 7, 6]

# def get_max_profit(stock_prices_yesterday)
#   sorted_stock_prices = stock_prices_yesterday.sort
#   i = 0
#   j = sorted_stock_prices.length - 1
#   greatest_difference = sorted_stock_prices[j] - sorted_stock_prices[i]
#   while stock_prices_yesterday.index(sorted_stock_prices[i]) > stock_prices_yesterday.index(sorted_stock_prices[j])
#     # remove smallest
#     if sorted_stock_prices[j] - sorted_stock_prices[i + 1] > sorted_stock_prices[j - 1] - sorted_stock_prices[i]
#       greatest_difference = sorted_stock_prices[j] - sorted_stock_prices[i + 1]
#       i += 1
#     else
#       greatest_difference = sorted_stock_prices[j - 1] - sorted_stock_prices[i]
#       j -= 1
#     end
#   end
#   return greatest_difference
# end

# --

# write the body of your function here
# loop through elements of array. if arr[i] > any of elements in arr[0..i-1], capture diff arr[i] - arr[0..i -1].min
# if captured diff is larger than max_diff, update max_diff

def max_profit(stock_prices_yesterday)
  max_diff = stock_prices_yesterday[1] - stock_prices_yesterday[0]
  stock_prices_yesterday[2..-1].each_with_index do |price, index|
    index += 1
    diff = stock_prices_yesterday[0..(index - 1)].map { |x| price - x }.max
    max_diff = diff if diff > max_diff
  end
  max_diff
end

p max_profit(a)
p max_profit(b)
p max_profit(c)