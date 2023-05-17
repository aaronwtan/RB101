# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series,
# but the results grow at an incredibly rapid rate. For example,
# the 100th Fibonacci number is 354,224,848,179,261,915,075 --
# that's enormous, especially considering that it takes 6 iterations
# before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number
# that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length(digits)
  return 1 if digits == 1

  fib_num1 = 1
  fib_num2 = 1
  index = 3

  loop do
    fibonacci = fib_num1 + fib_num2
    return index if fibonacci.to_s.size >= digits

    fib_num1 = fib_num2
    fib_num2 = fibonacci
    index += 1
  end
end

# Examples:

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847


# You may assume that the argument is always greater than or equal to 2.
