# Quicksort
  def qs(a)
    quick_sort_internal(a, 0, a.length - 1)
  end

  def quick_sort_internal(array, left, right)
    return if left >= right

    pivot = array[(left+right)/2]
    index = partition(array, left, right, pivot)
    quick_sort_internal(array, left, index-1)
    quick_sort_internal(array, index, right)
    return array
  end

  def partition(array, left, right, pivot)
    while left <= right
      while array[left] < pivot
        left += 1
      end
      while array[right] > pivot
        right -= 1
      end
      if left <= right
        array[left], array[right] = array[right], array[left]
        left += 1
        right -= 1
      end
    end
    return left
  end
