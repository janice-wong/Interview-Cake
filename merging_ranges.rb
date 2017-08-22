def merging_ranges(meetings)
  array = meetings.sort
  result_array = [array[0]]
  array.each_with_index do |range, index|
    next if index.zero?
    if range[0] == result_array[-1][1]
      result_array[-1][1] = range[1]
    elsif range[0] > result_array[-1][1]
      result_array << range
    elsif range[0] < result_array[-1][0]
      result_array[-1][0] = range[0]
      if range[1] > result_array[-1][1]
        result_array[-1][1] = range[1]
      end
    else
      result_array[-1][1] = range[1] if range[1] > result_array[-1][1]
    end
  end
  result_array
end

p merging_ranges([[10, 12], [0, 1], [3, 5], [4, 8], [9, 10]])
p merging_ranges([[1, 2], [2, 3]])
p merging_ranges([[1, 5], [2, 3]])
p merging_ranges([[1, 10], [2, 6], [3, 5], [7, 9]])