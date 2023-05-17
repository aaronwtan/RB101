# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half
# of the original Array, respectively. If the original array contains an odd number
# of elements, the middle element should be placed in the first half Array.

def halvsies(array)
  mid_index = (array.size / 2.0).ceil - 1

  first_half = array[0..mid_index]
  second_half = array[mid_index + 1..-1]

  [first_half, second_half]
end

# Examples:
puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
