def bsi(collection, value)
  low, high = 0, collection.length-1
  while low <= high
    mid = (low + high) / 2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return collection[mid]
    end
  end
  return "not_found"
end