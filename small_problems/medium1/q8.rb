# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
# Examples:

def fibonacci(nth)
  return 1 if nth <= 2

  fibonacci(nth - 1) + fibonacci(nth - 2)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
