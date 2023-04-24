# Write a method that takes a string argument, and returns true
# if all of the alphabetic characters inside the string are uppercase,
# false otherwise. Characters that are not alphabetic should be ignored.

def uppercase?(string)
  string == string.upcase
end

# Examples:

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
