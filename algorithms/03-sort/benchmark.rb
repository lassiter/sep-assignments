require_relative "bucket_sort"
require_relative "heap_sort"
require_relative "quick_sort"
unsorted_array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'].shuffle
unsorted_num_array = Array.new(11) {|index| index = rand(1..100)}

array = qs(unsorted_array)
puts "#{array.kind_of?(Array)}"
puts array