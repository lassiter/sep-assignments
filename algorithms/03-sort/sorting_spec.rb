include RSpec

require_relative "bucket_sort"
require_relative "heap_sort"
require_relative "quick_sort"
require_relative "merge_sort"
require_relative "bubble_sort"
require_relative "selection_sort"
require_relative "insertion_sort"

RSpec.describe "Sorting Test" do

  describe ':: Sorting Methods' do
    before do
      @unsorted_num_array = Array.new(100) {|index| index = rand(1..100)}.uniq
      @sorted_num_array = @unsorted_num_array.sort
    end
    it ':: bucket sort properly sorts as expected' do
      expect(bucket_sort(@unsorted_num_array)).to eq(@sorted_num_array)
    end
    it ':: quick sort properly sorts as expected' do
      expect(qs(@unsorted_num_array)).to eq(@sorted_num_array)
    end
    it ':: heap sort properly sorts as expected' do
      expect(heap_sort(@unsorted_num_array)).to eq(@sorted_num_array)
    end
    it ':: merge_sort properly sorts as expected' do
      expect(merge_sort(@unsorted_num_array)).to eq(@sorted_num_array)
    end
    it ':: bubble_sort properly sorts as expected' do
      expect(bubble_sort(@unsorted_num_array)).to eq(@sorted_num_array)
    end
    it ':: selection_sort properly sorts as expected' do
      expect(selection_sort(@unsorted_num_array)).to eq(@sorted_num_array)
    end
    it ':: insertion_sort properly sorts as expected' do
      expect(insertion_sort(@unsorted_num_array)).to eq(@sorted_num_array)
    end
  end

end