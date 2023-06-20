# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotated_num = rotate_string(integer.abs.to_s).to_i
  integer < 0 ? -rotated_num : rotated_num
end

# Example:
puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

puts rotate_string('apple') == 'pplea'
str = 'Launch School is cool!'
puts rotate_string(str) == 'aunch School is cool!L'
puts str == 'Launch School is cool!'

puts rotate_integer(1324) == 3241
puts rotate_integer(-3578) == -5783
puts rotate_integer(0) == 0
puts rotate_integer(102)
