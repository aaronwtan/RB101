# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

# Further Exploration

def power(num, exp)
  result = 1

  exp.abs.times { result = multiply(num, result) }

  result = 1.0 / result if exp.negative?

  result
end

# Example:

puts square(5) == 25
puts square(-8) == 64


puts power(5, 1) == 5
puts power(5, 2) == 25
puts power(5, 3) == 125
puts power(5, 4) == 625

puts power(5, -1) == 1 / 5.to_f
puts power(5, -2) == 1 / 25.to_f
puts power(5, -3) == 1 / 125.to_f