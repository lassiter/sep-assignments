require 'benchmark'
require_relative 'min_binary_heap/node'
require_relative 'min_binary_heap/min_binary_heap'
require_relative 'binary_tree/binary_search_tree'

n = 100000
root = n/2
bst_root = Node.new("groot",root)
mbh_root = Node.new("groot",root)
bst = BinarySearchTree.new(bst_root)
mbh = MinBinaryHeap.new(mbh_root)
# 

puts "Insert Start"
# How much time does an average insertion consume 
# in the Binary Search Tree compared to the Heap?
Benchmark.bm do |x|
  x.report("binary tree insert") do
    for i in 1..n
      node = Node.new("binary tree", Random.rand(100000))
      bst.insert(bst_root,node)
    end
  end
  x.report("min heap insert") do 
    for i in 1..n
      node = Node.new("minheap", Random.rand(100000))
      mbh.insert(mbh_root,node)
    end 
  end
end

puts "Find Start"
# How much time does finding 50000 in the Binary Search Tree 
# consume compared to the Heap?
selection = Node.new("select", 50000)
bst.insert(bst_root,selection)
mbh.insert(mbh_root,selection)
Benchmark.bm do |x|
  x.report("binary tree find") do
    bst.find(bst_root,"select")
  end
  x.report("min heap find") do 
    mbh.find(mbh_root,"select")
  end
end

puts "Delete Start"
# How much time does the average deletion consume 
# in a Binary Search Tree compared to the Heap?
Benchmark.bm do |x|
  x.report("binary tree find") do
    bst.find(bst_root,"select")
  end
  x.report("min heap find") do 
    mbh.find(mbh_root,"select")
  end
end
# When would you use a Binary Search Tree and why?

# When would you use an Heap and why?
