# Write a method that takes a single integer as an argument,
# and returns the next featured number that is greater than the argument.
# Return an error message if there is no next featured number.

# featured number requirements:
# - odd
# - multiple of 7
# - digits occur exactly once each

def featured(num)
  (num + 1).upto(9_876_543_210) do |featured_num|
    if featured_num.odd? && featured_num % 7 == 0
      return featured_num if featured_num.digits.uniq == featured_num.digits
    end
  end
  'There is no possible number that fulfills those requirements.'
end

# Examples:
puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
