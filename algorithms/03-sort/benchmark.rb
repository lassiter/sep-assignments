require_relative "bucket_sort"
require_relative "heap_sort"
require_relative "quick_sort"
require_relative "merge_sort"
require_relative "bubble_sort"
require_relative "selection_sort"
require_relative "insertion_sort"


unsorted_array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'].shuffle
unsorted_num_array = Array.new(40) {|index| index = rand(1..100)}.uniq

# qs(unsorted_array)
p heap_sort(unsorted_num_array)