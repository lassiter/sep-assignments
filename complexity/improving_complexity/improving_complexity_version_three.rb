# Create a version that improves the space complexity. 
# This method takes n arrays as input and combine them in sorted ascending order
  def poorly_written_ruby_3(*arrays)
    sorted_array = heap_sort(arrays.flatten)
    # Return the sorted array
    sorted_array
  end

  def heap_sort(array)
    n = array.length
    a = [nil] + array
    (n / 2).downto(1) do |i|
      heapify(a, i, n)
    end
    while n > 1
      a[1], a[n] = a[n], a[1]
      n -= 1
      heapify(a, 1, n)
    end
    a.drop(1)
  end

  def heapify(a, parent, limit)
    pointer = a[parent]
    while (child = 2 * parent) <= limit
      child += 1 if child < limit && a[child] < a[child + 1]
      break if pointer >= a[child]
      a[parent] = a[child]
      parent = child
    end
    a[parent] = pointer
  end
  poorly_written_ruby_3([12,54,67],[1,222,23],[27,13,42])