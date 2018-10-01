require 'benchmark'
require_relative "binary_search_iterative"
require_relative "binary_search_recursive"

def fib_recursive(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return fib_recursive(n-1) + fib_recursive(n-2)
  end
end

def fib_iterative(n)
  if n <= 1
    return n
  end
  fib = 1
  prevFib = 1

  for i in 2..n
    temp = fib
    fib+= prevFib
    prevFib = temp
  end

  return fib
end

puts "fibonacci comparison"
Benchmark.bm do |x|
  x.report("recursive:") { fib_recursive(20) }
  x.report("iterative:") { fib_iterative(20) }
end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
"q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

puts "input search: 't' at 19"
Benchmark.bm do |x|
  x.report("recursive: ") { puts bsr(alphabet, "t") }
  x.report("iterative: ") { puts bsi(alphabet, "t") }
end