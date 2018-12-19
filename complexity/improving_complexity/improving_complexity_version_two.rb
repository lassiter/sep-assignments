# Create a version that improves the time complexity performance.
# This method takes n arrays as input and combine them in sorted ascending order
  def poorly_written_ruby_2(*arrays)
    sorted_array = merge_sort(arrays.flatten)
    # Return the sorted array
    sorted_array
  end

  def merge_sort(collection)
    if collection.length <= 1
      collection
    else
      mid = (collection.length / 2).floor
      left = merge_sort(collection[0..mid - 1])
      right = merge_sort(collection[mid..collection.length])
      merge(left, right)
    end
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end

   poorly_written_ruby_2([12,54,67],[1,222,23],[27,13,42])