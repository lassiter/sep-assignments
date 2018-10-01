
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
