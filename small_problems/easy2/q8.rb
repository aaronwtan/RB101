# Sum or Product of Consecutive Integers
# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product
# of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

ABBREVIATION_TO_OPERATION = {'s' => 'sum', 'p' => 'product'}
OPERATION_TO_SYMBOL = { 'sum' => :+, 'product' => :* }

def prompt(message)
  puts ">> #{message}"
end

def get_positive_integer
  prompt("Please enter an integer greater than 0:")

  loop do
    integer = gets.to_i
    return integer if integer > 0

    prompt("Invalid input. Please enter an integer greater than 0.")
  end
end

def get_operation
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")

  loop do
    operation = gets.chomp.downcase
    return operation if %w(s p).include?(operation)

    prompt("Invalid input. Please enter 's' or 'p'.")
  end
end

def calculate_operation(max, operation)
  (1..max).inject(&OPERATION_TO_SYMBOL[operation])
end

max = get_positive_integer
operation = ABBREVIATION_TO_OPERATION[get_operation]

total = calculate_operation(max, operation)
puts "The #{operation} of the integers between 1 and #{max} is #{total}."
