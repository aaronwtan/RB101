# Write a method named include? that takes an Array and a search value
# as arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.

def include?(array, search_value)
  array.count(search_value) > 0
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

puts include2?([1,2,3,4,5], 3) == true
puts include2?([1,2,3,4,5], 6) == false
puts include2?([], 3) == false
puts include2?([nil], nil) == true
puts include2?([], nil) == false
