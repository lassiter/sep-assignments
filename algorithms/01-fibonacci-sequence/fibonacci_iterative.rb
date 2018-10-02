
	def fib(n)
		if n <= 1
<<<<<<< HEAD
      return n
    elsif n == 2
      return 1
    end
		fib = 1
		prevFib = 1
    
    for i in 3..n
      temp = fib
      fib+= prevFib
      prevFib = temp
    end
=======
			return n
		end
		fib = 1
		prevFib = 1
		for i in 2..n
			temp = fib
			fib+= prevFib
			prevFib = temp
		end
>>>>>>> 9348cd469855a9dd8937b3c4486473a945a03216

		return fib
	end

  puts fib(0)
  puts fib(1)
  puts fib(2)
  puts fib(3)
  puts fib(4)
  puts fib(5)
  puts fib(6)
  puts fib(7)
  puts fib(8)
  puts fib(9)
