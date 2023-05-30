# Write a method that returns an Array that contains every other element
# of an Array that is passed in as an argument. The values
# in the returned list should be those values that are in the 1st, 3rd, 5th,
# and so on elements of the argument Array.

def oddities(array)
  odd_elements = []
  array.each_with_index { |element, i| odd_elements << element if i.even? }
  odd_elements
end

# def oddities(array)
#   array.select.with_index { |_, i| i.even? }
# end

# def oddities(array)
#   i = 0
#   array.each_with_object([]) do |element, odd_elements|
#     odd_elements << element if i.even?
#     i += 1
#   end
# end

# Examples:
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
puts oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
