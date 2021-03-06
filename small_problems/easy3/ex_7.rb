# Write a method that returns an Array that contains every
# other element of an Array that is passed in as an argument.
# The values in the returned list should be those values that
# are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(arr)
  arr.select.with_index { |_, i| i.even? }
end

def evenities(arr)
  arr.select.with_index { |_, i| i.odd? }
end

def oddities2(arr)
  odds = []
  arr.each.with_index { |element, i| odds << element if i.even? }
  odds
end

def oddities3(arr)
  odds = []
  i = 0
  loop do
    break if i >= arr.size
    odds.push(arr[i])
    i += 2
  end
  odds
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []

puts oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities3(['abc', 'def']) == ['abc']
puts oddities3([123]) == [123]
puts oddities3([]) == []
