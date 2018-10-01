def bsr(collection, value)
  low, high = 0, collection.length-1
  if low >= high
    return "not_found"
  end
  mid = (low + high) / 2
  if collection[mid] > value
    bsr(collection[low..mid-1], value)
  elsif collection[mid] < value
    bsr(collection[mid+1..high], value)
  else
    return collection[mid]
  end
end