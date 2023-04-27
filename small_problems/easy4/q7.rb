# The String#to_i method converts a string of numeric characters
# (including an optional plus or minus sign) to an Integer.
# String#to_i and the Integer constructor (Integer()) behave similarly.
# In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns
# the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs,
# nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby
# to convert a string to a number, such as String#to_i, Integer(), etc.
# Your method should do this the old-fashioned way
# and calculate the result by analyzing the characters in the string.

DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0 }

def string_to_integer(string)
  digits_array = string.chars
  i = 0
  integer_sum = 0

  (digits_array.size - 1).downto(0) do |exponent|
    digit = DIGITS[digits_array[i]]
    integer_sum += digit * 10**exponent
    i += 1
  end

  integer_sum
end

# input: string of digits
# output: integer

# Examples

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


# Further Exploration
# Write a hexadecimal_to_integer method that converts a string
# representing a hexadecimal number to its integer value.

HEXADIGITS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
              '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
              'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15}

def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| HEXADIGITS[char] }

  digits.inject { |sum, digit| sum * 16 + digit }
end

puts hexadecimal_to_integer('4D9f') == 19871
