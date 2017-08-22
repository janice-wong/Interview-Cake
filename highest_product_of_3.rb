def highest_product_of_3(array_of_ints)
  num_of_negs = array_of_ints.count { |x| x < 0 }
  highest_3_pos = array_of_ints[0..2].sort

  # find highest 3 positive numbers - O(n)
  array_of_ints[3..-1].each do |num|
    if num > highest_3_pos[0]
      if num > highest_3_pos[2]
        highest_3_pos << num
      elsif num > highest_3_pos[1]
        highest_3_pos.insert(2, num)
      else
        highest_3_pos.insert(1, num)
      end
      highest_3_pos.shift
    end
  end

  result = highest_3_pos.reduce(:*)

  # if there are 2 or more even number of negatives, result will be max of either (2 most neg and highest pos) or (3 highest pos) - O(n) + O(n)
  if !num_of_negs.zero? && num_of_negs.even?
    option = array_of_ints.max * array_of_ints.min
    array_of_ints.delete_at(array_of_ints.index(array_of_ints.min))
    result = [result, option * array_of_ints.min].max
  end
  result
end

# FIX THE BELOW

def highest_product_of_3(array_of_ints)
  lowest, highest = array_of_ints[0]
  lowest_prod_of_two, highest_prod_of_two = array_of_ints[0] * array_of_ints[1]
  highest_prod_of_three = lowest_prod_of_two * array_of_ints[2]

  highest = array_of_ints[1] if array_of_ints[1] > array_of_ints[0]
  array_of_ints[2..-1].each do |num|
    if num 

    if num > highest
      highest_prod_of_three = num * highest_prod_of_two if (num * highest_prod_of_two) > highest_prod_of_three
      highest_prod_of_two = highest * num
      highest = num
    elsif num < lowest
      highest_prod_of_three = num * lowest_prod_of_two if (num * lowest_prod_of_two) > highest_prod_of_three
      lowest_prod_of_two = lowest * num
      lowest = num
    end
  end
  highest_prod_of_three
end

p highest_product_of_3([1, 10, -5, 2, -100])
# p highest_product_of_3([-10, -10, 1, 3, 2])
# p highest_product_of_3([-10, 10, 1, 3, 2])
# p highest_product_of_3([-10, 10, 1, -3, 2])
# p highest_product_of_3([-10, 10, 1, -3, -2])