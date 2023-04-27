# In the previous exercise, you developed a method that converts
# non-negative numbers to strings. In this exercise, you're going
# to extend that method by adding the ability
# to represent negative numbers as well.

# Write a method that takes an integer, and converts it
# to a string representation.

# You may not use any of the standard conversion methods available
# in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
# You may, however, use integer_to_string from the previous exercise.

DIGIT_STRINGS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  string = ''
  loop do
    integer, digit = integer.divmod(10)
    string.prepend(DIGIT_STRINGS[digit])
    break if integer.zero?
  end
  string
end

def signed_integer_to_string(integer)
  return '0' if integer.zero?

  sign = integer.negative? ? '-' : '+'
  sign + integer_to_string(integer.abs)
end

# Examples
puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
