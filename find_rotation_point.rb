def find_rotation_point(words)
  low = 0
  high = words.length - 1
  while high - low > 2
    mid = (low + high) / 2
    if words[mid] > words[low]
      low = mid
    elsif words[mid] < words[low]
      high = mid
    end
  end
  if words[low] < words[high]
    return low
  else
    return high
  end
end

p find_rotation_point(['ptolemaic', 'retrograde', 'supplant', 'undulate', 'xenoepist', 'asymptote', 'babka', 'banoffee', 'engender', 'karpatka', 'othellolagkage'])