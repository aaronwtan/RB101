# Write a method that takes an Array, and returns a new Array
# with the elements of the original list in reverse order.
# Do not modify the original list.

# You may not use Array#reverse or Array#reverse!,
# nor may you use the method you wrote in the previous exercise.

def reverse(array)
  reversed_array = []
  (array.size - 1).downto(0) { |i| reversed_array << array[i] }
  reversed_array
end

# Examples:
puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

# Further Exploration
# using Enumerable#inject

def reverse2(array)
  array.inject([], &:unshift)
end

puts reverse2([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse2(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse2(['abc']) == ['abc']              # => true
puts reverse2([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse2(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

# using Enumerable#each_with_object

def reverse3(array)
  array.each_with_object([]) { |element, reversed_array| reversed_array.unshift(element) }
end

puts reverse3([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse3(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse3(['abc']) == ['abc']              # => true
puts reverse3([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse3(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
