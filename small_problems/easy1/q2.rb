# Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method returns true if the number's absolute value is odd.
# You may assume that the argument is a valid integer value.

def is_odd?(num)
  num % 2 != 0
end

# Examples:

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# Further Exploration

# The Integer#remainder method performs a remainder operation in Ruby. 
# Rewrite #is_odd? to use Integer#remainder instead of %

def is_odd_remainder?(num)
  num.remainder(2) != 0
end

puts "=> Using Integer#remainder:"
puts is_odd_remainder?(2)    # => false
puts is_odd_remainder?(5)    # => true
puts is_odd_remainder?(-17)  # => true
puts is_odd_remainder?(-8)   # => false
puts is_odd_remainder?(0)    # => false
puts is_odd_remainder?(7)    # => true