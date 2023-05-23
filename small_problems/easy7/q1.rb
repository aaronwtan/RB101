# Write a method that combines two Arrays passed in as arguments,
# and returns a new Array that contains all elements
# from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty,
# and that they have the same number of elements.

def interleave(arr1, arr2)
  arr1.each_with_object([]) do |element, new_arr|
    new_arr << element << arr2[arr1.index(element)]
  end
end

# Example:
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def interleave_with_zip(arr1, arr2)
  arr1.zip(arr2).flatten
end

puts interleave_with_zip([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
