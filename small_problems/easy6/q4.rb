# Write a method that takes an Array as an argument, and reverses
# its elements in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.
def reverse!(array)
  reversed_array = []
  array.size.times { reversed_array << array.pop }
  reversed_array.size.times { array << reversed_array.shift }
  array
end

# Examples:

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true

# Note: for the test case list = ['abc'], we want to reverse the elements in the array.
# The array only has one element, a String, but we're not reversing the String itself,
# so the reverse! method call should return ['abc'].
