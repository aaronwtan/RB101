# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

def stringy(length)
  string = ''
  length.times do |index|
    number_str = index.even? ? '1' : '0'
    string << number_str
  end
  string
end

# Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# The tests above should print true.

# Further Exploration

# Modify stringy so it takes an additional optional argument that defaults to 1.
# If the method is called with this argument set to 0,
# the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy2(length, start_with = 1)
  string = ''
  length.times do |index|
    index += 1 if start_with == 0
    number_str = index.even? ? '1' : '0'
    string << number_str
  end
  string
end

# Examples:

puts stringy2(6) == '101010'
puts stringy2(9) == '101010101'
puts stringy2(4) == '1010'
puts stringy2(7) == '1010101'

puts stringy2(6, 0) == '010101'
puts stringy2(9, 0) == '010101010'
puts stringy2(4, 0) == '0101'
puts stringy2(7, 0) == '0101010'
