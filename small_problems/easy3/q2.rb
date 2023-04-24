# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

OPERATORS = %w(+ - * / % **)

def prompt(message)
  puts "==> #{message}"
end

numbers = []

prompt("Enter the first number:")
numbers << gets.to_i

prompt("Enter the second number:")
numbers << gets.to_i

OPERATORS.each do |operator|
  result = numbers.reduce(operator.to_sym)
  prompt("#{numbers[0]} #{operator} #{numbers[1]} = #{result}")
end
