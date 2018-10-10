require "pry"
require "benchmark"
require_relative "improving_complexity_version_one"
require_relative "improving_complexity_version_two"
require_relative "improving_complexity_version_three"


array = Array.new(5)

for i in 0..array.length-1
  array[i] = Array.new(5) {|index| index = rand(1..100)}.uniq
end


Benchmark.bm do |x|
  x.report("v1: ") { p poorly_written_ruby_1(array) }
  x.report("v2: ")  { p poorly_written_ruby_2(array)  }
  x.report("v3: ")  { p poorly_written_ruby_3(array)  }
end