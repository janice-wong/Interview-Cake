def get_products_of_all_ints_except_at_index(arr)
  result = [arr[1..-1].reduce(:*)]
  arr[1..-1].each_with_index do |num, index|
    index += 1
    result << (arr[0..(index - 1)] + arr[(index + 1)..-1]).reduce(:*)
  end
  result
end

p get_products_of_all_ints_except_at_index([1, 0, 3, 4])
p get_products_of_all_ints_except_at_index([1, 7, 3, 4])