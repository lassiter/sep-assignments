require_relative "bucket_sort"
require_relative "heap_sort"
require_relative "quick_sort"
require_relative "merge_sort"
require_relative "bubble_sort"
require_relative "selection_sort"
require_relative "insertion_sort"
require 'benchmark'

unsorted_num_array = Array.new(5000) {|index| index = rand(1..10000)}.uniq

Benchmark.bm do |x|
  x.report("Quicksort: ") { qs(unsorted_num_array) }
  x.report("Heap sort: ")  { heap_sort(unsorted_num_array)  }
  x.report("Merge sort: ")  { merge_sort(unsorted_num_array)  }
  x.report("Bubble sort: ")  { bubble_sort(unsorted_num_array)  }
  x.report("Selection sort: ")  { selection_sort(unsorted_num_array)  }
  x.report("Insertion sort: ")  { insertion_sort(unsorted_num_array)  }
  x.report("Bucket sort: ")  { bucket_sort(unsorted_num_array)  }
end